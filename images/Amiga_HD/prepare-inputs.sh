#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
mkdir -p inputs
for letter in A B C D; do
    case "$letter" in A|C) disk=2;; B) disk=3;; D) disk=4;; esac
    for source in "../Amiga/Disk $disk/Disk$letter-"*.png; do
        magick "$source" -sample 352x128\! "inputs/$(basename "$source")"
    done
done
