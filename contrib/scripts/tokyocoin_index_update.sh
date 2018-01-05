#!/bin/bash

myName=$(basename ${0} .sh)
read junk dbName extraOpts <<< ${myName//_/ }
tokyocoinexplorerDir=/usr/lib/node_modules/tokyocoinexplorer
pidFile="${tokyocoinexplorerDir}/tmp/${dbName}.pid"

# Do noting if already running
[ -r "${pidFile}" ] && kill -n 0 $(< "${pidFile}") && exit 0 
[ -f "${pidFile}" ] && rm -f "${pidFile}"
cd "${tokyocoinexplorerDir}" || exit $?
node --stack-size=16384 scripts/sync.js ${dbName} ${extraOpts}
