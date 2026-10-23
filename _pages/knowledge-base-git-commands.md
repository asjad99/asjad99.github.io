---
layout: page
title: "Top 10 Git Commands"
permalink: /knowledge-base/git-commands/
description: The ten Git commands that cover almost all everyday work, explained for beginners.
---

_October 2026 · Missing Semester_

<p><em>Researched and drafted with AI assistance, then reviewed by me. <a href="/knowledge-base/">← Back to Knowledge Base</a></em></p>

Git is a program that keeps the history of a folder. Each time you save a "snapshot", Git remembers exactly what every file looked like. GitHub is a website that stores a copy of that history online, so you can back it up and share it. Git runs on your computer; GitHub is where your copy lives on the internet.

You do not need hundreds of commands. Most days I use the same ten. Here they are, in the order you meet them.

### 1. `git config`: tell Git who you are

Every snapshot records an author. Set your name and email once per computer:

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --list            # show every setting, to check
```

`--global` means "for all projects on this computer". Use the same email as your GitHub account, so GitHub links your work to you.

### 2. `git clone`: copy a project to your computer

```bash
git clone https://github.com/owner/project.git      # HTTPS: works anywhere, may ask you to log in
git clone git@github.com:owner/project.git          # SSH: uses your SSH key (see the box at the end)
cd project
```

This makes a new folder with all the files and the full history. Run it **once** per project. If the folder already exists, Git refuses. Just `cd` into the existing folder.

### 3. `git status`: what changed?

```bash
git status
```

This is the command to run when you are unsure. It lists changed files, new files Git is not tracking yet, and files ready to be saved. It never changes anything, so it is always safe.

### 4. `git add`: choose what goes into the next snapshot

```bash
git add resources.md          # one file
git add "Data Layer.md"       # a name with a space: use quotes...
git add Data\ Layer.md        # ...or a backslash before the space
git add .                     # everything changed in this folder
```

Think of `add` as putting items in a box before you seal it. `git add .` is quick, but check `git status` first so you do not box up a secret file or a 2 GB dataset by mistake.

### 5. `git commit -m`: seal the snapshot

```bash
git commit -m "Fix broken link in resources page"
```

The message is a note to your future self. "updates" tells you nothing in six months. A good message says *what* changed and, if it is not obvious, *why*: "Add data-layer notes for planning doc".

### 6. `git push`: send your snapshots to GitHub

```bash
git push
```

Commits stay on your computer until you push. If push is **rejected**, someone else pushed first. Run `git pull` (next), then push again.

### 7. `git pull`: get other people's changes

```bash
git pull
```

This downloads new commits from GitHub and merges them into your files. Make it a habit to pull before you start work. You will meet far fewer conflicts.

### 8. `git fetch`: download without changing your files

```bash
git fetch origin                                    # see what's new, touch nothing
git fetch origin pull/9/head:fix-opencode-cli       # copy pull request #9 into a local branch
```

`fetch` is the careful cousin of `pull`: it downloads but does not merge. The second line is a useful trick. It copies someone's GitHub pull request (number 9 here) into a branch on your computer called `fix-opencode-cli`, so you can test it before it is merged. `origin` is just Git's nickname for "the GitHub copy I cloned from".

### 9. `git checkout` / `git switch`: move between branches

A branch is a separate line of work, so you can try something without breaking the main version.

```bash
git switch fix-opencode-cli        # go to an existing branch (newer, clearer command)
git checkout fix-opencode-cli      # same thing, older command you will see everywhere
git switch -c my-experiment        # create a new branch and move to it
git switch main                    # go back to the main line
```

Commit or put away your changes before you switch. Otherwise Git may refuse, to protect your work.

### 10. `git log` and `git diff`: look before you leap

```bash
git log --oneline     # the history, one line per commit
git diff              # exactly which lines changed and are not yet staged
git diff --staged     # what is in the box, ready to commit
```

`diff` before `commit` is the cheapest code review you will ever get.

### The everyday loop

```bash
git pull
# ...edit files...
git status
git add .
git commit -m "Say what changed"
git push
```

### Box: connect your computer to GitHub (once)

GitHub needs to know your computer is really you. The safest way is an **SSH key**: a pair of files, one private (never share it) and one public (give it to GitHub).

```bash
ssh-keygen -t ed25519 -C "you@example.com"   # make the key pair (press Enter for the default place)
eval "$(ssh-agent -s)"                       # start the helper that remembers your key
ssh-add ~/.ssh/id_ed25519                    # give it your private key
cat ~/.ssh/id_ed25519.pub                    # print the PUBLIC key; paste it into GitHub → Settings → SSH keys
ssh -T git@github.com                        # test: "Hi <name>! You've successfully authenticated"
```

Prefer not to manage keys? GitHub's own tool does the login for you:

```bash
gh auth login
```

**Sources:** [Pro Git book](https://git-scm.com/book/en/v2) · [Git reference](https://git-scm.com/docs) · [GitHub: Connecting with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh) · [GitHub: Checking out pull requests locally](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests/checking-out-pull-requests-locally) · [MIT: The Missing Semester — Version Control](https://missing.csail.mit.edu/2020/version-control/)
