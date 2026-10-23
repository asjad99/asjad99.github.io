# Notes: commands seen in Asjad's shell history (2026-10)

Sanitised. Secrets, client names, hostnames and private paths removed.

- Git: config (name, email, --list), clone (https, ssh), add (., quoted/escaped file), commit -m, push, fetch origin pull/N/head:branch, checkout.
- GitHub auth: ssh-keygen ed25519, ssh-agent via eval, ssh-add, cat .pub, ssh -T git@github.com, gh auth login.
- Navigation: cd (quotes, ~, ..), pwd, ls (-d, -lh), clear, Tab completion.
- Reading: cat, tail -n, history.
- Running: open, ./dev.sh [restart], python3 -m module, python3 -c, built binaries, mkdocs serve from venv, opencode.
- Installers: brew, curl|bash (Homebrew, nvm, uv), npm install/run (with --), nvm, corepack enable/prepare, pnpm --dir, pip -U, python -m ensurepip, --extra-index-url, uv.
- Env: export, source, eval. **Lesson: API keys were exported in plain text and saved to history → move to .env, revoke and rotate.**
- Processes: lsof -i :PORT, lsof -ti, kill -9 PID(s), $(...) and 2>/dev/null.
- System: chmod 0600 key, df -h, ssh host aliases.
