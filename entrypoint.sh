#!/bin/sh

set -euo

echo "[INFO] Installing todogroup/repolinter"
npm install -g log-symbols 
npm install -g todogroup/repolinter 

if [ -z "$CUSTOM_REPOLINT_FILE" ]; then
  echo "[INFO] Insert default configuration"
  cp /repolinter/repolint.json .
fi

echo "[INFO] Executing:"
echo "[INFO] repolinter $*"
sh -c "repolinter $*"
