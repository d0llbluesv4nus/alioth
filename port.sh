#!/usr/bin/env bash
set -euo pipefail
trap 'echo "[ERROR] Failed at line $LINENO" >&2' ERR


ROOT_DIR=$(pwd)
source scripts/env.sh


usage() {
cat <<EOF
Usage: ./port.sh \
--donor <url|path> \
--stock <url|path> \
--type <AOSP|MIUI|GSI|HyperOS> \
--android <version> \
[--magisk] [--rebuild-boot]
EOF
}


ARGS=$(getopt -o '' -l donor:,stock:,type:,android:,magisk,rebuild-boot -- "$@") || usage


DONOR=""; STOCK=""; ROM_TYPE=""; ANDROID_VER=""; MAGISK=false; REBUILD_BOOT=false


while true; do
case "$1" in
--donor) DONOR="$2"; shift 2;;
--stock) STOCK="$2"; shift 2;;
--type) ROM_TYPE="$2"; shift 2;;
--android) ANDROID_VER="$2"; shift 2;;
--magisk) MAGISK=true; shift;;
--rebuild-boot) REBUILD_BOOT=true; shift;;
--) shift; break;;
*) break;;
esac
done


log "Starting port for alioth"


source scripts/deps.sh
source scripts/fetch.sh
source scripts/extract_donor.sh
source scripts/extract_stock.sh
source scripts/checks.sh
source scripts/adapt.sh
source scripts/build_images.sh


if $REBUILD_BOOT; then
source scripts/build_boot.sh
fi


source scripts/package.sh


log "Porting completed successfully"
