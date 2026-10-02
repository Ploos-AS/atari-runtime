# Atari runtime qualification matrix

This file is the machine-readable source of truth for the runtime profiles qualified by this repository.

| Profile | Emulator | Machine / CPU | OS | Guest execution gate | Status |
| --- | --- | --- | --- | --- | --- |
| `st` | Hatari | Atari ST / 68000 | EmuTOS | canonical `MINIMAL.PRG` + exact `MINPASS.TXT` | PASS |
| `ste` | Hatari | Atari STE / 68000 | EmuTOS | canonical `MINIMAL.PRG` + exact `MINPASS.TXT` | PASS |
| `st` | Steem SSE | Atari ST / 68000 | EmuTOS | canonical `MINIMAL.PRG` + exact `MINPASS.TXT` | PASS |
| `ste` | Steem SSE | Atari STE / 68000 | EmuTOS | canonical `MINIMAL.PRG` + exact `MINPASS.TXT` | PASS |
| `tt` | Hatari | Atari TT / 68030 | EmuTOS | canonical `MINIMAL.PRG` + exact `MINPASS.TXT` | PASS |
| `tt-freemint` | Hatari | Atari TT / 68030 | FreeMiNT 1.19 | FAT16 ACSI guest probe + exact `PLOOSPAS.TXT` | PASS |
| `falcon-040` | ARAnyM | Falcon-oriented / 68040 | FreeMiNT | bootstrap + XaAES + exact guest marker | PASS |
| `falcon-040-mmu` | ARAnyM full-MMU build | Falcon-oriented / 68040 + MMU | FreeMiNT | bootstrap + XaAES + exact guest marker | PASS |

Physical hardware reports are supplemental evidence only and are not release gates.
