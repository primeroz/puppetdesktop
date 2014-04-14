#!/bin/bash
if ! [ "$(id -u)" -eq 0 ]; then
    echo "execute me as root -.-" >&2
    exit 1
else
    basedir="$(dirname $0)"
    puppet apply --modulepath "${basedir}/modules" --hiera_config "${basedir}/hiera.yaml" "${basedir}/manifests/default.pp" "$@"
fi

