---
name: migrate
description: >
  Migrate files or a directory from one framework, library, or pattern to
  another. Preserves behavior while updating syntax, imports, and idioms.
  Use when the user says "migrate from X to Y", "convert this to use X",
  "upgrade from React class components to hooks", or "port this to FastAPI".
disable-model-invocation: true
allowed-tools: Bash, Read, Write, Edit, Grep, Glob
argument-hint: "<source path> <target framework>"
---

Migrate $ARGUMENTS[0] from its current pattern to $ARGUMENTS[1]:

1. Understand the scope:
   - If $ARGUMENTS[0] is a directory, list all files to migrate: `find $ARGUMENTS[0] -type f`
   - If $ARGUMENTS[0] is a single file, focus on it
   - If only one argument is given, infer the source from the file content and ask for clarification on the target

2. Understand the source:
   - Read the files to identify: the framework/pattern currently in use, idioms, conventions, and structure
   - Note any project-specific customizations that need to be preserved

3. Understand the target ($ARGUMENTS[1]):
   - Identify the equivalent constructs in the target framework/pattern
   - Build a mapping: source concept -> target concept (e.g., `componentDidMount` -> `useEffect`, Flask `Blueprint` -> FastAPI `APIRouter`)

4. Run the existing test suite to capture a baseline:
   - Record all passing tests. The migration must not break them.
   - If there are no tests, warn the user before proceeding.

5. Migrate files one at a time:
   - Update imports and package names
   - Convert syntax and idioms to target equivalents
   - Preserve all logic - do not change behavior during migration
   - Preserve comments that explain intent
   - For each file, run available tests before moving to the next

6. Update configuration files as needed:
   - `package.json`, `pyproject.toml`, `go.mod`, etc.
   - Framework config files, build configs, CI configs

7. Final verification:
   - Run the full test suite
   - All baseline tests must still pass

8. Report:
   - List every file changed
   - Summarize the key transformations applied
   - Note any items that required manual decisions or could not be automatically migrated

## Requirements

- $ARGUMENTS[0]: path to the file(s) or directory to migrate
- $ARGUMENTS[1]: target framework or pattern (e.g., "React hooks", "FastAPI", "async/await", "Pydantic v2")

## Error Handling

- If the source pattern is not recognized: describe what was found and ask for guidance
- If a construct has no direct equivalent in the target: flag it, propose the closest alternative, and ask before applying
- If tests fail after migration: revert the failing file, report the issue, and continue with other files
