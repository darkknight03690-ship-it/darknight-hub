#!/data/data/com.termux/files/usr/bin/bash
# Optional Kali via proot-distro (no root required).
set -euo pipefail

METAPACKAGE="${KALI_METAPACKAGE:-default}"

log() { printf '[darknight-kali] %s\n' "$*"; }

if ! command -v pkg >/dev/null 2>&1; then
  echo "Run inside Termux." >&2
  exit 1
fi

pkg install -y proot-distro

if proot-distro list 2>/dev/null | grep -q '^kali'; then
  log "Kali proot distro already installed"
else
  log "Installing Kali (this may take a while)..."
  proot-distro install kali
fi

log "Login: proot-distro login kali"
log "First time in Kali, consider: apt update && apt full-upgrade -y"

case "$METAPACKAGE" in
  minimal)
    log "Minimal: use apt install <tool> inside proot as needed"
    ;;
  default|full)
    log "Inside Kali, optional: apt install -y kali-linux-default"
    log "Or smaller: apt install -y kali-tools-top10"
    ;;
  *)
    log "Unknown KALI_METAPACKAGE=$METAPACKAGE (minimal|default|full)"
    ;;
esac

log "Bind shared storage once on host: termux-setup-storage"
log "In Kali, loot path: /sdcard/Download/darknight/ or ~/darknight via proot bind"
