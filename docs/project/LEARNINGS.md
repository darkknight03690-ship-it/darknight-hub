# Learnings — Protiviti Proposal

## Seeded 2026-09-16 (Mac learning pass)
- Project used for Protiviti RFP→proposal workspace setup, WTTCO storylines, and opening technical decks.
- Cloud environment snapshot has intermittently failed (“Falling back to the default environment”); prefer documenting rules in `docs/project/` so learning survives snapshot issues.
- 2026-09-16: Protiviti Proposal Project (`bc-665be46a`) stuck at `INSTALL_STARTED` after stale snapshot `bld-20260914-a4a87330-…` skipped install. Desktop composer then showed “Something went wrong.” Recovery is a new chat plus a terminating `install` in `.cursor/environment.json`. Do not reopen that thread.
- Surface OneDrive proposal paths were referenced historically; cloud VM may not see them — use private worker `surface-local` or Mac when local files are required.
- Sister Project: **KSA Compliance SME** (`bc-68b36e51-…`) for KSA/AML compliance SME work; share brand rules but keep domain context separate.
- PPTX agent for Sumit / ME branding: `protiviti-pptx-agent` on Google Drive.

## Open
- Confirm whether ME template binaries should be vendored into a private repo for cloud agents.
- Confirm primary active engagement folder on Surface OneDrive for proposal sourcing.
