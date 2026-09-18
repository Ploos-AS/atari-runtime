#!/bin/sh
set -eu

hatari_version="$(hatari --version 2>&1 || true)"
printf '%s\n' "$hatari_version" | grep -qi 'hatari'
test -d /runtime/artifacts
test -d /runtime/config
test -d /runtime/roms
test -s /runtime/roms/emutos.img

echo "atari-runtime Hatari + EmuTOS infrastructure qualification: PASS"
