#!/usr/bin/env bash

number=$1

factors=()
while [[ ${number} -gt 1 ]]; do
  for ((divisor = 2; divisor <= number; divisor++)); do
    if ((number % divisor == 0)) || [[ ${number} -eq ${divisor} ]]; then
      factors+=("${divisor}")
      number=$((number / divisor))
      break
    fi
  done
done

echo "${factors[@]}"
