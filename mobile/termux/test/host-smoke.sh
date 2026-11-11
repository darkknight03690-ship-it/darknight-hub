#!/usr/bin/env bash
# Host-side smoke test (Linux CI / dev machine — not Termux).
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)"
PROFILES_DIR="${REPO_ROOT}/mobile/termux/profiles"

count_lines() {
  local file="$1"
  local n=0
  while IFS= read -r line || [[ -n "$line" ]]; do
    line="${line%%#*}"
    line="$(echo "$line" | tr -d '[:space:]')"
    [[ -n "$line" ]] && n=$((n + 1))
  done <"$file"
  echo "$n"
}

for f in minimal app-test network; do
  p="${PROFILES_DIR}/${f}.txt"
  [[ -f "$p" ]] || { echo "missing $p"; exit 1; }
  c="$(count_lines "$p")"
  echo "profile $f: $c packages"
  [[ "$c" -ge 1 ]] || exit 1
done

for f in "${REPO_ROOT}/mobile/termux"/*.sh "${REPO_ROOT}/mobile/termux/bin"/*.sh; do
  bash -n "$f"
done

echo "host-smoke: OK"
