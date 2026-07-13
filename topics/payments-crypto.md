# Payments & Crypto — Architecture

## Overview
Custom fiat-to-crypto payment gateway for 4 Sight IPTV. 
Goal: customers pay with credit/debit cards → Larry gets paid in crypto → no KYC.

## Architecture
1. Customer visits landing page → picks tier → clicks "Subscribe"
2. Payment dashboard shows fiat price and crypto conversion
3. Behind the scenes: fiat collected via merchant processor → converted to crypto
4. Crypto sent to Larry's private wallet
5. Customer gets IPTV credentials automatically

## Wallet Strategy
- **Hot wallet (temp):** Trust Wallet (fresh, NOT imported from Atomic)
  - Download from Play Store in Vegas
  - Use for collecting payments
  - Google knows about it (Play Store download)
- **Cold storage (permanent):** Ledger hardware wallet (back in SC)
  - Transfer funds from Trust Wallet to Ledger when home
  - This is the ultimate destination
- **Burned:** Atomic Wallet — Larry sent BTC/ADA from Coinbase to it, so Coinbase knows the address

## Privacy Model
- Model: Raj-level discretion (no government name tied to anything)
- NOT: Omi-level (got in legal trouble for IPTV + tax evasion)
- Build now with dummy/blank wallet address → configure real wallet when back in SC
- Ledger stays in SC, configure when home

## Status
- Payment dashboard HTML built (subscription-dashboard.html)
- Landing page with payment flow built (4sight-landing.html)
- Next: Deploy payment system, configure wallet

See also: [[4sight]], [[decisions-log]]