#!/usr/bin/env bash

set -e

$HOME/bin/gen-htpasswd "$REGISTRY_USERNAME:$REGISTRY_PASSWORD,$REGISTRY_USERS" > /app/config/docker-registry.htpasswd
$HOME/bin/gen-htpasswd "$REGISTRY_USERNAME:$REGISTRY_PASSWORD,$REGISTRY_USERS,$REGISTRY_RO_USERS" > /app/config/docker-registry-ro.htpasswd
