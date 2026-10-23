_October 2026 · Missing Semester_

The terminal is a window where you type commands instead of clicking. It looks old-fashioned, but it is faster for many jobs, and almost every developer tool expects you to use it. On a Mac it is the **Terminal** app; the program reading your commands is called the *shell* (on a Mac, usually `zsh`).

These are the ten groups of commands I actually use, taken from my own command history. Each line starting with `#` is a comment for you; the terminal ignores it.

### 1. Move around: `cd`, `pwd`, `ls`, `clear`

```bash
pwd                              # print working directory: "where am I?"
ls                               # list files here
ls -lh                           # long list with human-readable sizes (12K, 3.4G)
ls -d .git                       # check one thing exists, without listing inside it
cd Documents                     # go into a folder
cd ..                            # go up one level
cd ~                             # go home (~ means your home folder)
cd ~/Desktop/my-project          # go straight to a path
cd "/Users/me/Documents/Build with AI"   # quotes when a name has spaces
clear                            # wipe the screen (nothing is deleted)
```

Press **Tab** to auto-complete names (type `cd Do` then Tab → `cd Documents`); it also adds the backslashes for spaces for you.

### 2. Read files and your history: `cat`, `tail`, `history`

```bash
cat notes.md                     # print a whole file
tail -n 50 ~/.zsh_history        # print only the last 50 lines
history                          # your recent commands, numbered
```

`tail` is great for logs and big files, where `cat` would flood the screen.

### 3. Open and run things: `open`, `./script`, `python3`

```bash
open "My App.app"                # open a file or app as if you double-clicked it (Mac)
open .                           # open this folder in Finder
./dev.sh                         # run a script in this folder (./ means "here")
./dev.sh restart                 # ...with an argument
python3 -m pytest                # run a Python tool as a module (here: the tests)
python3 -m my_package status     # run your own package's command
python3 -c "print(2 + 2)"        # run one line of Python
.build/debug/HealthTracking      # run a program you just built
opencode                         # start a command-line app (here: an AI coding agent)
.venv/bin/mkdocs serve --dev-addr 127.0.0.1:8002   # run a tool from a project's virtual environment
```

If `./dev.sh` says "permission denied", the file is not marked as runnable. See section 9.

### 4. Install apps and tools: `brew`

Homebrew is the Mac's app store for the terminal.

```bash
brew install node                # install a tool
brew install cmake libomp pnpm   # several at once
brew                             # with no arguments: show help
```

### 5. Language package managers: `npm`, `nvm`, `pnpm`, `pip`, `uv`

Each language has its own installer for libraries.

```bash
node -v                          # which version of Node.js?
nvm install                      # install the Node version this project asks for
nvm                              # with no arguments: show help
npm install                      # install the project's JavaScript libraries
npm run dev                      # run the project's "dev" script (see package.json)
npm run refresh -- --mode=missing   # everything after -- is passed to the script
corepack enable                  # turn on Node's built-in helper for pnpm/yarn
corepack prepare pnpm@11.0.9 --activate   # pin an exact pnpm version
pnpm -v
pnpm --dir frontend install      # install in a sub-folder without cd-ing into it
pip install -U pip setuptools wheel  # -U means upgrade
python3 -m pip install -U autogluon --extra-index-url https://download.pytorch.org/whl/cpu
                                 # also look in an extra package index (CPU-only PyTorch here)
python -m ensurepip --upgrade    # repair or install pip itself
uv --version                     # uv: a much faster Python installer
```

Tip: `python3 -m pip` makes sure you install into the same Python you run. Plain `pip` sometimes points to another one.

### 6. Install scripts from the web: `curl ... | bash`

```bash
curl -fsSL https://example.com/install.sh | bash
```

Homebrew's official form does the same thing a different way:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

`curl` downloads the script; the `|` (pipe) hands it straight to `bash` to run. Homebrew, nvm and uv all install this way. It is convenient but it runs whatever the website sends, so only do it for sources you trust, typed from their official page.

### 7. Environment variables: `export`, `source`, `eval`

Settings that programs read, like which AI model to use.

```bash
export OPENAI_MODEL="gpt-5"      # set a variable for this terminal window
echo $OPENAI_MODEL               # read it back
source "$HOME/.local/bin/env"    # run a settings file in THIS shell (so its exports stick)
eval "$(ssh-agent -s)"           # run the commands that another program prints
```

**Never type real API keys into the terminal.** Every command is saved in `~/.zsh_history` in plain text, so `export OPENAI_API_KEY="sk-..."` leaves your secret in a file anyone can read. Put keys in a `.env` file instead, add `.env` to `.gitignore`, and let the app load it. If a key ever lands in your history or in a commit: revoke it, make a new one, and delete those lines.

### 8. Ports and stuck programs: `lsof`, `kill`

"Port 8000 is already in use" means an old program is still running.

```bash
lsof -i :8000                    # who is using port 8000? (shows a PID number)
kill 29896                       # ask that program to stop
kill -9 29896                    # force it to stop
kill -9 29907 29909              # several at once
kill -9 $(lsof -ti :5173) 2>/dev/null   # find AND kill whatever uses port 5173, quietly
```

Try plain `kill` first; `-9` gives the program no chance to save or clean up.

### 9. Permissions and disk space: `chmod`, `df`

```bash
chmod 0600 ~/.ssh/my_key         # only I can read/write this file (SSH insists on this for keys)
chmod +x dev.sh                  # make a script runnable
df -h ~/Desktop                  # how much disk space is free? (-h = human-readable)
```

### 10. Remote computers: `ssh`

```bash
ssh my-server                    # log in to another computer
ssh -T git@github.com            # test your GitHub key (see the Git post)
```

Typing `ssh user@203.0.113.5 -i ~/.ssh/key` every time is tedious. Give servers short names in `~/.ssh/config`:

```
Host my-server
  HostName 203.0.113.5
  User ubuntu
  IdentityFile ~/.ssh/my_key
```

Now `ssh my-server` is enough.

### Shell symbols worth knowing

| Symbol | Meaning | Example |
|---|---|---|
| `~` | your home folder | `cd ~/Desktop` |
| `.` / `..` | this folder / the folder above | `open .`, `cd ..` |
| `"..."` or `\ ` | keep a name with spaces together | `cd "Build with AI"` |
| `\` at line end | command continues on the next line | long `python3 script.py \` commands |
| <code>&#124;</code> | send output of one command into another | <code>curl ... &#124; bash</code> |
| `$( )` | use a command's output inside another | `kill -9 $(lsof -ti :5173)` |
| `2>/dev/null` | hide error messages | `kill ... 2>/dev/null` |
| `--` | "the rest is for the script, not for me" | `npm run refresh -- --rate=240` |
| `$VAR` | the value of a variable | `echo $HOME` |

And two keys: **↑** brings back your last command; **Ctrl+C** stops whatever is running.

**Sources:** [MIT: The Missing Semester — The Shell](https://missing.csail.mit.edu/2020/course-shell/) · [MIT: Shell Tools and Scripting](https://missing.csail.mit.edu/2020/shell-tools/) · [Homebrew](https://brew.sh/) · [npm docs: npm run](https://docs.npmjs.com/cli/commands/npm-run-script) · [uv docs](https://docs.astral.sh/uv/) · [GitHub: Connecting with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
