#!/bin/sh
set -eu

profile="${1:-st}"
rom="${ATARI_ROM:-/runtime/roms/emutos.img}"

if [ ! -f "$rom" ]; then
    echo "ERROR: Atari ROM not found at $rom" >&2
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

exec hatari --machine "$machine" --memsize "$memory" --tos "$rom" --harddrive /runtime/artifacts ${ATARI_HATARI_ARGS:-}
