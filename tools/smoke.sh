#!/bin/sh
set -eu

hatari_version="$(hatari --version 2>&1 || true)"
printf '%s\n' "$hatari_version" | grep -qi 'hatari'
test -d /runtime/artifacts
test -d /runtime/config
test -d /runtime/roms
test ! -f /runtime/roms/tos.img

echo "M1 atari-runtime infrastructure qualification: PASS"
