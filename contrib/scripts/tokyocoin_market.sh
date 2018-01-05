#!/bin/bash

myName=$(basename ${0} .sh)
read junk dbName extraOpts <<< ${myName//_/ }
explorerDir=/usr/lib/node_modules/explorer
pidFile="${explorerDir}/tmp/${dbName}.pid"

# Do noting if already running
[ -r "${pidFile}" ] && kill -n 0 $(< "${pidFile}") && exit 0 
[ -f "${pidFile}" ] && rm -f "${pidFile}"
cd "${explorerDir}" || exit $?
node --stack-size=16384 scripts/sync.js ${dbName} ${extraOpts}
