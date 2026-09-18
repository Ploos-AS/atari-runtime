# Roadmap

## M0 — Foundation — PASS
- repository baseline
- MIT licence
- Hatari container
- external ROM/config/artifact mounts

## M1 — Hatari qualification baseline — PASS
- Hatari version reporting
- ST/STE profiles
- ROM discovery
- ROM-free CI smoke test

## M2 — TOS artifact qualification — IMPLEMENTED / RUNTIME EVIDENCE PENDING
- accept the canonical `HELLO.TOS` artifact from atari-dev
- validate artifact hand-off
- launch same artifact under ST/STE profile
- preserve external-only TOS policy
- machine-readable evidence skeleton

M2 becomes runtime PASS when the canonical artifact executes successfully under Hatari with EmuTOS (or another legally usable TOS-compatible environment). Physical hardware is not required.

## M3 — Automated emulator matrix
- Hatari + EmuTOS authoritative baseline
- ST and STE profiles
- consume the same atari-dev artifact
- automated evidence collection
- screenshots/logs where useful
- reusable consumer workflow
- Steem SSE independent ST/STE cross-emulator qualification

## M4 — Extended runtime
- ARAnyM extended FreeMiNT/TT/Falcon-oriented profiles
- TT/Falcon profiles where supported
- additional emulator coverage when it adds independent value
- physical-hardware reports are optional supplemental evidence, never a release gate
