# atari-runtime

Standard containerized Atari runtime and qualification environment for Ploos-AS projects.

## Purpose

`atari-runtime` executes and qualifies Atari ST-family software built by [Ploos-AS/atari-dev](https://github.com/Ploos-AS/atari-dev).

The M2 contract uses the canonical `MINIMAL.PRG` runtime probe produced by `atari-dev`. CI executes that program under Hatari + EmuTOS and requires guest-side GEMDOS evidence in `C:\\MINPASS.TXT`.

## Qualification policy

Emulator qualification is the authoritative Ploos-AS Atari runtime qualification. Physical Atari hardware is not a release gate. Hatari is the reference emulator; Steem SSE is the qualified independent ST/STE cross-emulator, while ARAnyM is reserved for later extended FreeMiNT/TT/Falcon-oriented profiles. EmuTOS is the preferred freely redistributable TOS-compatible ROM for automated CI where technically suitable.

Baseline target: Hatari + EmuTOS. Cross-emulator target: the same artifact also passes Steem SSE. Physical-hardware testing, if contributed externally, is supplemental evidence only.

## Status

- **M0 — Foundation — PASS**
- **M1 — Hatari infrastructure — PASS**
- **M2 — TOS runtime qualification — PASS**
- **M3.1 — Reusable consumer qualification — PASS**
- **M3.2 — Steem SSE cross-emulator qualification — PASS**
- **M4.1 — ARAnyM extended runtime — NEXT**

M2 was qualified in GitHub Actions run #56 on both ST and STE profiles. M3.1 reusable consumer qualification was independently self-tested on both profiles in reusable qualification self-test run #1. The canonical `atari-dev` program executed under Hatari + EmuTOS and created the required guest-side marker through GEMDOS. M3.2 was qualified in Steem SSE + EmuTOS in GitHub Actions run #120: the same canonical `MINIMAL.PRG` executed from `A:\\AUTO\\PROBE.PRG`, created `MINPASS.TXT`, and the exact marker was verified after normalizing GEMDOS CRLF line endings.

## M2 qualification

The canonical runtime artifact is:

```
/runtime/artifacts/MINIMAL.PRG
```

The container includes the freely redistributable EmuTOS image used by CI:

```
/runtime/roms/emutos.img
```

Run the helper with a mounted artifact directory:

```sh
tools/qualify-m2.sh st
tools/qualify-m2.sh ste
```

A PASS requires `MINIMAL.PRG` to execute inside the emulated Atari and create `MINPASS.TXT` containing:

```
Ploos-AS atari-runtime minimal GEMDOS execution PASS
```

Merely booting EmuTOS or locating the executable is not sufficient.

## Profiles

- `st`: Atari ST / 68000 / 1 MiB
- `ste`: Atari STE / 68000 / 1 MiB

## Reusable consumer qualification

M3.1 provides a reusable GitHub Actions workflow at `.github/workflows/reusable-qualification.yml`. Consumer projects upload an artifact containing `MINIMAL.PRG`, then call the workflow with the artifact name and either the `st` or `ste` profile. The workflow builds the canonical runtime, executes the guest probe, verifies `m2-result.txt` plus `MINPASS.TXT`, and uploads qualification evidence.

Example caller:

```yaml
jobs:
  qualify-atari:
    uses: Ploos-AS/atari-runtime/.github/workflows/reusable-qualification.yml@main
    with:
      artifact-name: atari-build
      profile: st
```

The caller artifact must contain `MINIMAL.PRG` at its root.
