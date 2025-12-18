#!/usr/bin/env bash
log() { echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"; }


export WORKDIR="$PWD/work"
export OUTDIR="$PWD/out"
mkdir -p "$WORKDIR" "$OUTDIR"
