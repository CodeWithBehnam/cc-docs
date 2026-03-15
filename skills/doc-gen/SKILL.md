---
name: doc-gen
description: >
  Generate or update documentation for a module, file, function, or class.
  Produces JSDoc, docstrings, README sections, or standalone docs depending
  on the target. Use when the user says "document this", "add docs",
  "generate documentation", or "write a README for this module".
disable-model-invocation: true
allowed-tools: Bash, Read, Write, Edit, Grep, Glob
argument-hint: "<file, module, or function to document>"
---

Generate or update documentation for: $ARGUMENTS

1. Locate the target:
   - If $ARGUMENTS is a file path, read it directly
   - If $ARGUMENTS is a module or function name, use Grep and Glob to find the definition
   - If $ARGUMENTS is empty, document the current directory's main entry point

2. Read the target fully, including:
   - All public functions, methods, classes, and constants
   - Existing documentation (to update rather than duplicate)
   - Related test files to understand intended behavior and edge cases
   - Callers to understand real-world usage

3. Detect the documentation format from the project:
   - TypeScript/JavaScript: JSDoc (`/** */`) with `@param`, `@returns`, `@throws`, `@example`
   - Python: Google-style docstrings with `Args:`, `Returns:`, `Raises:`, `Example:`
   - Go: standard Go doc comments (`// FunctionName ...`)
   - Other languages: use the idiomatic format for that language

4. Generate documentation:
   - Module/file-level: overview of what the module does, when to use it, key concepts
   - Each public function/method: description, all parameters with types and meaning, return value, exceptions/errors thrown, at least one usage example
   - Each public class: purpose, construction, key methods summary
   - Skip private/internal functions unless they have complex logic worth explaining

5. If a README does not exist for the module and the target is a directory:
   - Create a `README.md` with: module name, one-paragraph description, installation/import, quick start example, API summary table, notes on configuration

6. Write all documentation in-place (inline comments/docstrings) and also create or update any separate doc files.

7. Report what was added or updated with a file list.

## Requirements

- The target ($ARGUMENTS) must be a valid file path, module name, or function name in the project

## Error Handling

- If the target is not found: report and suggest similar names
- If documentation already exists and is accurate: note it and suggest only additions
- If the code is too complex to document without understanding domain context: ask the user for clarification before writing
