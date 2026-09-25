#!/usr/bin/env bash

NUM_STRINGS=(
  "no"
  "one"
  "two"
  "three"
  "four"
  "five"
  "six"
  "seven"
  "eight"
  "nine"
  "ten"
)

print_verse() {
  start_verse="${1}"
  next_num=$((start_verse - 1))
  num_bottles="${NUM_STRINGS[${start_verse}]}"
  num_bottles="${num_bottles^}"
  next_num_bottles="${NUM_STRINGS[${next_num}]}"

  if [[ ${start_verse} -eq 1 ]]; then
    bottle_str="bottle"
  else
    bottle_str="bottles"
  fi

  if [[ ${next_num} -eq 1 ]]; then
    next_bottle_str="bottle"
  else
    next_bottle_str="bottles"
  fi

  echo "${num_bottles} green ${bottle_str} hanging on the wall,"
  echo "${num_bottles} green ${bottle_str} hanging on the wall,"
  echo "And if one green bottle should accidentally fall,"
  echo "There'll be ${next_num_bottles} green ${next_bottle_str} hanging on the wall."
}

if [[ $# -ne 2 ]]; then
  echo "2 arguments expected"
  exit 1
fi

start_verse="${1}"
num_verses="${2}"

end_verse=$((start_verse - num_verses))

if [[ ${end_verse} -lt 0 ]]; then
  echo "cannot generate more verses than bottles"
  exit 1
fi

for ((i = start_verse; i > end_verse; i--)); do
  print_verse "${i}"
  echo
done
