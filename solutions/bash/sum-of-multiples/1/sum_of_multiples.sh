#!/usr/bin/env bash

level=$1
shift

sum=0
for ((n = 1; n < level; n++)); do
  for factor in "$@"; do
    [[ ${factor} -eq 0 ]] && continue

    if ((n % factor == 0)); then
      sum=$((sum + n))
      break
    fi
  done
done

echo "${sum}"
