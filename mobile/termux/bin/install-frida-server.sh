#!/data/data/com.termux/files/usr/bin/bash
# Download frida-server arm64 release to ~/darknight/bin (you push to device and run manually).
set -euo pipefail

FRIDA_VERSION="${FRIDA_VERSION:-}"
ARCH="${FRIDA_ARCH:-arm64}"
DEST="${HOME}/darknight/bin"

log() { printf '[frida] %s\n' "$*"; }

if [[ -z "$FRIDA_VERSION" ]]; then
  log "Resolving latest Frida release tag..."
  FRIDA_VERSION="$(curl -fsSL https://api.github.com/repos/frida/frida/releases/latest | grep -m1 '"tag_name"' | sed -E 's/.*"tag_name": "([^"]+)".*/\1/')"
fi

[[ -n "$FRIDA_VERSION" ]] || { echo "Could not resolve FRIDA_VERSION"; exit 1; }

mkdir -p "$DEST"
ASSET="frida-server-${FRIDA_VERSION}-android-${ARCH}"
URL="https://github.com/frida/frida/releases/download/${FRIDA_VERSION}/${ASSET}.xz"

log "Downloading $URL"
tmpdir="$(mktemp -d)"
trap 'rm -rf "$tmpdir"' EXIT

curl -fsSL "$URL" -o "$tmpdir/${ASSET}.xz"
xz -dc "$tmpdir/${ASSET}.xz" >"$DEST/frida-server"
chmod 700 "$DEST/frida-server"

log "Installed $DEST/frida-server ($FRIDA_VERSION)"
log "On rooted/debug test device: push and run frida-server as required by your ROE."
log "Match pip frida-tools version: pip install frida-tools==${FRIDA_VERSION#v}"
