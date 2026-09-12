# Contributing

## Bugs & changes

1. Open an issue describing the problem.
2. PR against `main` — one concern per PR, keep commits tidy.
3. Update STATUS.md if badge requirements shifted.

## Running the checker

```bash
./check.sh
```

Requires `gh` CLI with a logged-in account. Read-only — no token scopes needed beyond `repo:public_repo` for read.

## Style

- Markdown: tables for structured data, no emoji spam.
- Shell: `set -euo pipefail`, no external deps beyond `gh`.