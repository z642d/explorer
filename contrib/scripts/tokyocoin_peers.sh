#!/bin/bash

tokyocoinexplorerDir=/usr/lib/node_modules/tokyocoinexplorer

cd "${tokyocoinexplorerDir}" || exit $?
node --stack-size=16384 scripts/peers.js
