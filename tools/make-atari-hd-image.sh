#!/bin/sh
set -eu

# Create a small DOS-partitioned FAT16 disk image compatible with
# EmuTOS/Hatari. Layout follows Hatari's atari-hd-image.sh approach.
size_mb=${1:-16}
image=${2:-tt-freemint-hd.img}
label=${3:-PLOOSTT}

case "$size_mb" in *[!0-9]*|'') echo "invalid size" >&2; exit 2;; esac
[ "$size_mb" -ge 8 ] && [ "$size_mb" -le 512 ]

heads=16
spt=32
partsectors=$((4*size_mb*heads*spt))
part="$image.part"
rm -f "$image" "$part"

python3 - "$image" "$partsectors" "$heads" "$spt" <<'PY'
import struct,sys
path=sys.argv[1]; n=int(sys.argv[2]); heads=int(sys.argv[3]); spt=int(sys.argv[4])
m=bytearray(512)
total=1+n
struct.pack_into("<H",m,0x0b,512)
m[0x0d]=2
struct.pack_into("<H",m,0x0e,1)
m[0x15]=0xf8
struct.pack_into("<H",m,0x18,spt)
struct.pack_into("<H",m,0x1a,heads)
m[0x24]=0x80
if total < 65536: struct.pack_into("<H",m,0x13,total)
struct.pack_into("<I",m,0x20,total)
o=0x1be
m[o]=0x80
m[o+4]=0x04 if total < 65536 else 0x06
struct.pack_into("<I",m,o+8,1)
struct.pack_into("<I",m,o+12,n-1)
m[510:512]=b"\x55\xaa"
open(path,"wb").write(m)
PY

sectors=$((partsectors-1))
track=32
clusters=$((sectors/2))
while [ "$clusters" -gt 32765 ]; do clusters=$((clusters/2)); track=$((track*2)); done
sectors=$((sectors/track*track))
kb=$((sectors/2))
mkfs.fat -A -F 16 -n "$label" -C "$part" "$kb"
dd if="$part" of="$image" bs=512 seek=1 count="$sectors" status=none
rm -f "$part"
test -s "$image"
echo "$image"
