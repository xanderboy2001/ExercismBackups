#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
  echo "Usage: pangram.sh <sentence>"
  exit
fi

input=${1,,}

for char in {a..z}; do
  if [[ "${input}" != *"${char}"* ]]; then
    echo "false"
    exit
  fi
done

echo "true"
exit
