#!/bin/sh
set -eu

hatari --version >/dev/null
test -d /runtime/artifacts
test -d /runtime/config
test -d /runtime/roms
test ! -f /runtime/roms/tos.img

echo "M1 atari-runtime infrastructure qualification: PASS"
