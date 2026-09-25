#!/usr/bin/env bash

number="${1}"

if [[ ${number} -le 0 ]]; then
  echo "Error: Only positive integers are allowed"
  exit 1
fi

count=0
while [[ number -gt 1 ]]; do
  if ((number % 2 == 0)); then
    number=$((number / 2))
  else
    number=$((number * 3 + 1))
  fi
  count=$((count + 1))
done

echo "${count}"
