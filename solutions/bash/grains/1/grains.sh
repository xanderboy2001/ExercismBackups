#!/usr/bin/env bash

if [[ "$1" == "total" ]]; then
  printf "%u\n" $((~0))
elif [[ "$1" -ge 1 && "$1" -le 64 ]]; then
  exp=$(("$1" - 1))
  printf "%u\n" $((2 ** exp))
else
  echo "Error: invalid input"
  exit 1
fi
