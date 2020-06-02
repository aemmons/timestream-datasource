#!/bin/bash

# so dlv and mage are in the path
export PATH=$(go env GOPATH)/bin:$PATH

PLUGIN_NAME="gpx_newrelic"
PLUGIN_PID=`pgrep ${PLUGIN_NAME}`
PORT="${2:-3222}"

# Calling mage causes it to stop working
# PLUGIN_PID=$(mage pid)

dlv attach ${PLUGIN_PID} --headless --listen=:${PORT} --api-version 2 --log

## TODO - why doesn't this work?
#mage -v attach
