#!/bin/sh

set -euo

echo "[INFO] Installing todogroup/repolinter"
npm install -g log-symbols 
npm install -g todogroup/repolinter 

if [ -z "$CUSTOM_REPOLINT_FILE" ]; then
  echo "[INFO] Insert default configuration"
  cp /repolinter/repolint.yml .
  REPOLINT_FILE=repolint.yml
else
  echo "[INFO] Insert CUSTOM configuration"
  REPOLINT_FILE=$CUSTOM_REPOLINT_FILE
fi

echo "[INFO] Executing:"
echo "[INFO] repolinter $*"
sh -c "repolinter --rulesetFile $REPOLINT_FILE $*"
