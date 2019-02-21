#!/bin/sh
set -euo pipefail

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- wp "$@"
fi

exec "$@"