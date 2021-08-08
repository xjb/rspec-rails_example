#!/usr/bin/env bash
set -Eeo pipefail

bundle install

exec "$@"