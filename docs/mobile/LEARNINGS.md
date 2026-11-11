# Device learnings (you maintain this)

Cloud bootstrap cannot run on physical Z Fold hardware. After your first on-device install, append dated notes here.

## Template

```markdown
### YYYY-MM-DD — <One UI / Android build>

- bootstrap: pass | fail (notes)
- healthcheck: pass | fail (paste summary)
- proot kali: pass | skip
- idempotent re-run: yes | no
- surprises:
```

## Pre-filled expectations (generic Z Fold)

- Samsung may kill Termux in background until **Never sleeping apps** includes Termux (+ Termux:API if used).
- First `termux-setup-storage` must be run manually and accept Android permission.
- `sshd` fingerprint: save to `~/darknight/notes/ssh-host-key.txt` after bootstrap.

## Your log

### 2026-11-11 — Cloud bootstrap (pre-device)

- bootstrap: not run on physical Z Fold (cloud agent environment)
- healthcheck: not run on device
- host-smoke: pass — `mobile/termux/test/host-smoke.sh` (profile counts + `bash -n` on all scripts)
- idempotent re-run: verify on phone (run bootstrap twice; expect no errors)

_(Add your handset entries below.)_
