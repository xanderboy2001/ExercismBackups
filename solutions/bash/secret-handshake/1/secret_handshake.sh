#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <number>"
  exit 1
fi

declare -r number="${1}"

if [[ ${number} -lt 0 ]] || [[ ${number} -gt 31 ]]; then
  echo "number cannot be less than 0 or greater than 31"
  exit 1
fi

declare -a actions
reverse=false

((number & 1)) && actions+=("wink")
((number & 2)) && actions+=("double blink")
((number & 4)) && actions+=("close your eyes")
((number & 8)) && actions+=("jump")

if ((number & 16)); then
  for ((i = ${#actions[@]} - 1; i >= 0; i--)); do
    result+=("${actions[${i}]}")
  done
else
  result=("${actions[@]}")
fi

(
  IFS=,
  echo "${result[*]}"
)
