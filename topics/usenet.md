# Usenet — Media Backup & Automation Reference

**Status:** 🟡 Researched, not set up (as of 2026-07-25)
**Why:** Backup for IPTV content that gets taken down, plus automated on-demand media server

---

## How It Works

- **Providers** — host the content on their servers (like a cloud storage service)
- **Indexers** — search engines that tell you where content is (via `.nzb` files, equivalent to `.torrent`)
- **Download client** — SABnzbd or NZBGet grabs the files
- **Automation** — Sonarr (TV) + Radarr (Movies) + Prowlarr (indexer manager) talk to each other

**Automation flow:**
```
Indexer → NZB → SABnzbd (download) → Sonarr/Radarr (organize) → Plex/Jellyfin (watch)
```

---

## The Stack (Recommended Cheapest Setup)

### Provider (1 primary + 1 block backup)

| Option | Backbone | Price | Retention | Notes |
|--------|----------|-------|-----------|-------|
| **Newshosting** | Omicron | $5.99/mo | 6,545 days | Best overall, US+EU servers, includes VPN |
| **Eweka** | Eweka (NL) | €4.99/mo | 6,485+ days | Best EU, NTD policy (slower takedowns) |
| **NewsDemon** | UsenetExpress | $3-6/mo | 4,000+ days | Cheapest solid primary |
| **Frugal Usenet** | Netnews hybrid | $5.99/mo | — | Good budget option |
| **Bulknews** (block) | Abavia | One-time $ | Block account | Best cheap fill backup |

**Recommended combo (cheapest):** NewsDemon ~$3-6/mo + Bulknews block account ~$20-40 one-time

**Best value primary:** Newshosting at $5.99/mo (includes 3 backbones + VPN)

### Indexers

| Indexer | Type | Price | Notes |
|---------|------|-------|-------|
| **NZBGeek** | Paid | $12/yr or $40/5yr | Open registration, great general use, lifetime avail |
| **NZBFinder** | Paid | €10/yr | Open registration, clean API, great for automation |
| **DrunkenSlug** | Freemium | ~$10/yr | Invite only, finds obscure/old content |
| **NinjaCentral** | Paid | ~$10/yr | Periodic open registration, fastest indexing |
| **NZBPlanet** | Freemium | ~$10/yr | Good for beginners, lifetime option |

**Recommended:** NZBGeek as primary ($12/yr) + NZBFinder as backup ($10/yr)

### Download Clients

- **SABnzbd** — most popular, runs as web UI, great with Sonarr/Radarr
- **NZBGet** — lighter, C++ based, uses less RAM (being phased out slowly)

### Automation

- **Sonarr** — TV show management (add show → it finds + downloads + organizes automatically)
- **Radarr** — Movie management (same idea)
- **Prowlarr** — Indexer manager (connects all indexers to Sonarr/Radarr with one config)
- **Plex / Jellyfin** — Media server to watch everything

---

## Black Friday Strategy

The **best deals of the year** are Black Friday / Cyber Monday (early Nov–Cyber Monday). Historically:

- **Newshosting:** $1.67/mo for 15 months (92% off) — includes Easynews + Tweaknews + VPN
- **Eweka:** €2.50/mo for 15 months (83% off)
- **NewsDemon:** $5/mo unlimited + VPN

**Strategy:** Wait for Black Friday 2026, grab a multi-year or long-term deal. People stack multiple years at the discounted rate.

---

## Why It Fits With IPTV Setup

- **Same hardware** — the 3060 laptop or HP already runs the IPTV backend; adding Docker containers for SABnzbd + Sonarr + Radarr + Prowlarr is trivial
- **Complementary** — IPTV for live/sports/cable, Usenet for on-demand movies/shows
- **Zero seeding** — no ratio to maintain, no VPN needed for download (SSL to provider)
- **Privacy by design** — nobody sees what you download

---

## Cost Summary (Full Setup)

| Item | Cost |
|------|------|
| Provider (NewsDemon or similar) | ~$3-6/mo |
| Indexer (NZBGeek) | ~$12/yr |
| Indexer backup (NZBFinder) | ~$10/yr |
| **Total per month** | **~$4-7/mo** |

Or wait for Black Friday and lock in $1.67-$2.50/mo.

---

## When to Revisit

- Black Friday 2026 (November) for best pricing
- Or whenever the IPTV setup is stable and we want to add on-demand media
- If Sonarr/Radarr automation is needed → set up full stack at once