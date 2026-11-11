# Rules of engagement — lab and authorized work only

Use this pack only where you have **explicit permission** (your lab, your devices, signed client SOW, or public bug-bounty scope).

## Allowed

- Scanning IP ranges and hosts you own or are contracted to test
- Mobile app instrumentation on builds you control or under program scope
- RF/NFC exercises on your tags, lab gear, or isolated cages
- Tunneling to **your** lab (Tailscale, SSH, WireGuard)

## Not allowed (do not configure scripts for this)

- Third-party WiFi, accounts, or devices without authorization
- Covert monitoring, stalkerware, or credential harvesting outside scope
- Storing real client secrets unencrypted on a daily-driver profile

## Engagement log (copy per job)

```markdown
## Engagement: <client-or-lab-slug>
Date:
Scope document / ticket:
Tester:
Devices in scope:
Out of scope:
Start (local time):
End (local time):
Loot path: ~/darknight/loot/<client>-<YYYYMMDD>/
Notes:
```

## Data on the phone

1. Prefer a **Samsung Secure Folder** or separate user profile for engagement loot.
2. Encrypt backups; delete loot folders when the engagement closes.
3. Do not sync `~/darknight/loot/` to public git remotes.

## Sign-off

I will only run DarkNight mobile tooling against targets within the scope above.

Name: __________________  Date: __________________
