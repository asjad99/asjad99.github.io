---
layout: post
title: "Exploring data via Command-Line"
date: 2017-01-04 11:47:00 +0000
permalink: /blog/2017/01/exploring-data-via-command-line/
tags: ["data engineering"]
---

<p>Before data modelling or any sort of data analysis its important to manually explore what data you have at hand. EDA always precedes formal (confirmatory) data analysis. EDA is useful for:</p><ul><li>Detection of mistakes</li><li>Checking of assumptions</li><li>Determining relationships among the explanatory variables</li><li>Assessing the direction and rough size of relationships between explanatory and outcome variables</li><li>Preliminary selection of appropriate models of the relationship between an outcome variable and one or more explanatory variables.</li></ul><p>Most of the time these datasets are huge and available remotely at a server. Command line as the advantage of providing a so-called read-eval-print-loop (REPL) and can play a complimentary role in your existing toolset of data analysis. </p><p>Most folks are already familiar with commands like pwd, echo, cd and head. In this post we will look at some of new command line utilities that can be used to: </p><ul><li>Look at your data - its properties and total entries etc.</li><li>compute descriptive statistics from your data</li></ul><p><strong>Warm-Up: </strong></p><p>There are various way of getting the data APIs, web-scrapping and using direct downloads are the common ways. e.g curl allows us to download a file located on some server. </p><pre><code>curl -s http://www.gutenberg.org/files/64207/64207-0.txt -o med8.txt</code></pre><p>this downloads a random textbook from gutenberg website. we can check the author and title as follows: </p><pre><code> grep -i Title med8.txt | head -n 1
</code></pre><p>which will output:  <em>Title: Of Medicine in Eight Books</em></p><pre><code>grep -i Author med8.txt | head -n 1
</code></pre><p>output: Author: Aulus Cornelius Celsus</p><pre><code>tr ' ' '\n' &lt; med8.txt | grep Medicine | wc -l</code></pre><p>output: 10 #the no. of time Medicine appears in the book</p><p>Can we count what the most common words appearing in the book? Yes, Try the following: </p><pre><code> &lt; med8.txt tr '[:upper:]' '[:lower:]' | grep -oE '\w{2,}' | grep -E '^.*$' | sort | uniq -c | sort -nr | head -n 10</code></pre><p><strong>Data Formats: </strong></p><p>Data comes and it comes in various formats like JSON, XML and CSV. In this post we stick with CSV which is a <em>a delimited </em><a href="https://en.wikipedia.org/wiki/Text_file"><em>text file</em></a><em> that uses a </em><a href="https://en.wikipedia.org/wiki/Comma"><em>comma</em></a><em> to separate values. </em></p><p>Kaggle is another interesting website for downloading datasets and there are various useful datasets available in nice formats. Lets go ahead and download a weblog dataset [1] which represents a log of server requests and is available in csv format. </p><p><strong>Initial Exploration: </strong></p><p>A useful utility to explore datasets in csv format is 'csvkit'. Lets go ahead and install it by running: </p><pre><code>pip install csvkit</code></pre><p>once installed we can go ahead and check if the file has a header: </p><pre><code>head weblog.csv | csvlook</code></pre><figure class="kg-card kg-image-card"><img src="https://asjadkhan.ghost.io/content/images/2021/01/Screen-Shot-2021-01-04-at-6.34.16-pm.png" class="kg-image" alt="" loading="lazy" width="1912" height="450" srcset="https://asjadkhan.ghost.io/content/images/size/w600/2021/01/Screen-Shot-2021-01-04-at-6.34.16-pm.png 600w, https://asjadkhan.ghost.io/content/images/size/w1000/2021/01/Screen-Shot-2021-01-04-at-6.34.16-pm.png 1000w, https://asjadkhan.ghost.io/content/images/size/w1600/2021/01/Screen-Shot-2021-01-04-at-6.34.16-pm.png 1600w, https://asjadkhan.ghost.io/content/images/2021/01/Screen-Shot-2021-01-04-at-6.34.16-pm.png 1912w" sizes="(min-width: 720px) 720px"></figure><p>alternatively we can also make use of sed:</p><pre><code>&lt; weblog.csv sed -e 's/,/\n/g;q' 

</code></pre><p>we can see the main columns are  IP, Time, URL, Response Status.</p><p>To check number of rows:</p><pre><code>wc -l weblog.csv
</code></pre><p>output: <em>16008 weblog.csv</em></p><p>Let's say we want to filter and have a look at login requests. we can make use a of common utility known as grep. </p><pre><code> grep /login.php weblog.csv
</code></pre><figure class="kg-card kg-image-card"><img src="https://asjadkhan.ghost.io/content/images/2021/01/Screen-Shot-2021-01-04-at-6.40.30-pm.png" class="kg-image" alt="" loading="lazy" width="1310" height="590" srcset="https://asjadkhan.ghost.io/content/images/size/w600/2021/01/Screen-Shot-2021-01-04-at-6.40.30-pm.png 600w, https://asjadkhan.ghost.io/content/images/size/w1000/2021/01/Screen-Shot-2021-01-04-at-6.40.30-pm.png 1000w, https://asjadkhan.ghost.io/content/images/2021/01/Screen-Shot-2021-01-04-at-6.40.30-pm.png 1310w" sizes="(min-width: 720px) 720px"></figure><p>Turns out there are too many such lines. Here we can make use of 'less' which allows us to scroll horizontally without loading the whole thing in memory. </p><pre><code>less -S weblog.csv</code></pre><p>Press G to reach the end of file. and For a nicer neat print you can try </p><pre><code>&lt; file.csv csvlook | less -S
</code></pre><p>what if the file is present on a remote server? simple append </p><pre><code>ssh myserver weblog.csv | grep /login.php </code></pre><p>and again use '<em>less</em>' to avoid streaming the whole (potentially BIG !) file on your machine. </p><p>How about if we want to extract second and third column? </p><pre><code>cut -d , -f 2,3 weblog.csv</code></pre><p><strong>Descriptive Statistics: </strong></p><p>How about some basic stats? csvstat provides an awesome summary: </p><pre><code>csvstat weblog.csv
</code></pre><pre><code> 1. "IP"

	Type of data:          Text
	Contains null values:  False
	Unique values:         16
	Longest value:         10 characters
	Most common values:    10.128.2.1 (4257x)
	                       10.131.0.1 (4198x)
	                       10.130.2.1 (4056x)
	                       10.129.2.1 (1652x)
	                       10.131.2.1 (1626x)

  2. "Time"

	Type of data:          Text
	Contains null values:  False
	Unique values:         7307
	Longest value:         26 characters
	Most common values:    cannot (167x)
	                       [16/Nov/2017:15:51:03 (44x)
	                       [16/Nov/2017:16:12:16 (28x)
	                       [16/Nov/2017:16:17:31 (28x)
	                       [17/Nov/2017:05:53:36 (26x)

  3. "URL"

	Type of data:          Text
	Contains null values:  False
	Unique values:         314
	Longest value:         76 characters
	Most common values:    GET /login.php HTTP/1.1 (3284x)
	                       GET /home.php HTTP/1.1 (2640x)
	                       GET /js/vendor/modernizr-2.8.3.min.js HTTP/1.1 (1415x)
	                       GET / HTTP/1.1 (861x)
	                       GET /contestproblem.php?name=RUET%20OJ%20Server%20Testing%20Contest HTTP/1.1 (467x)

  4. "Staus"

	Type of data:          Text
	Contains null values:  False
	Unique values:         13
	Longest value:         12 characters
	Most common values:    200 (11330x)
	                       302 (3498x)
	                       304 (658x)
	                       404 (251x)
	                       No (167x)

Row count: 16007
</code></pre><p>we can further check for stats like min, mean, max etc. e.g to find out the unique value in each column we can start with 'csvstat' which gives unique values for each column:</p><pre><code>
csvstat weblog.csv --unique 

</code></pre><p>this will output:</p><ol><li>IP: 16 2. Time: 7307 3. URL: 314 4. Staus: 13</li></ol><p><strong>Data Wrangling and Cleaning: </strong></p><p>The data we acquire is often noisy and messy. It comes with missing values, inconsistencies, errors. We need tools that can help clean that data. One way is to use <em>sed</em>, which can do all sorts of interesting things using the power of regular expression. </p><p>To get started, let's say we want to remove first few lines with sed: </p><pre><code>&lt; weblog.csv sed tail -n +4</code></pre><p> lets say we want to search and replace a certain piece of text.</p><pre><code>sed s/REGEX/SUBSTITUTION/'</code></pre><p>where <code>REGEX</code> is the regular expression we want to apply for search, and <code>SUBSTITUTION</code> is the text we want to substitute the matching text(if found).</p><pre><code>sed 's/.*HTTP/HTTPS/' weblog.csv </code></pre><p>Reordering of Columns is a common operation: </p><pre><code>&lt; weblog.csv csvcut -c Time,URL,Staus,IP | head -n 5 | csvlook</code></pre><figure class="kg-card kg-image-card"><img src="https://asjadkhan.ghost.io/content/images/2021/01/Screen-Shot-2021-01-05-at-6.51.08-pm.png" class="kg-image" alt="" loading="lazy" width="1344" height="302" srcset="https://asjadkhan.ghost.io/content/images/size/w600/2021/01/Screen-Shot-2021-01-05-at-6.51.08-pm.png 600w, https://asjadkhan.ghost.io/content/images/size/w1000/2021/01/Screen-Shot-2021-01-05-at-6.51.08-pm.png 1000w, https://asjadkhan.ghost.io/content/images/2021/01/Screen-Shot-2021-01-05-at-6.51.08-pm.png 1344w" sizes="(min-width: 720px) 720px"></figure><p>How about filtering(removing) the 200 status row (likely not useful for degbugging when looking at logs: </p><pre><code> csvgrep -c staus -i -r "200" weblog.csv | csvlook</code></pre><figure class="kg-card kg-image-card"><img src="https://asjadkhan.ghost.io/content/images/2021/01/Screen-Shot-2021-01-05-at-6.57.39-pm.png" class="kg-image" alt="" loading="lazy" width="2000" height="284" srcset="https://asjadkhan.ghost.io/content/images/size/w600/2021/01/Screen-Shot-2021-01-05-at-6.57.39-pm.png 600w, https://asjadkhan.ghost.io/content/images/size/w1000/2021/01/Screen-Shot-2021-01-05-at-6.57.39-pm.png 1000w, https://asjadkhan.ghost.io/content/images/size/w1600/2021/01/Screen-Shot-2021-01-05-at-6.57.39-pm.png 1600w, https://asjadkhan.ghost.io/content/images/2021/01/Screen-Shot-2021-01-05-at-6.57.39-pm.png 2000w" sizes="(min-width: 720px) 720px"></figure><pre><code>&lt; weblog.csv awk -F, '($4 == 404)' | csvlook -I</code></pre><p>This filters the rows and finds the ones with 404 status code: </p><figure class="kg-card kg-image-card"><img src="https://asjadkhan.ghost.io/content/images/2021/01/Screen-Shot-2021-01-05-at-7.05.23-pm.png" class="kg-image" alt="" loading="lazy" width="1420" height="386" srcset="https://asjadkhan.ghost.io/content/images/size/w600/2021/01/Screen-Shot-2021-01-05-at-7.05.23-pm.png 600w, https://asjadkhan.ghost.io/content/images/size/w1000/2021/01/Screen-Shot-2021-01-05-at-7.05.23-pm.png 1000w, https://asjadkhan.ghost.io/content/images/2021/01/Screen-Shot-2021-01-05-at-7.05.23-pm.png 1420w" sizes="(min-width: 720px) 720px"></figure><h3 id="conclusion">Conclusion: </h3><p>Linux is fun and provides some really nice tools for familiarize yourself with the data. Thats the first step for extracting any value out of that dataset. We started with some tools that can be used for inspecting the data and its properties. We then learned how to compute basic descriptive statistics. In the next post we will look at exploring data via visualisations. </p><hr><p>[1] <a href="https://www.kaggle.com/shawon10/web-log-dataset?select=weblog.csv">https://www.kaggle.com/shawon10/web-log-dataset?select=weblog.csv</a></p><p>[2] <a href="https://www.datascienceatthecommandline.com/1e/">https://www.datascienceatthecommandline.com/1e/</a></p><p>[3] <a href="https://missing.csail.mit.edu/2020/data-wrangling/">https://missing.csail.mit.edu/2020/data-wrangling/</a></p><p>[4] <a href="https://drive.google.com/file/d/1DEJDUeDM5XXM_N-4QCNxuRwtgws0nzzk/view">https://drive.google.com/file/d/1DEJDUeDM5XXM_N-4QCNxuRwtgws0nzzk/view</a></p>
