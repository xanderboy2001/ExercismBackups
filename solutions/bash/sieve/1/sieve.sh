#!/usr/bin/env bash

number=$1

declare -A composite
output=()

for ((i = 2; i <= number; i++)); do
  [[ -n "${composite[${i}]}" ]] && continue

  output+=("${i}")

  for ((multiple = i * i; multiple <= number; multiple += i)); do
    composite[${multiple}]=1
  done
done

echo "${output[*]}"
