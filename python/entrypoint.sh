#!/bin/bash


set -x
SLEEP_SECOND=5

wait_for() {
  echo "Waiting $3" started, waiting for "$1" to listen on "$2"...
  while ! nc -z "$1" "$2"; do echo waiting...; sleep "$SLEEP_SECOND"; done
}


## Start SSH Server
service ssh start
wait_for python 22


tail -f /dev/null

