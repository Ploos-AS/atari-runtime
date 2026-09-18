#!/bin/sh
set -eu

profile="${1:-st}"
rom=/runtime/roms/tos.img

if [ ! -f "$rom" ]; then
    echo "ERROR: mount a legally obtained TOS image at $rom" >&2
    exit 2
fi

case "$profile" in
  st)
    machine=st
    memory=1
    ;;
  ste)
    machine=ste
    memory=1
    ;;
  *)
    echo "ERROR: unknown profile: $profile (expected st or ste)" >&2
    exit 2
    ;;
esac

exec hatari --machine "$machine" --memsize "$memory" --tos "$rom" --harddrive /runtime/artifacts
