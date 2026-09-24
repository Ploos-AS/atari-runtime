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

## M3 — Automated emulator matrix

### M3.1 — Reusable consumer qualification — PASS
- reusable GitHub Actions workflow for consumer projects
- canonical atari-dev artifact hand-off
- ST and STE guest execution qualification
- machine-readable evidence and guest marker verification
- evidence artifact upload
- self-test run #1 PASS on both profiles

### M3.2 — Steem SSE cross-emulator qualification — PASS
- keep Hatari + EmuTOS as the authoritative baseline
- retain ST and STE profiles
- persistent machine-readable qualification evidence
- retain useful emulator logs/traces
- add Steem SSE as an independent ST/STE cross-emulator
- execute the same canonical atari-dev artifact across supported emulators
- Steem SSE + EmuTOS guest execution qualified in GitHub Actions run #120
- exact GEMDOS marker verified from the AUTO floppy after CRLF normalization

### M4.1 — ARAnyM + EmuTOS boot baseline — PASS

## M4 — Extended runtime
- ARAnyM + EmuTOS headless boot with framebuffer evidence qualified in GitHub Actions run #5
- ARAnyM extended FreeMiNT/TT/Falcon-oriented profiles

### M4.2 — FreeMiNT guest qualification — PASS
- provisioned the current redistributable upstream FreeMiNT ARAnyM snapshot
- FreeMiNT boots under ARAnyM + EmuTOS in CI
- guest-side execution is required: pid 1 `xaloader` executes `xaaes.km`
- upstream Bash startup hook creates the exact Ploos-AS PASS marker inside the FreeMiNT guest
- case-insensitive guest marker content is verified and retained as machine-readable evidence
- GitHub Actions ARAnyM integration probe run #55 PASS
- TT/Falcon profiles where supported

### M4.3 — Falcon-oriented FreeMiNT profiles — IN PROGRESS
- `falcon-040` profile qualified with standard ARAnyM build in GitHub Actions run #61
- `falcon-040` requires the same FreeMiNT guest marker and XaAES execution gates as M4.2
- profile-specific machine-readable evidence records the ARAnyM virtual-machine fidelity boundary
- standard Ubuntu ARAnyM package does not provide a separate MMU binary; qualify `falcon-040-mmu` from a dedicated MMU build next
- do not label ARAnyM as a TT emulator; TT qualification requires an emulator with an actual TT machine model
- additional emulator coverage when it adds independent value
- physical-hardware reports are optional supplemental evidence, never a release gate
