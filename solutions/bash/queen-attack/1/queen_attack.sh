#!/usr/bin/env bash

if [[ $# -ne 4 ]]; then
  exit 1
fi

if [[ $1 != "-w" ]]; then
  exit 1
fi

if [[ $3 != "-b" ]]; then
  exit 1
fi

white_pos=$2
black_pos=$4

if [[ "${white_pos}" == "${black_pos}" ]]; then
  echo "same position"
  exit 1
fi

white_row="${white_pos%,*}"
white_column="${white_pos#*,}"
black_row="${black_pos%,*}"
black_column="${black_pos#*,}"

delta_row=$((white_row - black_row))
delta_column=$((white_column - black_column))
delta_row=${delta_row#-}
delta_column=${delta_column#-}

if [[ ${white_row} -lt 0 ]] || [[ ${black_row} -lt 0 ]]; then
  echo "row not positive"
  exit 1
fi
if [[ ${white_column} -lt 0 ]] || [[ ${black_column} -lt 0 ]]; then
  echo "column not positive"
  exit 1
fi

if [[ ${white_row} -gt 7 ]] || [[ ${black_row} -gt 7 ]]; then
  echo "row not on board"
  exit 1
fi
if [[ ${white_column} -gt 7 ]] || [[ ${black_column} -gt 7 ]]; then
  echo "column not on board"
  exit 1
fi

if [[ ${white_column} -eq ${black_column} ]]; then
  echo "true"
elif [[ ${white_row} -eq ${black_row} ]]; then
  echo "true"
elif [[ ${delta_row} -eq ${delta_column} ]]; then
  echo "true"
else
  echo "false"
fi
