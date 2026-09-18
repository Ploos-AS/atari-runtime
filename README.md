# atari-runtime

Standard containerized Atari runtime and qualification environment for Ploos-AS projects.

## Purpose

`atari-runtime` is the canonical runtime environment for executing and qualifying Atari ST-family software built with [Ploos-AS/atari-dev](https://github.com/Ploos-AS/atari-dev).

M1 establishes Hatari discovery, version reporting, external TOS handling and reproducible ST/STE profile descriptions. TOS images are always supplied by the user and are never committed to this repository or baked into the image.

## M1 usage

Build:

```sh
docker build -t atari-runtime:m1 -f Containerfile .
```

Inspect runtime:

```sh
docker run --rm atari-runtime:m1 tools/runtime-info.sh
```

Validate repository/runtime policy without a ROM:

```sh
docker run --rm atari-runtime:m1 tools/smoke.sh
```

For an actual emulator launch, mount a legally obtained TOS image read-only at `/runtime/roms/tos.img` and project artifacts at `/runtime/artifacts`.

```sh
docker run --rm -it \
  -v /path/to/tos.img:/runtime/roms/tos.img:ro \
  -v "$PWD/dist:/runtime/artifacts:ro" \
  atari-runtime:m1 tools/launch.sh st
```

## Profiles

M1 defines two baseline profiles:

- `st`: Atari ST, 68000, 1 MiB RAM
- `ste`: Atari STE, 68000, 1 MiB RAM

The launch helper maps these profiles to Hatari command-line options so consumer projects do not duplicate emulator policy.

## Qualification contract

M1 can qualify the runtime infrastructure without proprietary ROM material. Executing a real TOS program requires an externally supplied TOS image. M2 will consume the TOS-native qualification artifact produced by `atari-dev` and record machine-readable evidence.

## Status

**M0 — Foundation — PASS**

**M1 — Hatari qualification baseline — PASS (infrastructure/static qualification)**
