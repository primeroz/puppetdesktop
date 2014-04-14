#!/bin/bash
if not [ "$(id -u)" -eq 0 ]; then
    echo "execute me as root -.-" >&2
    exit 1
else
    basedir="$(dirname $0)"
    puppet apply --modulepath "${basedir}/modules" "${basedir}/run.pp" "$@"
fi

