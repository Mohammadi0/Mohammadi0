#!/usr/bin/env bash
set -u

ROOT="${1:-.}"
ERRORS=0
WARNINGS=0

ok() { printf '✓ %s\n' "$1"; }
warn() { printf '⚠ %s\n' "$1"; WARNINGS=$((WARNINGS + 1)); }
fail() { printf '✗ %s\n' "$1"; ERRORS=$((ERRORS + 1)); }

printf "Adam's Frisör Shopify theme audit\n"
printf 'Root: %s\n\n' "$ROOT"

required_dirs="layout templates sections snippets assets config locales"
for dir in $required_dirs; do
  if [ -d "$ROOT/$dir" ]; then
    ok "Found $dir/"
  else
    warn "Missing $dir/"
  fi
done

if [ -f "$ROOT/layout/theme.liquid" ]; then
  ok 'Found layout/theme.liquid'
else
  fail 'Missing layout/theme.liquid'
fi

if command -v python3 >/dev/null 2>&1; then
  json_failed=0
  while IFS= read -r file; do
    if ! python3 -m json.tool "$file" >/dev/null 2>&1; then
      fail "Invalid JSON: ${file#"$ROOT/"}"
      json_failed=1
    fi
  done < <(find "$ROOT/templates" "$ROOT/config" -type f -name '*.json' 2>/dev/null | sort)
  if [ "$json_failed" -eq 0 ]; then
    ok 'JSON templates and configuration parsed successfully'
  fi
else
  warn 'python3 unavailable; JSON syntax was not checked'
fi

section_count=0
schema_missing=0
while IFS= read -r file; do
  section_count=$((section_count + 1))
  if ! grep -q '{%[[:space:]]*schema[[:space:]]*%}' "$file"; then
    warn "Section may lack schema: ${file#"$ROOT/"}"
    schema_missing=$((schema_missing + 1))
  fi
done < <(find "$ROOT/sections" -maxdepth 1 -type f -name '*.liquid' 2>/dev/null | sort)

if [ "$section_count" -gt 0 ] && [ "$schema_missing" -eq 0 ]; then
  ok 'All Liquid sections contain a schema marker'
fi

booking_matches=$(grep -RIlE 'bokadirekt|boka\.se' "$ROOT/layout" "$ROOT/templates" "$ROOT/sections" "$ROOT/snippets" "$ROOT/config" 2>/dev/null || true)
if [ -n "$booking_matches" ]; then
  printf '\nBooking-link references:\n%s\n' "$booking_matches" | sed "s#${ROOT%/}/##g"
else
  warn 'No Bokadirekt reference found; verify the booking destination manually'
fi

schema_files=$(find "$ROOT/snippets" -maxdepth 1 -type f \( -iname '*local*business*schema*.liquid' -o -iname '*localbusiness*schema*.liquid' \) 2>/dev/null | sort)
schema_count=$(printf '%s\n' "$schema_files" | sed '/^$/d' | wc -l | tr -d ' ')
if [ "$schema_count" -gt 1 ]; then
  warn "Multiple local-business schema snippets found ($schema_count); verify only one is rendered"
  printf '%s\n' "$schema_files" | sed "s#${ROOT%/}/##g"
fi

if grep -RIn --exclude='audit-theme.sh' -- 'shopify theme push --live' "$ROOT" 2>/dev/null; then
  fail 'Forbidden live-publishing command found in project files'
else
  ok 'No automatic live-publishing command found'
fi

printf '\nSummary: %s error(s), %s warning(s)\n' "$ERRORS" "$WARNINGS"

if [ "$ERRORS" -gt 0 ]; then
  exit 1
fi
exit 0
