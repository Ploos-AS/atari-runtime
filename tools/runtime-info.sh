#!/bin/sh
set -eu

echo "atari-runtime"
hatari --version | head -n 1
echo "profiles: st ste"
if [ -f /runtime/roms/tos.img ]; then
    echo "TOS: external image present"
else
    echo "TOS: not mounted"
fi
