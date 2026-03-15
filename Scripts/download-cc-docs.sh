#!/usr/bin/env bash
# download-cc-docs.sh — Download all Claude Code documentation .md files
# Downloads from https://code.claude.com/docs/en/*.md into .claude/cc-docs/
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
DOCS_DIR="$REPO_DIR/claude-code-docs"

LLMS_TXT="https://code.claude.com/docs/llms.txt"

mkdir -p "$DOCS_DIR"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " DOWNLOADING CLAUDE CODE DOCS"
echo " Target: $DOCS_DIR"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Step 1: Fetch the index and extract all .md URLs
echo "Fetching doc index from $LLMS_TXT ..."
llms_content=$(curl -fsSL --max-time 15 "$LLMS_TXT") || {
  echo "ERROR: Failed to fetch $LLMS_TXT" >&2
  exit 1
}

# Also save llms.txt itself
echo "$llms_content" > "$DOCS_DIR/llms.txt"

# Parse all .md URLs from markdown links: [Title](https://.../*.md)
URLS=()
while IFS= read -r line; do
  [[ -n "$line" ]] && URLS+=("$line")
done < <(echo "$llms_content" | grep -oE 'https://code\.claude\.com/docs/en/[a-zA-Z0-9_-]+\.md' | sort -u)

total=${#URLS[@]}
echo "Found $total doc pages."
echo ""

downloaded=0
failed=0

for url in "${URLS[@]}"; do
  filename="${url##*/}"
  dest="${DOCS_DIR}/${filename}"

  printf "[%2d/%d] %-40s " "$((downloaded + failed + 1))" "$total" "$filename"

  if curl -fsSL --max-time 15 -o "$dest" "$url" 2>/dev/null; then
    size_bytes=$(stat -c%s "$dest" 2>/dev/null || stat -f%z "$dest" 2>/dev/null || echo 0)
    if (( size_bytes >= 1048576 )); then
      size_human=$(awk "BEGIN {printf \"%.1f MB\", $size_bytes/1048576}")
    elif (( size_bytes >= 1024 )); then
      size_human=$(awk "BEGIN {printf \"%.1f KB\", $size_bytes/1024}")
    else
      size_human="${size_bytes} B"
    fi
    echo "OK  ($size_human)"
    downloaded=$((downloaded + 1))
  else
    echo "FAILED"
    rm -f "$dest"
    failed=$((failed + 1))
  fi
done

# Step 2: Clean up JSX/MDX artifacts from downloaded markdown files
echo ""
echo "Cleaning up JSX/MDX artifacts..."
cleaned=0
for mdfile in "$DOCS_DIR"/*.md; do
  [[ "$(basename "$mdfile")" == "CLAUDE.md" ]] && continue
  before=$(wc -c < "$mdfile")
  # Remove theme={null} (repeated inline junk from code fences)
  sed -i 's/ *theme={null}//g' "$mdfile"
  # Remove JSX/MDX component tags (both inline and standalone lines)
  # Components: Tabs, Tab, Accordion, AccordionGroup, CardGroup, Card,
  #   Note, Warning, Info, Tip, Steps, Step, Frame, CodeGroup, Callout,
  #   MCPServersTable, and any self-closing JSX tags
  sed -i \
    -e '/<\/\?Tabs>/d' \
    -e '/<Tab[[:space:]]/d' -e '/<\/Tab>/d' \
    -e '/<\/\?AccordionGroup>/d' \
    -e '/<Accordion[[:space:]]/d' -e '/<\/Accordion>/d' \
    -e '/<CardGroup[^>]*>/d' -e '/<\/CardGroup>/d' \
    -e '/<Card[[:space:]][^>]*>/d' -e '/<\/Card>/d' \
    -e '/<\/\?Note>/d' \
    -e '/<\/\?Warning>/d' \
    -e '/<\/\?Info>/d' \
    -e '/<Tip[^>]*>/d' -e '/<\/Tip>/d' \
    -e '/<\/\?Steps>/d' \
    -e '/<Step[[:space:]][^>]*>/d' -e '/<\/Step>/d' \
    -e '/<Frame[^>]*>/d' -e '/<\/Frame>/d' \
    -e '/<\/\?CodeGroup>/d' \
    -e '/<\/\?Callout>/d' \
    -e '/<MCPServersTable[^>]*>/d' \
    "$mdfile"
  # Squeeze consecutive blank lines into a single blank line
  cat -s "$mdfile" > "$mdfile.tmp" && mv "$mdfile.tmp" "$mdfile"
  after=$(wc -c < "$mdfile")
  saved=$(( before - after ))
  if (( saved > 0 )); then
    cleaned=$((cleaned + 1))
  fi
done
echo "Cleaned $cleaned files."

echo ""

# Step 3: Update the "Last docs pull" timestamp in README.md
README="$REPO_DIR/README.md"
if [[ -f "$README" ]]; then
  TIMESTAMP="$(date -u '+%Y-%m-%d %H:%M UTC')"
  sed -i "s|<!-- LAST_UPDATED -->.*<!-- /LAST_UPDATED -->|<!-- LAST_UPDATED -->$TIMESTAMP<!-- /LAST_UPDATED -->|" "$README"
  echo "Updated README.md timestamp: $TIMESTAMP"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " Done: $downloaded downloaded, $failed failed (of $total)"
echo " Cleaned: $cleaned files (removed JSX/MDX artifacts)"
echo " Files saved to: $DOCS_DIR"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
