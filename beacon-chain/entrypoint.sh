#!/bin/bash

# Concatenate EXTRA_OPTS string
[[ -n "$CHECKPOINT_SYNC_URL" ]] && EXTRA_OPTS="${EXTRA_OPTS} --checkpoint-sync-url=${CHECKPOINT_SYNC_URL}"

exec lighthouse \
    --debug-level $DEBUG_LEVEL \
    --network ropsten \
    beacon_node \
    --datadir /root/.lighthouse \
    --execution-endpoint $HTTP_ENGINE \
    --http \
    --http-allow-origin "*" \
    --http-address 0.0.0.0 \
    --http-port $BEACON_API_PORT \
    --port 9000 \
    --metrics \
    --metrics-address 0.0.0.0 \
    --metrics-port 8008 \
    --metrics-allow-origin "*" \
    --execution-jwt="/jwtsecret" \
    $EXTRA_OPTS
