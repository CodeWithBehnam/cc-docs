---
name: perf-audit
description: >
  Find performance bottlenecks in the codebase. Analyzes hot code paths,
  database queries, memory allocation patterns, and algorithmic complexity.
  Use when the user asks about performance, says "why is this slow",
  "find bottlenecks", "optimize this", or "perf audit".
context: fork
agent: Explore
allowed-tools: Read, Grep, Glob, Bash(git *), Bash(find *), Bash(grep *)
---

## Context

- Repository: !`git rev-parse --show-toplevel 2>/dev/null || pwd`
- Target: $ARGUMENTS
- Languages detected: !`find . -type f \( -name "*.py" -o -name "*.ts" -o -name "*.js" -o -name "*.go" -o -name "*.rb" -o -name "*.java" \) -not -path '*/node_modules/*' -not -path '*/.venv/*' | sed 's/.*\.//' | sort | uniq -c | sort -rn | head -8`

## Task

Perform a performance audit of the codebase (or the area specified in $ARGUMENTS). Investigate all of the following categories:

### 1. Algorithmic Complexity

- Find loops with nested loops over the same data (O(n^2) or worse)
- Look for linear searches in code paths that run frequently
- Identify cases where sorting is done inside loops
- Check for repeated computation that could be cached or memoized

### 2. Database and I/O

- Find N+1 query patterns: loops that execute one query per iteration
- Look for missing `SELECT` column lists (selecting all columns when only a few are needed)
- Find queries that load entire tables and filter in memory
- Identify blocking I/O in async/concurrent code
- Check for missing indexes by looking at frequently-queried fields
- Find repeated reads of the same data within a request lifecycle (missing request-scoped caching)

### 3. Memory

- Look for large collections built up and never released
- Find code that loads entire files into memory when streaming would work
- Identify object creation in hot loops (prefer pre-allocation or pools)
- Look for large in-memory caches with no eviction policy

### 4. Concurrency

- Find serial execution of independent I/O calls that could be parallelized
- Identify overly broad locks that block unrelated operations
- Look for single-threaded bottlenecks in otherwise concurrent code

### 5. Frontend-Specific (if applicable)

- Find synchronous blocking calls on the main thread
- Identify large payloads returned from APIs where pagination or field selection would help
- Look for render-blocking operations in UI code

### 6. Caching Opportunities

- Identify expensive computations or queries that repeat with the same inputs
- Look for missing HTTP cache headers on static or rarely-changing responses
- Find cases where results could be memoized at the function level

For each area, read the relevant source files to understand the actual code before reporting. Avoid reporting hypothetical issues - only report things confirmed by reading the code.

## Output Format

### Performance Summary
One paragraph: overall assessment of where the performance risks are concentrated.

### Findings

For each issue:
- **ID**: PERF-001, PERF-002, ...
- **Category**: Algorithmic / Database / Memory / Concurrency / Caching
- **Severity**: Critical (likely user-visible) / High / Medium / Low
- **File**: `path/to/file.py:42`
- **Description**: what the issue is and why it is slow
- **Evidence**: the specific code or pattern
- **Recommendation**: concrete fix with expected improvement

### Quick Wins
Improvements that are low-risk and can be made immediately, ranked by expected impact.

### Larger Investments
Improvements that require significant refactoring or design changes but have high potential impact.

### Profiling Suggestions
If the bottleneck is unclear, suggest specific profiling commands or tools appropriate for the detected language/framework.
