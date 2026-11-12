# Z Fold mobile ops station

Portable **authorized testing** terminal: Termux core, optional proot Kali, USB radios, mesh to home lab.

## Quick start

1. Install [Termux](https://github.com/termux/termux-app/releases) from GitHub (not Play Store build if you need current packages).
2. Optional: Termux:API companion app for `termux-api` commands.
3. Clone this repo in Termux:

   ```bash
   pkg install git -y
   git clone https://github.com/darknihjt/darknight-hub.git ~/darknight-hub
   cd ~/darknight-hub
   ```

4. Fill [DEVICE-PROFILE.md](./DEVICE-PROFILE.md).
5. Read and follow [ROE-LAB-ONLY.md](./ROE-LAB-ONLY.md).
6. Bootstrap:

   ```bash
   export DARKNIGHT_PROFILE=both   # minimal | app-test | network | both
   bash mobile/termux/bootstrap-darknight.sh
   ```

7. Optional Kali layer:

   ```bash
   bash mobile/termux/install-kali-proot.sh
   ```

8. Verify:

   ```bash
   bash mobile/termux/bin/healthcheck.sh
   ```

## Unlock decision tree

```mermaid
flowchart TD
  start [Need monitor mode or kernel hooks?]
  start -->|No| stock [Stock: Termux plus proot Kali]
  start -->|Yes| listed [Device on NetHunter list?]
  listed -->|Yes| nh [Backup wipe unlock NetHunter path]
  listed -->|No| hw [Stock plus USB WiFi plus root OR accept active-only scans]
  stock --> termux [Run bootstrap-darknight.sh]
  nh --> termux
  hw --> termux
```

**Knox:** Bootloader unlock **factory-resets** the phone and trips Knox warranty bit. Back up with Samsung Smart Switch before any unlock.

| Posture | Tools |
|---------|--------|
| Stock | nmap, ssh, python tooling, proot Kali, Frida on user/debug builds |
| Rooted | Persistent services, module hooks, better USB gadget behavior |
| NetHunter | Only if officially supported for your exact model |

## Multi-window and DeX layouts

**Cover screen:** shortcuts to Termux widget, Tailscale tile, Markor engagement note.

**Unfolded — dual pane:**

| Left | Right |
|------|--------|
| Termux (`mosh user@lab`) | Browser (scope docs / bounty rules) |
| Termux `healthcheck` | Markor runbook |

**Samsung DeX (optional):** HDMI or wireless DeX for keyboard/mouse; run Termux in desktop window alongside Chromium.

## Samsung battery / background kills

1. Settings → Battery → Background usage limits → **Never sleeping apps** → add Termux (and Termux:API).
2. Disable battery optimization for Termux (per-app battery settings).
3. During long jobs: keep foreground session or use `termux-wake-lock` (see MacroDroid stub).

## Directory layout (on device)

Created by bootstrap:

```
~/darknight/
  bin/       # helper scripts
  notes/     # runbooks, ssh fingerprints
  loot/      # per-engagement artifacts (do not git push)
  roes/      # signed ROE copies
```

Engagement convention: `~/darknight/loot/<client>-<YYYYMMDD>/`

## App testing (authorized builds)

After `DARKNIGHT_PROFILE=app-test` or `both`:

- Install Frida server matching your device ABI (script: `mobile/termux/bin/install-frida-server.sh`).
- Use `adb` over WiFi to lab devices on same Tailscale.
- objection / apktool via pip inside proot or Termux python venv.

## Network testing (authorized targets)

After `DARKNIGHT_PROFILE=network` or `both`:

- Active: `nmap`, `nc`, parsers against **in-scope** IPs.
- Passive / monitor: external USB adapter + root/NetHunter; document adapter chipset in DEVICE-PROFILE.
- No scripts here automate rogue AP or neighbor WiFi attacks.

## SSH from laptop to phone

Bootstrap enables `sshd`. On laptop:

```bash
ssh -p 8022 $(termux-info 2>/dev/null || echo u0_aXXX)@<phone-tailscale-ip>
```

Save host key to `~/darknight/notes/ssh-host-key.txt` on first connect.

## Integrations

| Link | Doc |
|------|-----|
| Tailscale + SSH mesh | [INTEGRATIONS.md](./INTEGRATIONS.md) |
| One-tap Lab mode | [../mobile/macrodroid/README.md](../../mobile/macrodroid/README.md) |
| Hardware | [HARDWARE-BOM.md](./HARDWARE-BOM.md) |

## Related files

- [DEVICE-PROFILE.md](./DEVICE-PROFILE.md)
- [ROE-LAB-ONLY.md](./ROE-LAB-ONLY.md)
- [LEARNINGS.md](./LEARNINGS.md)
