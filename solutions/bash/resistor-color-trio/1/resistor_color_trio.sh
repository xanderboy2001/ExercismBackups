#!/usr/bin/env bash

declare -A COLORS
COLORS["black"]=0
COLORS["brown"]=1
COLORS["red"]=2
COLORS["orange"]=3
COLORS["yellow"]=4
COLORS["green"]=5
COLORS["blue"]=6
COLORS["violet"]=7
COLORS["grey"]=8
COLORS["white"]=9

SUFFIXES=(
  "ohms"
  "kiloohms"
  "megaohms"
  "gigaohms"
)

digit1=${COLORS[${1}]}
digit2=${COLORS[${2}]}
num_zeros=${COLORS[${3}]}

if [[ -z "${digit1}" ]] || [[ -z "${digit2}" ]] || [[ -z "${num_zeros}" ]]; then
  echo "invalid color"
  exit 1
fi

digit1=$((digit1 * 10))
ohms=$((digit1 + digit2))

for ((i = 0; i < num_zeros; i++)); do
  ohms="${ohms}0"
done

suffix_idx=0
while ((ohms >= 1000)); do
  if ((ohms % 1000 == 0)); then
    suffix_idx=$((suffix_idx + 1))
    ohms=$((ohms / 1000))
  fi
done

echo "${ohms} ${SUFFIXES[${suffix_idx}]}"
