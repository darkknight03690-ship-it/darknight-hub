# MacroDroid / Tasker — "Lab mode" stub

One tap: reduce Samsung killing Termux during field work.

## MacroDroid (recommended on Samsung)

Create macro **DarkNight Lab Mode**:

| Trigger | Action |
|---------|--------|
| Shortcut / home screen | `Termux:API` → `Wake Lock` acquire (or `termux-wake-lock` intent if using Tasker plugin) |
| | Launch App → Termux |
| | Optional: Notification → "Lab mode on" |

**Exit macro** (optional): release wake lock, show notification.

### Shell action (advanced)

If you install `macro` that runs Termux command via `RUN_COMMAND` intent:

```
bash ~/darknight-hub/mobile/termux/bin/healthcheck.sh
```

Requires Termux:API and permission `allow-external-apps` in `~/.termux/termux.properties`:

```
allow-external-apps=true
```

## Tasker equivalent

Profile **DarkNight Lab**:

1. Task → Plugin → Termux → Run command: `termux-wake-lock`
2. App → Launch → Termux

## Battery settings (manual, always do once)

Settings → Battery → Never sleeping apps → Termux, Termux:API, Tailscale.

## No export file

MacroDroid exports are device-specific. Recreate from the table above on your Z Fold and note your variant in [LEARNINGS.md](../../docs/mobile/LEARNINGS.md).
