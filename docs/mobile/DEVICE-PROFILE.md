# Device profile (fill on first install)

Lock this file after your first bootstrap so scripts and docs stay aligned with your handset.

## Hardware

| Field | Your value |
|-------|------------|
| Marketing name | e.g. Galaxy Z Fold5 |
| Model number | e.g. SM-F946B |
| Region / CSC | e.g. XSG, INS |
| Internal storage | e.g. 512 GB |

## Software

| Field | Your value |
|-------|------------|
| Android version | |
| One UI version | |
| Security patch | |
| Knox version | |

## Posture (pick one)

- [ ] **A — Stock** — Termux + proot only, bootloader locked
- [ ] **B — Unlock planned** — willing to wipe/unlock for external WiFi monitor + persistence
- [ ] **C — Rooted** — Magisk/Kernelsu or NetHunter (note variant below)

Root / custom ROM notes:

```
(paste Magisk version, NetHunter image, or "n/a")
```

## Mission profile

- [ ] `minimal`
- [ ] `app-test`
- [ ] `network`
- [ ] `both` (default bootstrap: installs app-test ∪ network)

Bootstrap command after filling posture:

```bash
# From repo root in Termux
export DARKNIGHT_PROFILE=both   # or minimal | app-test | network
bash mobile/termux/bootstrap-darknight.sh
```

## NetHunter check

Before chasing NetHunter images, verify official support:

- https://www.kali.org/docs/nethunter/nethunter-kernel-4-config-9-x-support/

If your model is not listed, use **Termux + proot Kali** (this pack) instead.
