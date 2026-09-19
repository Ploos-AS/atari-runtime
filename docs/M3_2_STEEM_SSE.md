# M3.2 — Steem SSE qualification plan

Status: IMPLEMENTATION STARTED

## Goal

Add an emulator implementation independent of Hatari for ST/STE cross-emulator qualification while preserving Hatari + EmuTOS as the authoritative baseline.

## Qualification contract

Steem SSE must execute the same canonical `MINIMAL.PRG` produced by `atari-dev`.

A Steem SSE PASS must prove guest execution, not merely emulator startup. The preferred evidence is the same exact marker used by Hatari:

```
Ploos-AS atari-runtime minimal GEMDOS execution PASS
```

No test may be weakened to convert emulator startup into a runtime PASS.

## Integration constraints

- CI must remain redistributable and must not require proprietary Atari TOS ROM material.
- EmuTOS is therefore the intended ROM where Steem SSE supports it.
- ST and STE profiles remain the required machine matrix.
- Steem SSE is supplementary cross-emulator evidence; Hatari remains the reference emulator.
- Physical Atari hardware is optional supplemental evidence only.
- The implementation should be container/reproducibility friendly and suitable for GitHub-hosted Linux runners.

## Investigation

Upstream Steem documentation describes command-line startup and disk-image loading, but the historically documented executable/interface is Windows-oriented. Before making Steem SSE a release gate, M3.2 must prove a reproducible Linux CI execution path and determine how to inject/execute the canonical PRG and extract guest evidence.

Implementation phases:

1. **M3.2a — integration probe**
   - identify maintained Steem SSE source/binary suitable for Linux CI
   - record exact upstream revision/version
   - build or install reproducibly
   - prove emulator startup under Xvfb/headless CI graphics

2. **M3.2b — EmuTOS boot**
   - boot bundled EmuTOS
   - establish ST and STE configuration
   - retain boot logs/evidence

3. **M3.2c — canonical program execution**
   - expose `MINIMAL.PRG` to the guest
   - execute it automatically
   - require guest-created marker evidence

4. **M3.2d — matrix/reusable integration**
   - ST PASS
   - STE PASS
   - publish evidence artifacts
   - integrate with the reusable consumer qualification interface

If a reproducible Linux Steem SSE path cannot be established, keep the limitation documented and evaluate another genuinely independent ST/STE emulator rather than pretending Steem SSE is qualified.
