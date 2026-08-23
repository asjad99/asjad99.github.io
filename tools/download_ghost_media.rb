#!/usr/bin/env ruby

require "fileutils"
require "json"
require "net/http"
require "openssl"
require "time"
require "uri"

ROOT = File.expand_path("..", __dir__)
EXPORT = File.expand_path("../asjad-k-phd.ghost.2026-08-20-10-13-24.json", ROOT)
BACKUP_DIR = File.join(ROOT, "backups", "ghost-export-2026-08-20")
MEDIA_DIR = File.join(ROOT, "assets", "img", "ghost")
MANIFEST_PATH = File.join(MEDIA_DIR, "manifest.json")

IMAGE_EXTENSIONS = %w[.avif .gif .jpeg .jpg .png .svg .webp].freeze
SOURCE_DIRS = %w[_posts _pages _projects _news _teachings _books].freeze
URL_PATTERN = %r{(?:https?:)?//[^\s"'<>]+}i

def image_url?(url)
  uri = URI.parse(url)
  path = uri.path.downcase
  host = uri.host.to_s.downcase
  IMAGE_EXTENSIONS.any? { |extension| path.end_with?(extension) } ||
    path.include?("/content/images/") ||
    host.include?("cdn-images") ||
    host.include?("substackcdn") ||
    host.include?("wordpress")
rescue URI::InvalidURIError
  false
end

def normalize_url(raw)
  url = raw.sub(/[),.;\\]+\z/, "")
  url.start_with?("//") ? "https:#{url}" : url
end

def urls_from(text)
  text.scan(URL_PATTERN).map { |raw| normalize_url(raw) }.select { |url| image_url?(url) }.uniq
end

def media_filename(url)
  uri = URI.parse(url)
  basename = File.basename(uri.path)
  basename = "image" if basename.nil? || basename.empty? || basename == "/"
  basename = basename.gsub(/[^A-Za-z0-9._-]/, "_")
  "#{Digest::SHA256.hexdigest(url)[0, 10]}-#{basename}"
rescue URI::InvalidURIError
  "#{Digest::SHA256.hexdigest(url)[0, 10]}-image"
end

def download(url, destination, redirects = 0)
  return [false, "too many redirects"] if redirects > 5

  uri = URI.parse(url)
  request = Net::HTTP::Get.new(uri)
  request["User-Agent"] = "personal-site-ghost-media-backup/1.0"
  Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == "https", open_timeout: 10, read_timeout: 30) do |http|
    response = http.request(request)
    if response.is_a?(Net::HTTPRedirection)
      location = response["location"]
      return [false, "redirect without location"] if location.nil? || location.empty?

      redirected_url = URI.join(url, location).to_s
      return download(redirected_url, destination, redirects + 1)
    end
    return [false, "HTTP #{response.code}"] unless response.is_a?(Net::HTTPSuccess)

    File.binwrite(destination, response.body)
    [true, response.code]
  end
rescue StandardError => e
  [false, "#{e.class}: #{e.message}"]
end

require "digest"
FileUtils.mkdir_p(BACKUP_DIR)
FileUtils.mkdir_p(MEDIA_DIR)
FileUtils.cp(EXPORT, File.join(BACKUP_DIR, File.basename(EXPORT)))

texts = [File.binread(EXPORT)]
source_files = SOURCE_DIRS.flat_map do |directory|
  Dir.glob(File.join(ROOT, directory, "**", "*.{md,html,liquid,yml,yaml}"))
end
source_files.each { |path| texts << File.binread(path) }
urls = texts.flat_map { |text| urls_from(text) }.uniq.sort

manifest = {}
failures = {}
mutex = Mutex.new
workers = urls.each_slice([(urls.length / 8.0).ceil, 1].max).map.with_index do |batch, worker_index|
  Thread.new do
    batch.each_with_index do |url, batch_index|
      index = worker_index * [(urls.length / 8.0).ceil, 1].max + batch_index
  relative_path = File.join("/assets/img/ghost", media_filename(url)).tr("\\", "/")
  destination = File.join(ROOT, relative_path.sub(%r{\A/}, ""))
  if File.file?(destination) && File.size(destination).positive?
    mutex.synchronize { manifest[url] = relative_path }
    next
  end

  ok, detail = download(url, destination)
  if ok
    mutex.synchronize { manifest[url] = relative_path }
  else
    mutex.synchronize { failures[url] = detail }
  end
  mutex.synchronize { puts "[#{index + 1}/#{urls.length}] #{ok ? 'saved' : 'FAILED'} #{url}#{ok ? '' : " (#{detail})"}" }
    end
  end
end
workers.each(&:join)

source_files.each do |path|
  original = File.binread(path)
  updated = original.dup
  manifest.each { |url, local_path| updated.gsub!(url, local_path) }
  File.binwrite(path, updated) if updated != original
end

File.write(MANIFEST_PATH, JSON.pretty_generate({
  "source_export" => File.basename(EXPORT),
  "downloaded_at" => Time.now.utc.iso8601,
  "total_image_urls" => urls.length,
  "downloaded" => manifest,
  "failed" => failures
}) + "\n")

puts "\nImage URLs found: #{urls.length}"
puts "Downloaded: #{manifest.length}"
puts "Failed: #{failures.length}"
puts "Manifest: #{MANIFEST_PATH}"
puts "Export backup: #{File.join(BACKUP_DIR, File.basename(EXPORT))}"
exit(failures.empty? ? 0 : 1)
