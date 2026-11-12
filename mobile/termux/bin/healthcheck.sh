#!/data/data/com.termux/files/usr/bin/bash
# Self-check for DarkNight Termux bootstrap (run on device).
set -euo pipefail

pass=0
fail=0
warn=0

ok() { printf '  [OK]   %s\n' "$*"; pass=$((pass + 1)); }
bad() { printf '  [FAIL] %s\n' "$*"; fail=$((fail + 1)); }
note() { printf '  [WARN] %s\n' "$*"; warn=$((warn + 1)); }

echo "DarkNight healthcheck — $(date -Iseconds 2>/dev/null || date)"

if [[ -d "${HOME}/darknight" ]]; then ok "~/darknight exists"; else bad "~/darknight missing (run bootstrap)"; fi
for d in bin notes loot roes; do
  if [[ -d "${HOME}/darknight/$d" ]]; then ok "~/darknight/$d"; else bad "~/darknight/$d missing"; fi
done

command -v nmap >/dev/null 2>&1 && ok "nmap in PATH" || note "nmap not found (minimal profile?)"
command -v sshd >/dev/null 2>&1 && ok "openssh installed" || note "sshd not in PATH"
pgrep -x sshd >/dev/null 2>&1 && ok "sshd running" || note "sshd not running (run: sshd)"

if command -v proot-distro >/dev/null 2>&1; then
  ok "proot-distro installed"
  if proot-distro list 2>/dev/null | grep -q '^kali'; then ok "kali proot registered"; else note "kali proot not installed (optional)"; fi
else
  note "proot-distro not installed (optional)"
fi

if [[ -d "${HOME}/storage" ]]; then ok "termux storage bind present"; else note "run termux-setup-storage once"; fi

if [[ -r /sys/class/power_supply/usb/online ]]; then
  usb_online="$(cat /sys/class/power_supply/usb/online 2>/dev/null || echo 0)"
  [[ "$usb_online" == "1" ]] && ok "USB power/OTG path active" || note "USB not online (hub may still work)"
fi

if command -v tailscale >/dev/null 2>&1; then ok "tailscale CLI in PATH"; else note "Tailscale app CLI not in PATH (install app)"; fi

echo ""
echo "Summary: pass=$pass fail=$fail warn=$warn"
[[ "$fail" -eq 0 ]]
