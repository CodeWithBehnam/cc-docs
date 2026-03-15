---
name: explain
description: Deeply explain a file, function, class, or symbol with an ASCII diagram, an analogy, a step-by-step walkthrough, and common gotchas.
argument-hint: <file path or symbol name>
allowed-tools: Bash, Read, Grep, Glob
---

Explain the following in depth: $ARGUMENTS

Follow this structure exactly:

### 1. What is it? (One paragraph)
A plain-English description of what `$ARGUMENTS` is and what problem it solves. Assume the reader is a capable developer who is new to this codebase.

### 2. Where does it live?
- File path(s).
- How to find it: module, package, namespace.

### 3. ASCII Architecture Diagram
Draw a simple ASCII diagram showing how `$ARGUMENTS` fits into the larger system. Show callers, callees, data flow, or class hierarchy as appropriate. Keep it under 30 lines.

Example style (adapt to the actual code):

```
  [Caller A]       [Caller B]
       |                |
       +----> [explain target] <----+
                    |
            [Dependency 1]  [Dependency 2]
```

### 4. Step-by-step Walkthrough
Trace through the code logic step by step. For each significant step:
- Quote the relevant line or lines (or reference them by line number).
- Explain what happens and why.

### 5. Analogy
Explain `$ARGUMENTS` using a real-world analogy. Keep it to 3-5 sentences.

### 6. Inputs and Outputs
- What does it accept (parameters, types, required vs. optional)?
- What does it return or produce?
- What side effects does it have (mutations, I/O, state changes)?

### 7. Common Gotchas and Misuses
List 3-5 ways developers commonly misunderstand or misuse `$ARGUMENTS`. For each, show the wrong pattern and the correct alternative.

### 8. Example Usage
Show a minimal, realistic code example demonstrating correct usage.
