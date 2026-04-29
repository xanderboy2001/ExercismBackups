#!/usr/bin/env bash

number=$1
num_digits=${#number}
sum=0

for ((i = 0; i < num_digits; i++)); do
  digit=${number:$i:1}
  raised_digit=$((digit ** num_digits))
  sum=$((sum + raised_digit))
done

if [[ "$sum" == "$number" ]]; then
  echo "true"
else
  echo "false"
fi
