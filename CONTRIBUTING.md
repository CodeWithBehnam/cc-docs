# Contributing to Claude Code Docs

Thanks for your interest in contributing! This repo is an auto-updated mirror of the official Claude Code documentation, so most content is generated automatically. That said, there are several ways you can help.

## Ways to Contribute

### Report Issues
- **Broken docs**: If a doc page fails to download or renders incorrectly, open an issue.
- **Script bugs**: If the download script has a bug or compatibility issue, let us know.
- **Missing pages**: If a new doc page exists on code.claude.com but isn't being picked up, file an issue.

### Improve the Cheatsheets
The `cheatsheets/` folder contains community-maintained quick references. You can:
- Fix errors or outdated info in existing cheatsheets
- Improve formatting or add missing commands
- Add tips and gotchas you've discovered

### Improve the Download Script
- Better error handling
- Performance improvements
- Cross-platform compatibility fixes

## How to Submit Changes

1. Fork the repository
2. Create a feature branch: `git checkout -b my-fix`
3. Make your changes
4. Commit with a clear message: `git commit -m "fix: description of change"`
5. Push to your fork: `git push origin my-fix`
6. Open a Pull Request

## Guidelines

- Keep cheatsheets concise and scannable
- Don't modify auto-downloaded doc files directly (they'll be overwritten hourly)
- Test the download script on Linux if you change it (`Scripts/download-cc-docs.sh`)
- Follow existing formatting conventions

## Questions?

Open an issue and we'll get back to you.
