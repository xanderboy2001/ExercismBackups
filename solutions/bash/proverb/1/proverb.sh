#!/usr/bin/env bash

if [[ $# -eq 0 ]]; then
  exit 0
fi

for ((i = 1; i < $#; i++)); do
  next=$((i + 1))
  echo "For want of a ${!i} the ${!next} was lost."
done

echo "And all for the want of a ${1}."
