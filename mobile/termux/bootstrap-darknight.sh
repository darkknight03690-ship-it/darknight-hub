#!/data/data/com.termux/files/usr/bin/bash
# DarkNight Termux bootstrap — idempotent. Run inside repo clone on device.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
PROFILE="${DARKNIGHT_PROFILE:-both}"
PROFILES_DIR="${REPO_ROOT}/mobile/termux/profiles"
BIN_SRC="${REPO_ROOT}/mobile/termux/bin"
HOME_DK="${HOME}/darknight"

log() { printf '[darknight] %s\n' "$*"; }

if ! command -v pkg >/dev/null 2>&1; then
  echo "Run this script inside Termux." >&2
  exit 1
fi

install_pkg_list() {
  local file="$1"
  [[ -f "$file" ]] || return 0
  local -a pkgs=()
  while IFS= read -r line || [[ -n "$line" ]]; do
    line="${line%%#*}"
    line="$(echo "$line" | tr -d '[:space:]')"
    [[ -n "$line" ]] || continue
    pkgs+=("$line")
  done <"$file"
  if ((${#pkgs[@]} > 0)); then
    log "Installing from $(basename "$file"): ${#pkgs[@]} package(s)"
    pkg install -y "${pkgs[@]}" || true
  fi
}

log "Updating package index"
pkg update -y
pkg upgrade -y

install_pkg_list "${PROFILES_DIR}/minimal.txt"

case "$PROFILE" in
  minimal) ;;
  app-test) install_pkg_list "${PROFILES_DIR}/app-test.txt" ;;
  network) install_pkg_list "${PROFILES_DIR}/network.txt" ;;
  both)
    install_pkg_list "${PROFILES_DIR}/app-test.txt"
    install_pkg_list "${PROFILES_DIR}/network.txt"
    ;;
  *)
    echo "Unknown DARKNIGHT_PROFILE=$PROFILE (use minimal|app-test|network|both)" >&2
    exit 1
    ;;
esac

# Optional API bridge when companion app installed
if command -v termux-microphone-record >/dev/null 2>&1; then
  :
else
  pkg install -y termux-api 2>/dev/null || log "termux-api skipped (install Termux:API app if needed)"
fi

log "Creating ~/darknight layout"
mkdir -p "${HOME_DK}/bin" "${HOME_DK}/notes" "${HOME_DK}/loot" "${HOME_DK}/roes"

if [[ -d "$BIN_SRC" ]]; then
  for f in "$BIN_SRC"/*; do
    [[ -f "$f" ]] || continue
    cp -f "$f" "${HOME_DK}/bin/"
    chmod +x "${HOME_DK}/bin/$(basename "$f")" 2>/dev/null || true
  done
fi

if ! grep -qs 'darknight/bin' "${HOME}/.bashrc" 2>/dev/null; then
  {
    echo ''
    echo '# DarkNight mobile ops'
    echo 'export PATH="${HOME}/darknight/bin:${PATH}"'
  } >>"${HOME}/.bashrc"
  log "Added ~/darknight/bin to PATH in .bashrc"
fi

if command -v sshd >/dev/null 2>&1; then
  if ! pgrep -x sshd >/dev/null 2>&1; then
    sshd
    log "sshd started (port 8022)"
  else
    log "sshd already running"
  fi
fi

log "Bootstrap complete (profile=$PROFILE). Run: bash ${HOME_DK}/bin/healthcheck.sh"
log "Fill docs/mobile/DEVICE-PROFILE.md on this device and sign ROE-LAB-ONLY."
