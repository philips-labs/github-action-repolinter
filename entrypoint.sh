#!/bin/sh

set -euo

echo "[INFO] Installing todogroup/repolinter"
npm install -g log-symbols 
npm install -g todogroup/repolinter 

echo "[INFO] Checking custom repolint file"
if [ -n "$CUSTOM_REPOLINT_FILE" ]; then
  echo "[INFO] Using custom repolint file"
  cp -ar $CUSTOM_REPOLINT_FILE /repolinter/repolint.json 
fi

echo "[INFO] Executing:"
echo "[INFO] repolinter $*"
sh -c "repolinter $*"
