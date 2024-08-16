#!/usr/bin/env bash
# shellcheck shell=bash
set -euf -o pipefail

PROGDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly PROGDIR

if [ ! -f certs/cert.pem ]; then \
	curl http://traefik.me/fullchain.pem -o certs/cert.pem; \
fi
if [ ! -f certs/privkey.pem ]; then \
	curl http://traefik.me/privkey.pem -o certs/privkey.pem; \
fi
	
printf '%s' "$(id -u)" > ./certs/UID