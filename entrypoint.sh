#!/bin/sh

echo "::group::Setup Repolinter"
set -euo

echo "[INFO] Installing todogroup/repolinter"
npm install -g log-symbols 
npm install -g todogroup/repolinter 

if [ -n "$CUSTOM_REPOLINT_URL" ]; then
  echo "[INFO] Insert CUSTOM configuration url"
  REPOLINT_ARG="--rulesetUrl $CUSTOM_REPOLINT_URL"
elif [ -n "$CUSTOM_REPOLINT_FILE" ]; then
  echo "[INFO] Insert CUSTOM configuration file"
  REPOLINT_ARG="--rulesetFile $CUSTOM_REPOLINT_FILE"
else
  echo "[INFO] Insert default configuration"
  cp /repolinter/repolint.yml .
  REPOLINT_ARG="--rulesetFile repolint.yml"
fi

echo "[INFO] Executing:"
echo "[INFO] repolinter $*"
echo "::endgroup::"

sh -c "repolinter $REPOLINT_ARG $*"
