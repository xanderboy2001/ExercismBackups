#!/usr/bin/env bash

if [[ $# -ne 1 ]] \
  || ! [[ $1 =~ ^[0-9]+$ ]]; then
  echo "Usage: leap.sh <year>"
  exit 1
fi
year=$1

if ((year % 4 == 0)); then
  if ((year % 100 == 0)); then
    if ((year % 400 == 0)); then
      echo "true"
      exit
    fi
    echo "false"
    exit
  fi
  echo "true"
  exit
fi
echo "false"
exit
