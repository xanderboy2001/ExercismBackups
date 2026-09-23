#!/usr/bin/env bash

if [[ $# -ne 2 ]]; then
  echo "Usage: line_up.sh <name> <number>"
  exit 1
fi

name="$1"
raw_number="$2"

last_one="${raw_number: -1:1}"
last_two="${raw_number: -2:2}"
suffix=""

if [[ last_one -eq 1 ]] && [[ last_two -ne 11 ]]; then
  suffix="st"
elif [[ last_one -eq 2 ]] && [[ last_two -ne 12 ]]; then
  suffix="nd"
elif [[ last_one -eq 3 ]] && [[ last_two -ne 13 ]]; then
  suffix="rd"
else
  suffix="th"
fi

echo "${name}, you are the ${raw_number}${suffix} customer we serve today. Thank you!"
