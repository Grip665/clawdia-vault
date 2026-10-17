# Someday / Parking Lot

Things Larry wants kept in mind but NOT worked now. Promote out of here only when he says go.

- **Wire up voice-call (outbound calling)** — added 2026-10-16. `voice-call` plugin is installed + enabled, but **no telephony provider or number** is configured (no Twilio/telephony creds anywhere), so the agent **cannot place calls**. To enable: pick a provider (Twilio/Telnyx/Plivo…), add creds + a from-number to `plugins.entries."voice-call"`, allowlist who it may dial, then test. Until then, do **not** offer or attempt calls. (Larry: "you cant call anyone yet… i dont remember us setting that up.")
