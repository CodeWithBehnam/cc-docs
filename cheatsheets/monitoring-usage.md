# Monitoring Usage Cheatsheet

## Quick Start
```bash
export CLAUDE_CODE_ENABLE_TELEMETRY=1
export OTEL_METRICS_EXPORTER=otlp        # otlp | prometheus | console
export OTEL_LOGS_EXPORTER=otlp           # otlp | console
export OTEL_EXPORTER_OTLP_PROTOCOL=grpc
export OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:4317
export OTEL_EXPORTER_OTLP_HEADERS="Authorization=Bearer your-token"
claude
```

## Key Environment Variables
| Variable | Description | Default |
|---|---|---|
| `CLAUDE_CODE_ENABLE_TELEMETRY` | Enable telemetry (required) | off |
| `OTEL_METRICS_EXPORTER` | `console`, `otlp`, `prometheus` | — |
| `OTEL_LOGS_EXPORTER` | `console`, `otlp` | — |
| `OTEL_EXPORTER_OTLP_PROTOCOL` | `grpc`, `http/json`, `http/protobuf` | — |
| `OTEL_EXPORTER_OTLP_ENDPOINT` | Collector URL | — |
| `OTEL_EXPORTER_OTLP_HEADERS` | Auth headers | — |
| `OTEL_METRIC_EXPORT_INTERVAL` | Interval ms | 60000 |
| `OTEL_LOGS_EXPORT_INTERVAL` | Interval ms | 5000 |
| `OTEL_LOG_USER_PROMPTS` | Include prompt content | off |
| `OTEL_LOG_TOOL_DETAILS` | Log MCP/skill names in tool events | off |
| `OTEL_RESOURCE_ATTRIBUTES` | Custom team/dept attributes | — |

## Cardinality Control
| Variable | Default | Notes |
|---|---|---|
| `OTEL_METRICS_INCLUDE_SESSION_ID` | `true` | Disable to reduce cardinality |
| `OTEL_METRICS_INCLUDE_VERSION` | `false` | Enable for version segmentation |
| `OTEL_METRICS_INCLUDE_ACCOUNT_UUID` | `true` | Disable to reduce cardinality |

## Available Metrics
| Metric | Unit |
|---|---|
| `claude_code.session.count` | count |
| `claude_code.lines_of_code.count` | count (type: added/removed) |
| `claude_code.pull_request.count` | count |
| `claude_code.commit.count` | count |
| `claude_code.cost.usage` | USD (by model) |
| `claude_code.token.usage` | tokens (type: input/output/cacheRead/cacheCreation) |
| `claude_code.code_edit_tool.decision` | count (accept/reject by tool, language) |
| `claude_code.active_time.total` | seconds (type: user/cli) |

## Events (via `OTEL_LOGS_EXPORTER`)
| Event | Key attributes |
|---|---|
| `claude_code.user_prompt` | `prompt_length`, `prompt` (if `OTEL_LOG_USER_PROMPTS=1`) |
| `claude_code.tool_result` | `tool_name`, `success`, `duration_ms`, `decision_source` |
| `claude_code.api_request` | `model`, `cost_usd`, `input_tokens`, `output_tokens` |
| `claude_code.api_error` | `model`, `error`, `status_code`, `attempt` |
| `claude_code.tool_decision` | `tool_name`, `decision`, `source` |

Use `prompt.id` (UUID v4) to correlate all events from a single user prompt.

## Example Configurations
```bash
# Console debug
export CLAUDE_CODE_ENABLE_TELEMETRY=1 OTEL_METRICS_EXPORTER=console OTEL_METRIC_EXPORT_INTERVAL=1000

# Prometheus
export CLAUDE_CODE_ENABLE_TELEMETRY=1 OTEL_METRICS_EXPORTER=prometheus

# Multiple exporters
export CLAUDE_CODE_ENABLE_TELEMETRY=1 OTEL_METRICS_EXPORTER=console,otlp

# Multi-team tagging (no spaces in values)
export OTEL_RESOURCE_ATTRIBUTES="department=engineering,team.id=platform,cost_center=eng-123"
```

## Dynamic Auth Headers
Add to `.claude/settings.json`:
```json
{ "otelHeadersHelper": "/bin/generate_opentelemetry_headers.sh" }
```
Script must output JSON `{"Header": "value"}`. Refreshes every 29 min by default (`CLAUDE_CODE_OTEL_HEADERS_HELPER_DEBOUNCE_MS`).

## Gotchas
- `OTEL_RESOURCE_ATTRIBUTES` must use `key=value` pairs with no spaces; percent-encode special chars
- Cost metrics are approximations; use API provider billing for official figures
- `prompt.id` is excluded from metrics (too high cardinality); use it for event-level audit only
- Default temporality is `delta`; set `OTEL_EXPORTER_OTLP_METRICS_TEMPORALITY_PREFERENCE=cumulative` if your backend requires it

---
> Source: [monitoring-usage.md](../monitoring-usage.md)
