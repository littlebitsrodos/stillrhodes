#!/usr/bin/env bash
# Bumps every <lastmod> in sitemap.xml to today's date.
# Run before committing visible content/asset changes (HTML, CSS, fonts, photos).
#
# Usage:
#   ./scripts/bump-lastmod.sh
#
# For finer control, edit sitemap.xml by hand instead — the lastmod values are
# free-form ISO-8601 dates, not tied to git history.

set -euo pipefail

cd "$(dirname "$0")/.."

today=$(date +%Y-%m-%d)
file=sitemap.xml

if [[ ! -f $file ]]; then
  echo "$file not found" >&2
  exit 1
fi

# Portable in-place sed: BSD (macOS) and GNU disagree on -i syntax, so write to
# a temp file and move.
tmp=$(mktemp)
sed -E "s|<lastmod>[0-9]{4}-[0-9]{2}-[0-9]{2}</lastmod>|<lastmod>${today}</lastmod>|g" "$file" > "$tmp"
mv "$tmp" "$file"

echo "Bumped lastmod → ${today} in ${file}"
