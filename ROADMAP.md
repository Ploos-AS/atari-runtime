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

### M4.3 — Extended FreeMiNT machine profiles — PASS
- `falcon-040` profile qualified with standard ARAnyM build in GitHub Actions run #61
- `falcon-040` requires the same FreeMiNT guest marker and XaAES execution gates as M4.2
- profile-specific machine-readable evidence records the ARAnyM virtual-machine fidelity boundary
- `falcon-040-mmu` qualified from a dedicated upstream ARAnyM full-MMU build: full MMU, FreeMiNT bootstrap, XaAES and guest marker PASS
- standard Ubuntu ARAnyM package remains the non-MMU `falcon-040` baseline
- do not label ARAnyM as a TT emulator; TT qualification requires an emulator with an actual TT machine model
- Hatari `tt` machine qualified with EmuTOS boot, canonical `MINIMAL.PRG` guest execution, and a CI-built FreeMiNT 68030 kernel
- TT FreeMiNT boots natively from a FAT16 ACSI disk and executes a guest-side probe
- exact `PLOOSPAS.TXT` FAT 8.3 marker is persisted to the ACSI image and verified host-side
- TT FreeMiNT qualification PASS in GitHub Actions run #36924355353
- additional emulator coverage when it adds independent value
- physical-hardware reports are optional supplemental evidence, never a release gate

### M4.4 — Explicit runtime matrix — PASS
- maintain a single explicit matrix of qualified emulator, machine, CPU and OS combinations
- distinguish actual Atari TT emulation from ARAnyM Falcon-oriented virtual-machine profiles
- record the required guest-side evidence gate for every supported runtime profile
- keep physical hardware supplemental rather than a release gate
- machine-readable `profiles/runtime-matrix.yml` is CI-validated
- GitHub Actions qualification run #37116922793 PASS

### M4.5 — Reusable runtime contract — PASS
- expose qualified runtime profiles through a stable command-line contract
- allow consumer repositories to require a profile and fail closed when it is unknown or not PASS
- keep the contract backed by the M4.4 machine-readable matrix
- validate all currently qualified profiles in CI
- reusable qualification workflow fails closed unless the requested profile is present and PASS
- GitHub Actions qualification run #37119923731 PASS
