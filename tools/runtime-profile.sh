#!/bin/sh
set -eu

manifest="${ATARI_RUNTIME_MATRIX:-profiles/runtime-matrix.yml}"
profile="${1:-}"

if [ -z "$profile" ]; then
  echo "usage: $0 PROFILE" >&2
  exit 2
fi

test -s "$manifest" || { echo "runtime matrix not found: $manifest" >&2; exit 2; }

awk -v wanted="$profile" '
  /^  - id: / { id=$3; active=(id == wanted); found=found || active; next }
  active && /^    status: / { status=$2 }
  active && /^    emulator: / { emulator=$2 }
  active && /^    machine: / { machine=$2 }
  active && /^    cpu: / { cpu=$2 }
  active && /^    os: / { os=$2 }
  active && /^    evidence: / { evidence=$2 }
  END {
    if (!found) exit 3
    if (status != "PASS") exit 4
    printf "profile=%s\nemulator=%s\nmachine=%s\ncpu=%s\nos=%s\nevidence=%s\nstatus=%s\n", wanted, emulator, machine, cpu, os, evidence, status
  }
' "$manifest"
