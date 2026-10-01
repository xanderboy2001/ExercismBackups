#!/usr/bin/env bash

ORDINALS=(
  "first"
  "second"
  "third"
  "fourth"
  "fifth"
  "sixth"
  "seventh"
  "eighth"
  "ninth"
  "tenth"
  "eleventh"
  "twelfth"
)

GIFTS=(
  "a Partridge in a Pear Tree"
  "two Turtle Doves"
  "three French Hens"
  "four Calling Birds"
  "five Gold Rings"
  "six Geese-a-Laying"
  "seven Swans-a-Swimming"
  "eight Maids-a-Milking"
  "nine Ladies Dancing"
  "ten Lords-a-Leaping"
  "eleven Pipers Piping"
  "twelve Drummers Drumming"
)

start=$1
end=$2

start=$((start - 1))
end=$((end - 1))

for ((i = start; i <= end; i++)); do
  printf "On the %s day of Christmas my true love gave to me: " "${ORDINALS[${i}]}"
  for ((j = i; j >= 0; j--)); do
    if [[ ${j} -eq 0 ]]; then
      if [[ ${i} -eq 0 ]]; then
        printf "%s." "${GIFTS[${j}]}"
      else
        printf "and %s." "${GIFTS[${j}]}"
      fi
    else
      printf "%s, " "${GIFTS[${j}]}"
    fi
  done
  printf "\n"
done
