#!/bin/sh
set -eu

profile="${1:-st}"
artifact=/runtime/artifacts/MINIMAL.PRG
rom=/runtime/roms/emutos.img
marker=/runtime/artifacts/MINPASS.TXT
evidence=/runtime/artifacts/m2-result.txt
expected='Ploos-AS atari-runtime minimal GEMDOS execution PASS'

case "$profile" in
    st|ste) ;;
    *)
        echo "ERROR: unsupported M2 profile: $profile" >&2
        exit 2
        ;;
esac

if [ ! -s "$artifact" ]; then
    echo "ERROR: missing canonical atari-dev runtime probe: $artifact" >&2
    exit 3
fi
if [ ! -s "$rom" ]; then
    echo "ERROR: missing bundled EmuTOS image: $rom" >&2
    exit 4
fi

rm -f "$marker"
: > "$evidence"

finish() {
    status="$1"
    {
        echo "milestone=M2"
        echo "profile=$profile"
        echo "emulator=hatari"
        echo "rom=emutos"
        echo "artifact=MINIMAL.PRG"
        echo "guest_marker=MINPASS.TXT"
        echo "status=$status"
    } > "$evidence"
}
trap 'finish FAIL' EXIT HUP INT TERM

Xvfb :99 -screen 0 1024x768x24 >/tmp/xvfb.log 2>&1 &
xvfb_pid=$!
export DISPLAY=:99
sleep 1

set +e
timeout --signal=TERM --kill-after=2s 45s hatari \
    --machine "$profile" \
    --memsize 1 \
    --tos "$rom" \
    --harddrive /runtime/artifacts \
    --gemdos-drive C \
    --auto MINIMAL.PRG \
    --run-vbls 1500
rc=$?
set -e

kill "$xvfb_pid" 2>/dev/null || true
wait "$xvfb_pid" 2>/dev/null || true

if [ ! -s "$marker" ] || ! grep -Fq "$expected" "$marker"; then
    echo "ERROR: canonical Atari program did not create valid guest marker (hatari rc=$rc)" >&2
    exit 5
fi

trap - EXIT HUP INT TERM
finish PASS
cat "$evidence"
printf 'M2 %s: PASS\n' "$profile"
