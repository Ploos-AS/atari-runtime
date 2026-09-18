# atari-runtime

Standard containerized Atari runtime and qualification environment for Ploos-AS projects.

## Purpose

`atari-runtime` is the canonical runtime environment for executing and qualifying Atari ST-family software built with [`Ploos-AS/atari-dev`](https://github.com/Ploos-AS/atari-dev).

Initial M0 scope targets Atari ST/STE first. TT/Falcon support can be added later where useful.

## M0 baseline

- reproducible container-based runtime environment
- Hatari as the initial primary emulator
- runtime configuration mounted from outside the image
- project artifacts mounted into the runtime for qualification
- CI-friendly smoke-test path where emulator behaviour permits it
- no proprietary Atari TOS ROM images in the repository or container image
- user-supplied, legally obtained TOS images only

## Qualification model

The runtime should make it possible to distinguish application defects from emulator-specific behaviour. Hatari is the first baseline emulator; a second independent emulator may be added later for cross-verification.

## Ploos-AS standards

- Software and runtime infrastructure: MIT by default unless an inherited licence applies.
- Documentation and educational material: CC BY-SA 4.0 by default unless an inherited licence applies.
- Documentation source: Markdown, with `Ploos-AS/Documentation-Tools` used for generated documentation where applicable.

## Status

**M0 — Foundation — IN PROGRESS**

M0 establishes repository structure, licensing, emulator baseline and the contract with `atari-dev`.
