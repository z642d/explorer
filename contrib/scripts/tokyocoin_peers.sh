#!/bin/bash

explorerDir=/usr/lib/node_modules/explorer

cd "${explorerDir}" || exit $?
node --stack-size=16384 scripts/peers.js
