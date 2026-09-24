#!/usr/bin/env bash

if [[ $# -ne 2 ]]; then
  echo "Usage: ${0} <string> <length>"
  exit 1
fi

string="${1}"
length="${2}"

if [[ -z ${string} ]]; then
  echo "series cannot be empty"
  exit 1
fi

if [[ ${length} -gt ${#string} ]]; then
  echo "slice length cannot be greater than series length"
  exit 1
fi

if [[ ${length} -eq 0 ]]; then
  echo "slice length cannot be zero"
  exit 1
fi

if [[ ${length} -lt 0 ]]; then
  echo "slice length cannot be negative"
  exit 1
fi

declare -a result
for ((i = 0; i < ${#string}; i++)); do
  substring="${string:i:${length}}"
  if [[ ${#substring} -eq ${length} ]]; then
    result+=("${substring}")
  fi
done

if [[ -z "${result[*]}" ]]; then
  echo "error"
  exit 1
fi

(
  IFS=' '
  echo "${result[*]}"
)
