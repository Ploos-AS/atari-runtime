#!/bin/sh
set -eu

profile="${1:-st}"
artifact=/runtime/artifacts/HELLO.TOS
rom=/runtime/roms/tos.img
evidence=/runtime/artifacts/m2-result.txt

if [ ! -s "$artifact" ]; then
    echo "ERROR: missing atari-dev M2 artifact: $artifact" >&2
    exit 2
fi

{
    echo "milestone=M2"
    echo "profile=$profile"
    echo "artifact=HELLO.TOS"
    echo "artifact_present=yes"
    if [ -f "$rom" ]; then
        echo "tos_external=yes"
        echo "status=LAUNCHING"
    else
        echo "tos_external=no"
        echo "status=PENDING_RUNTIME_ROM"
    fi
} > "$evidence"

if [ ! -f "$rom" ]; then
    cat "$evidence"
    exit 3
fi

exec /runtime/tools/launch.sh "$profile"
