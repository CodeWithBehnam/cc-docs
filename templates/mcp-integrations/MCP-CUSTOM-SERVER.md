# MCP Integration: Build Your Own MCP Server

Templates for creating custom MCP servers that extend Claude Code with your own tools.

---

## Option 1: Stdio Server (Node.js)

Best for: local tools, file-based operations, CLI wrappers.

### Server Code

Create `mcp-server/index.js`:

```javascript
#!/usr/bin/env node
import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";
import { z } from "zod";

const server = new McpServer({
  name: "my-tools",
  version: "1.0.0",
});

// Define a tool
server.tool(
  "search_docs",
  "Search internal documentation by keyword",
  {
    query: z.string().describe("Search query"),
    limit: z.number().optional().default(10).describe("Max results"),
  },
  async ({ query, limit }) => {
    // Your implementation here
    const results = await searchDocumentation(query, limit);
    return {
      content: [
        {
          type: "text",
          text: JSON.stringify(results, null, 2),
        },
      ],
    };
  }
);

// Define another tool
server.tool(
  "get_deployment_status",
  "Check the deployment status of a service",
  {
    service: z.string().describe("Service name"),
    environment: z.enum(["staging", "production"]).describe("Target environment"),
  },
  async ({ service, environment }) => {
    // Your implementation here
    const status = await checkDeployment(service, environment);
    return {
      content: [
        {
          type: "text",
          text: `${service} (${environment}): ${status.state} - deployed at ${status.timestamp}`,
        },
      ],
    };
  }
);

// Start the server
const transport = new StdioServerTransport();
await server.connect(transport);
```

### package.json

```json
{
  "name": "my-mcp-server",
  "version": "1.0.0",
  "type": "module",
  "bin": "./index.js",
  "dependencies": {
    "@modelcontextprotocol/sdk": "^1.0.0",
    "zod": "^3.23.0"
  }
}
```

### Register with Claude Code

```bash
cd mcp-server && npm install
claude mcp add my-tools -- node /path/to/mcp-server/index.js
```

Or in `.mcp.json`:

```json
{
  "mcpServers": {
    "my-tools": {
      "command": "node",
      "args": ["./mcp-server/index.js"],
      "env": {
        "API_KEY": "${MY_API_KEY}"
      }
    }
  }
}
```

---

## Option 2: Stdio Server (Python)

Best for: data processing, ML/AI tools, Python ecosystem integrations.

### Server Code

Create `mcp_server.py`:

```python
#!/usr/bin/env python3
from mcp.server.fastmcp import FastMCP

mcp = FastMCP("my-python-tools")


@mcp.tool()
def analyze_data(file_path: str, analysis_type: str = "summary") -> str:
    """Analyze a data file and return insights.

    Args:
        file_path: Path to the data file (CSV, JSON, Parquet)
        analysis_type: Type of analysis - summary, correlations, or outliers
    """
    import pandas as pd

    df = pd.read_csv(file_path)

    if analysis_type == "summary":
        return df.describe().to_string()
    elif analysis_type == "correlations":
        return df.corr().to_string()
    elif analysis_type == "outliers":
        # Simple z-score outlier detection
        from scipy import stats
        z_scores = stats.zscore(df.select_dtypes(include="number"))
        outliers = (z_scores.abs() > 3).sum()
        return f"Outliers per column:\n{outliers.to_string()}"


@mcp.tool()
def run_sql_query(query: str, database: str = "app.db") -> str:
    """Run a read-only SQL query against a SQLite database.

    Args:
        query: SQL SELECT query to execute
        database: Path to SQLite database file
    """
    import sqlite3

    if not query.strip().upper().startswith("SELECT"):
        return "Error: Only SELECT queries are allowed"

    conn = sqlite3.connect(f"file:{database}?mode=ro", uri=True)
    try:
        result = conn.execute(query).fetchall()
        return str(result)
    finally:
        conn.close()


if __name__ == "__main__":
    mcp.run(transport="stdio")
```

### Register with Claude Code

```bash
pip install mcp pandas
claude mcp add my-python-tools -- python /path/to/mcp_server.py
```

Or in `.mcp.json`:

```json
{
  "mcpServers": {
    "my-python-tools": {
      "command": "python",
      "args": ["./mcp_server.py"]
    }
  }
}
```

---

## Option 3: HTTP Server (Remote/Shared)

Best for: team-shared tools, remote APIs, services that need to run independently.

### Server Code (Node.js with Express)

```javascript
import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";
import { SSEServerTransport } from "@modelcontextprotocol/sdk/server/sse.js";
import express from "express";
import { z } from "zod";

const app = express();
const server = new McpServer({
  name: "team-tools",
  version: "1.0.0",
});

server.tool(
  "check_service_health",
  "Check health of internal services",
  { service: z.string() },
  async ({ service }) => {
    const response = await fetch(`https://${service}.internal/health`);
    const health = await response.json();
    return {
      content: [{ type: "text", text: JSON.stringify(health, null, 2) }],
    };
  }
);

// SSE endpoint for MCP
app.get("/sse", async (req, res) => {
  const transport = new SSEServerTransport("/messages", res);
  await server.connect(transport);
});

app.post("/messages", express.json(), async (req, res) => {
  // Handle MCP messages
});

app.listen(3001, () => {
  console.log("MCP server running on http://localhost:3001");
});
```

### Register with Claude Code

```bash
claude mcp add team-tools --transport http -- http://localhost:3001/sse
```

Or in `.mcp.json`:

```json
{
  "mcpServers": {
    "team-tools": {
      "type": "http",
      "url": "http://localhost:3001/sse"
    }
  }
}
```

---

## Testing Your MCP Server

### Verify connection

```bash
claude mcp list
```

### Test interactively

```text
> What tools are available from my-tools?
> Use the search_docs tool to find information about authentication
```

### Debug issues

```bash
# Run Claude with debug logging
claude --debug

# Test stdio server manually
echo '{"jsonrpc":"2.0","method":"tools/list","id":1}' | node ./mcp-server/index.js
```

---

## Tips

- Stdio servers are simpler and run locally per session
- HTTP servers can be shared across team members
- Always validate inputs in your tool implementations
- Return clear error messages, Claude uses them to self-correct
- Use `zod` (JS) or type hints (Python) for input schemas, MCP generates the schema automatically
- Keep tools focused: one tool per operation, not one tool that does everything
- Test your server standalone before registering with Claude Code
