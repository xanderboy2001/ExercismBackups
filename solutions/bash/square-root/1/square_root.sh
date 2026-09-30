#!/usr/bin/env bash

number=$1

for ((i = 1; i <= number; i++)); do
  if ((i ** 2 == number)); then
    echo "${i}"
    exit 0
  fi
done

exit 1
