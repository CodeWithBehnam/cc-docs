# Purpose

Create a new Codex CLI agent to execute the command.

## Variables

DEFAULT_MODEL: gpt-5.1-codex-max
HEAVY_MODEL: gpt-5.1-codex-max
BASE_MODEL: gpt-5.1-codex-max
FAST_MODEL: gpt-5.1-codex-mini

## Instructions

- Before executing the command, run `codex --help` to understand the command and its options.
- Always use interactive mode (so leave off -p and use positional prompt if needed)
- For the -m (model) argument, use the DEFAULT_MODEL if not specified. If 'fast' is requested, use the FAST_MODEL. If 'heavy' is requested, use the HEAVY_MODEL.
- Always run with `--dangerously-bypass-approvals-and-sandbox`
