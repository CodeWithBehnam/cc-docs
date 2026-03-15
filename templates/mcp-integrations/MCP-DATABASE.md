# MCP Integration: Database Access

Connect Claude Code to databases for querying data, inspecting schemas, and debugging.

**Important**: Always use read-only connections. Never give Claude write access to production databases.

---

## PostgreSQL

### Add via CLI

```bash
claude mcp add postgres \
  --transport stdio \
  --env DATABASE_URL=postgresql://user:pass@localhost:5432/mydb \
  -- npx -y @anthropic-ai/mcp-server-postgres
```

### Or add to `.mcp.json`

```json
{
  "mcpServers": {
    "postgres": {
      "command": "npx",
      "args": ["-y", "@anthropic-ai/mcp-server-postgres"],
      "env": {
        "DATABASE_URL": "${DATABASE_URL}"
      }
    }
  }
}
```

### Read-Only Connection String

Always use a read-only user or connection:

```bash
# Create a read-only user in PostgreSQL
# psql -c "CREATE USER claude_readonly WITH PASSWORD 'pass';"
# psql -c "GRANT CONNECT ON DATABASE mydb TO claude_readonly;"
# psql -c "GRANT USAGE ON SCHEMA public TO claude_readonly;"
# psql -c "GRANT SELECT ON ALL TABLES IN SCHEMA public TO claude_readonly;"

export DATABASE_URL="postgresql://claude_readonly:pass@localhost:5432/mydb"
```

---

## MySQL

### Add to `.mcp.json`

```json
{
  "mcpServers": {
    "mysql": {
      "command": "npx",
      "args": ["-y", "@anthropic-ai/mcp-server-mysql"],
      "env": {
        "MYSQL_HOST": "localhost",
        "MYSQL_PORT": "3306",
        "MYSQL_USER": "${MYSQL_USER}",
        "MYSQL_PASSWORD": "${MYSQL_PASSWORD}",
        "MYSQL_DATABASE": "mydb"
      }
    }
  }
}
```

---

## SQLite

### Add to `.mcp.json`

```json
{
  "mcpServers": {
    "sqlite": {
      "command": "npx",
      "args": ["-y", "@anthropic-ai/mcp-server-sqlite", "./data/app.db"]
    }
  }
}
```

For read-only mode, some SQLite MCP servers accept a `--readonly` flag.

---

## Usage Examples

Once connected, you can ask Claude:

```text
> Show me the database schema
> What are the most common error types in the logs table from the last 24 hours?
> Find all users who signed up but never made a purchase
> Explain the relationship between the orders, products, and users tables
> Write a query to find duplicate email addresses
> What indexes exist on the orders table? Are there any missing indexes for common queries?
```

---

## Permission Configuration

Restrict database access in `.claude/settings.json`:

```json
{
  "permissions": {
    "allow": [
      "mcp__postgres__query",
      "mcp__postgres__list_tables",
      "mcp__postgres__describe_table"
    ],
    "deny": [
      "mcp__postgres__execute"
    ]
  }
}
```

---

## Safety with Hooks

Add a hook to block destructive SQL (belt-and-suspenders with read-only user):

Create `.claude/hooks/block-destructive-sql.sh`:

```bash
#!/bin/bash
INPUT=$(cat)
QUERY=$(echo "$INPUT" | jq -r '.tool_input.query // .tool_input.sql // empty')

if echo "$QUERY" | grep -iE '\b(DROP|DELETE|TRUNCATE|ALTER|INSERT|UPDATE|CREATE)\b' > /dev/null; then
  echo "Blocked: Destructive SQL operation detected" >&2
  exit 2
fi

exit 0
```

```bash
chmod +x .claude/hooks/block-destructive-sql.sh
```

Add to `.claude/settings.json`:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "mcp__postgres.*|mcp__mysql.*|mcp__sqlite.*",
        "hooks": [
          {
            "type": "command",
            "command": "\"$CLAUDE_PROJECT_DIR\"/.claude/hooks/block-destructive-sql.sh"
          }
        ]
      }
    ]
  }
}
```

---

## Tips

- Always use a read-only database user, even with hook protections
- Use connection strings from environment variables, never hardcode credentials
- For production databases, connect through a read replica
- Set `DATABASE_URL` in your shell profile or `.env` file
- Use `.mcp.json` in project root for team-shared config (credentials via env vars)
- Test connectivity with `claude mcp list` after setup
