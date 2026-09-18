# atari-runtime

Standard containerized Atari runtime and qualification environment for Ploos-AS projects.

## Purpose

`atari-runtime` executes and qualifies Atari ST-family software built by [Ploos-AS/atari-dev](https://github.com/Ploos-AS/atari-dev).

M2 defines the hand-off for a real TOS executable: `atari-dev` produces `HELLO.TOS`, and this runtime stages that exact artifact for Hatari.

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

Automated CI remains ROM-free. It validates the runtime image and artifact contract; actual Atari execution is recorded only when a legal runtime ROM is supplied.

## Profiles

- `st`: Atari ST / 68000 / 1 MiB
- `ste`: Atari STE / 68000 / 1 MiB
