#!/usr/bin/env bash

set -eo pipefail

PORT=

# Parse the --backend_port flag.
while :; do
  case $1 in
    --backend_port) PORT=$2; shift ;;
    *) break ;;
  esac
  shift
done

# Ensure that hello.txt is the same whether read directly from runfiles or indirectly via the
# server.
diff runfiles_server/integrationtest/hello.txt \
  <(curl -s http://localhost:"$PORT"/runfiles_server/integrationtest/hello.txt)