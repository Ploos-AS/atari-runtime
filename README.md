# atari-runtime

Standard containerized Atari runtime and qualification environment for Ploos-AS projects.

## Purpose

`atari-runtime` executes and qualifies Atari ST-family software built by [Ploos-AS/atari-dev](https://github.com/Ploos-AS/atari-dev).

M2 defines the hand-off for a real TOS executable: `atari-dev` produces `HELLO.TOS`, and this runtime stages that exact artifact for emulator qualification.

## Qualification policy

Emulator qualification is the authoritative Ploos-AS Atari runtime qualification. Physical Atari hardware is not a release gate. Hatari is the reference emulator; Steem SSE is the planned independent ST/STE cross-emulator, while ARAnyM is reserved for later extended FreeMiNT/TT/Falcon-oriented profiles. EmuTOS is the preferred freely redistributable TOS-compatible ROM for automated CI where technically suitable.

Baseline target: Hatari + EmuTOS. Cross-emulator target: the same artifact also passes Steem SSE. Physical-hardware testing, if contributed externally, is supplemental evidence only.

## Status

- **M0 — Foundation — PASS**
- **M1 — Hatari infrastructure — PASS**
- **M2 — TOS artifact qualification — IMPLEMENTED / runtime evidence pending**

## M2 qualification

Place the application at:

```
/runtime/artifacts/HELLO.TOS
```

and a legally obtained TOS image, when required, at:

```
/runtime/roms/tos.img
```

Run:

```sh
tools/qualify-m2.sh st
```

The helper validates the artifact and ROM contract and then launches the configured ST/STE profile. ROM files remain external and are never distributed by this repository or image.

Current CI remains ROM-free until the EmuTOS path is integrated. The target is fully automated Hatari + EmuTOS execution without proprietary Atari ROM material.

## Profiles

- `st`: Atari ST / 68000 / 1 MiB
- `ste`: Atari STE / 68000 / 1 MiB
