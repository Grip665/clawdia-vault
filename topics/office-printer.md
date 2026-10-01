# Office Printer (Brother MFC-L2900DW) — setup notes

## Networks at the office (found 2026-09-30)
Two Spectrum SSIDs, BOTH in 192.168.1.x, isolated from each other:
- **SpectrumSetup-98C1** — Brother at **192.168.1.2**, 3060 at .232. (printer's network)
- **SpectrumSetup-C3** — Epson ET-4810 at .36, iMac used to live here (.8).
Isolation is what broke printing: Mac on C3 could not see the Brother on 98C1.

## FIX APPLIED 2026-09-30
- iMac Wi-Fi moved to **SpectrumSetup-98C1** (now 192.168.1.106). It reaches the Brother directly.
- macOS promoted 98C1 to top of preferred networks -> Mac stays there.
- CUPS queue `Brother_MFC_L2900DW` -> `ipp://192.168.1.2:631/ipp/print`. Default unchanged. Tested OK.
- Brother supports IPP 631 / raw 9100 / web 80 / URF (AirPrint).

## Fallback if the Mac ever can't reach the Brother
Relay exists (disabled): `~/.openclaw/bin/brother-relay.sh` on the HP →
`ssh -N -L 0.0.0.0:6631:192.168.1.2:631 -L 0.0.0.0:6632:192.168.1.2:9100 3060`
Then set the Mac queue to `ipp://10.192.166.179:6631/ipp/print`. Re-add `@reboot` line to HP crontab.
Depends on: HP up + 3060 online + Brother on 98C1.

## Toner subscription
Larry has a 3rd-party (non-Brother) toner cartridge; printer shows a subscription message ("you'll still
be charged"). Printing works (state-reason: other-warning). To stop billing, CANCEL the subscription in
the Brother account — swapping the cartridge does not stop it.
