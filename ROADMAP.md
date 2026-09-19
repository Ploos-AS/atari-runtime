# Roadmap

## M0 — Foundation — PASS
- repository baseline
- MIT licence
- Hatari container
- runtime/config/artifact mounts

## M1 — Hatari qualification baseline — PASS
- Hatari version reporting
- ST/STE profiles
- EmuTOS integration
- automated CI smoke test

## M2 — TOS runtime qualification — PASS
- consume canonical `MINIMAL.PRG` from atari-dev
- validate the atari-dev → atari-runtime hand-off
- execute the same canonical artifact under ST and STE profiles
- Hatari + EmuTOS automated runtime qualification
- require guest-side `C:\\MINPASS.TXT` GEMDOS evidence
- verify the exact PASS marker
- GitHub Actions run #56 qualified both ST and STE

Physical Atari hardware is not required. Emulator qualification is authoritative for this project.

## M3 — Automated emulator matrix — NEXT
- keep Hatari + EmuTOS as the authoritative baseline
- retain ST and STE profiles
- reusable consumer workflow
- persistent machine-readable qualification evidence
- retain useful emulator logs/traces
- add Steem SSE as an independent ST/STE cross-emulator
- execute the same canonical atari-dev artifact across supported emulators

## M4 — Extended runtime
- ARAnyM extended FreeMiNT/TT/Falcon-oriented profiles
- TT/Falcon profiles where supported
- additional emulator coverage when it adds independent value
- physical-hardware reports are optional supplemental evidence, never a release gate
