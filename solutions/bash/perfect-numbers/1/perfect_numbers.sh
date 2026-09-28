#!/usr/bin/env bash

number=$1

if [[ ${number} -le 0 ]]; then
  echo "Classification is only possible for positive integers."
  exit 1
fi

if [[ ${number} -eq 1 ]]; then
  echo "deficient"
  exit 0
fi

sum=1

for ((divisor = 2; (divisor ** 2) <= number; divisor++)); do
  if ((number % divisor == 0)); then
    quotient=$((number / divisor))

    if [[ ${divisor} -eq ${quotient} ]]; then
      sum=$((sum + divisor))
    else
      sum=$((sum + divisor + quotient))
    fi
  fi
done

if [[ ${number} -eq ${sum} ]]; then
  echo "perfect"
elif [[ ${number} -lt ${sum} ]]; then
  echo "abundant"
elif [[ ${number} -gt ${sum} ]]; then
  echo "deficient"
fi
