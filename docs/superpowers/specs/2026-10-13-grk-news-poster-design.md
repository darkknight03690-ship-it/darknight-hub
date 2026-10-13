# GRK Farewell — “Aaj Ki Taaza Khabar” Poster (Canva)

## Goal

Companion poster matching the existing **GRK Farewell** collage (Protiviti navy/gold, sticky notes, travel vignettes, central portrait) but copy and header styled as a **typical Hindi TV news bulletin** (deadpan, not meme parody).

## Reference

- Layout/colors: attached farewell collage (central GRK, binders IA–GRC, Riyadh/Jubail/Bahrain vignettes, event footer).
- Copy: approved deadpan reporter script (below).

## Approaches

| Approach | Pros | Cons |
|----------|------|------|
| **A. Duplicate source Canva design + text replace** | Pixel-perfect match | Needs original `design_id` / link (not in account search) |
| **B. `create-design` from brief** | Fast new layout | Quota blocked (2026-10-13) |
| **C. Manual Canva + this spec** | Full control | User effort |

**Recommendation:** A if user shares Canva link; else C with copy blocks below.

## Layout spec

1. **Breaking strip:** `AAJ KI TAAZA KHABAR` (red/white).
2. **Title:** `MAHAN LEADER GRK — FAREWELL` + ribbon `Riyadh se live | Protiviti HQ`.
3. **Center:** GRK portrait, mug text unchanged, desk clutter unchanged.
4. **Sticky notes (replace adventure note):**
   - HQ poori raat topo ki salami
   - WFH hosle afzai — Amex bhi
   - 12 saal / 12 ghante, har ghante salami — band dikhayi
   - Atishbazi mein koi kami nahi
5. **Riyadh vignette:** Kingdom Tower + Diwali fireworks; caption: Dilli jaisa, patakho ki jhankar.
6. **Ticker footer:** `Filhaal ke liye itna hi. Riyadh se Shubhratri. — Your Team`
7. **Optional small footer:** Oct 9 2026, Savoy Grande, 8 PM (from original invite).

## Full copy (paste-ready)

**Namaskar.** Main aapko **Riyadh** se **live** bata raha hoon.

**Aaj ki taaza khabar:** Mahan leader **GRK** ke **farewell** ke samman mein **Protiviti HQ** ne kal raat **topo ki salami** di — poori raat salami chalti rahi.

**Peeche reh gayi, thodi dukhi team** ke **hosle afzai** ke liye **WFH declare** kiya gaya. **Amex** jaisi companies ne bhi **isi tarah** faisla liya.

**HQ ne atishbazi mein koi kami nahi rakhi** — jaise **12 saal ka pyaar ho, 12 ghante**: **har ghante ek salami** dekar **poora samman** kiya gaya.

**Riyadh** pehle se hi **Dilli jaisa** lagta tha; kal **Dilli waale team members** bhi thode **confuse** ho gaye — mano **Diwali ki raat** ho, **har jagah patakho ki jhankar**.

**Filhaal ke liye itna hi.** **Riyadh** se **Shubhratri.**

## Canva edit protocol

When `design_id` is available: `start-editing-transaction` → `find_and_replace_text` / `replace_text` on sticky notes and headers → preview → user approval → `commit-editing-transaction`.

## Status

- Canva `create-design`: **failed** (`quota_exceeded`).
- User to provide original Canva link for `copy-design` + text edits, or retry generation after quota reset.
