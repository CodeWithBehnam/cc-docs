# Plugin Template: Code Intelligence with LSP

A Claude Code plugin that provides language-aware code intelligence via an LSP (Language Server Protocol) server.

---

## What LSP Plugins Do

LSP plugins give Claude deeper code understanding:
- Jump to definitions across files
- Find all references to a symbol
- Get type information and documentation
- Navigate import chains and dependencies
- Understand project-wide symbol relationships

This is especially valuable for languages or frameworks where static analysis helps (TypeScript, Python, Go, Rust, Java).

---

## Directory Structure

```text
my-lsp-plugin/
├── .claude-plugin/
│   └── plugin.json          # Plugin manifest
├── .lsp.json                # LSP server configuration
├── skills/
│   └── navigate/
│       └── SKILL.md         # Navigation skill using LSP
└── README.md
```

---

## Plugin Manifest

`.claude-plugin/plugin.json`:

```json
{
  "name": "my-lsp-plugin",
  "version": "1.0.0",
  "description": "Code intelligence for <language> via LSP",
  "author": {
    "name": "Your Name"
  },
  "lspServers": "./.lsp.json",
  "skills": "./skills/"
}
```

---

## LSP Server Configuration

`.lsp.json`:

```json
{
  "lspServers": {
    "<language>": {
      "command": "<lsp-binary>",
      "args": ["<args>"],
      "languages": ["<language-id>"],
      "initializationOptions": {}
    }
  }
}
```

### TypeScript Example

```json
{
  "lspServers": {
    "typescript": {
      "command": "npx",
      "args": ["typescript-language-server", "--stdio"],
      "languages": ["typescript", "typescriptreact", "javascript", "javascriptreact"]
    }
  }
}
```

### Python Example

```json
{
  "lspServers": {
    "python": {
      "command": "pylsp",
      "languages": ["python"],
      "initializationOptions": {
        "pylsp.plugins.pyflakes.enabled": true,
        "pylsp.plugins.pycodestyle.enabled": false
      }
    }
  }
}
```

### Go Example

```json
{
  "lspServers": {
    "go": {
      "command": "gopls",
      "languages": ["go"],
      "initializationOptions": {
        "analyses": {
          "unusedparams": true,
          "shadow": true
        }
      }
    }
  }
}
```

### Rust Example

```json
{
  "lspServers": {
    "rust": {
      "command": "rust-analyzer",
      "languages": ["rust"]
    }
  }
}
```

---

## Navigation Skill (Optional)

`skills/navigate/SKILL.md`:

```yaml
---
name: navigate
description: >
  Deep code navigation using LSP intelligence.
  Use when tracing code paths, finding references,
  or understanding how components connect.
argument-hint: "[symbol or file:line]"
---

## Task

Navigate and trace $ARGUMENTS through the codebase:

1. Find the definition of the symbol
2. Find all references and usages
3. Trace the call chain (callers and callees)
4. Identify the module boundaries and interfaces
5. Map the dependency graph

## Output

Provide:
- **Definition**: Where the symbol is defined (file:line)
- **References**: All usages across the codebase
- **Call chain**: How data flows through the symbol
- **Dependencies**: What this symbol depends on and what depends on it
- **Interface boundaries**: Public API surface this belongs to
```

---

## Common LSP Servers

| Language | Server | Install |
|----------|--------|---------|
| TypeScript/JS | `typescript-language-server` | `npm i -g typescript-language-server typescript` |
| Python | `python-lsp-server` | `pip install python-lsp-server` |
| Go | `gopls` | `go install golang.org/x/tools/gopls@latest` |
| Rust | `rust-analyzer` | Via `rustup component add rust-analyzer` |
| Ruby | `solargraph` | `gem install solargraph` |
| Java | `jdtls` | Download from Eclipse |
| C/C++ | `clangd` | Via system package manager |
| PHP | `intelephense` | `npm i -g intelephense` |

---

## Installation

```bash
# Install the LSP server binary first
npm install -g typescript-language-server typescript

# Then install the plugin
claude plugin install /path/to/my-lsp-plugin

# Verify LSP is connected
/plugins
```

---

## Tips

- LSP servers must be installed separately (they're not bundled with the plugin)
- The `languages` array uses VS Code language identifiers
- `initializationOptions` are server-specific, check each server's docs
- LSP provides Claude with go-to-definition and find-references capabilities
- Most useful for large codebases where static analysis saves exploration time
- LSP servers run as long-lived processes alongside Claude Code
