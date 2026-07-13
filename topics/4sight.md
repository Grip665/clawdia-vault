# 4 Sight IPTV — Topic File

## Overview
Premium IPTV reselling brand. Larry's primary side business project.

## Brand
- **Name:** 4 Sight
- **Taglines:** "See What You've Been Missing" / "Premium Streams. Crystal Clear."
- **Theme:** Dark gaming/esports, metallic circular emblem, neon green + electric blue + red eye icon
- **App:** Flutter, dark navy background, neon green accents, electric blue buttons

## Tiers & Pricing
| Tier | Price | Channels |
|------|-------|----------|
| US Basic | $20/mo | ~1,700 curated US channels |
| Global Premium | $25/mo | 30K+ international |
| VOD Only | $10/mo | Movies & shows |
| Adult Add-on | +$5/mo | Any tier add-on |

## Tech Stack
- **Mobile app:** Flutter (debug APK installed on phone)
- **Backend:** Node.js (4sight-backend)
- **Admin:** React/Vite (4Sight-Admin + single-file HTML admin panel)
- **Payments:** Custom fiat-to-crypto gateway (no KYC)
- **Landing page:** Single-file HTML
- **Source:** Strong 8K (wholesale ~$2/mo via Alibaba), Prime IPTV (current test server)

## App Files
- **Full app:** `~/Desktop/4Sight/app/4sight_app/`
- **Lite app:** `lib/lite/lite_home_screen.dart`
- **Backend:** `~/Desktop/4Sight/backend/4sight-backend/`
- **Admin:** `~/Desktop/4Sight/admin/`
- **Payments:** `~/Desktop/4Sight/payments/`
- **Curated channels:** `~/Desktop/4Sight/app/4sight_app/curation/output/`

## Privacy
- No government name tied to the business
- Use dummy wallet for setup, configure on Ledger when back home
- Atomic wallet is burned (Coinbase knows the address)
- Don't say "IPTV" in Alibaba messages (gets flagged)
- Omi got in trouble — be Raj-level discreet

## Status: 🟢 BUILDING
- App working on phone with Prime IPTV credentials
- Full suite built by Fable (5/5 deliverables)
- Next: Deploy landing page, set up payment gateway, deploy admin panel

See also: [[decisions-log]], [[project-state]], [[payments-crypto]]