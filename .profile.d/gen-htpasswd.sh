#!/usr/bin/env bash
set -ex

echo -e "${REGISTRY_USERNAME}:$(perl -le 'print crypt($ENV{"REGISTRY_PASSWORD"}, rand(0xffffffff));')" > /app/config/docker-registry.htpasswd
