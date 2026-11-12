# Hardware BOM — Z Fold mobile ops tiers

Samsung Z Fold USB-C is **OTG-capable** but power hungry. Prefer a **powered hub** when attaching WiFi or SDR.

## Tier 0 — Software only (stock phone)

| Item | Notes |
|------|--------|
| Z Fold + charger | Termux + proot Kali |
| Laptop or home lab | SSH/mosh target for heavy jobs |

## Tier 1 — Minimal field kit

| Item | Purpose |
|------|---------|
| USB-C hub (data + PD pass-through) | OTG without killing battery |
| Short USB-C OTG adapter | Pocket carry |
| MicroSD or USB flash (optional) | Offline tool archive |
| External keyboard (Bluetooth) | DeX / unfolded typing |

## Tier 2 — Network lab (authorized RF only)

| Item | Purpose |
|------|---------|
| Alfa (or similar) **monitor-mode** adapter | 2.4/5 GHz testing on **your** APs |
| Powered 7-port USB hub | Stable current for adapter + phone charge |
| Ethernet USB adapter | Wired fallback in hotel/lab |

Monitor mode on Android generally needs **external chipset + root or Kali NetHunter** on supported devices. On stock Z Fold, plan for **passive scanning + active IP tools** unless you unlock (see master guide).

## Tier 3 — RF / proximity (optional)

| Item | Purpose |
|------|---------|
| RTL-SDR v3/v4 | Receive-only spectrum work in lab |
| HackRF (or similar) | Lab TX only where legal |
| Flipper Zero | NFC/IR/lab GPIO (policy varies by country) |
| Chameleon / lab NFC tags | Own tags only |

## Power and thermal

- Enable **fast cable** + avoid cheap hubs that drop voltage under load.
- Folded closed: expect **Termux throttling**; use inner screen + fan or breaks on long scans.
- Battery saver off for Termux during active ops (see [Z-FOLD-OPS-STATION.md](./Z-FOLD-OPS-STATION.md)).

## Packing list (one line each job)

```
[ ] Phone charged  [ ] Hub  [ ] WiFi adapter  [ ] USB-C cables  [ ] ROE signed  [ ] Tailscale up
```
