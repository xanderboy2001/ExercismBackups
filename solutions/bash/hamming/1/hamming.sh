#!/usr/bin/env bash

if [[ $# -ne 2 ]]; then
  echo "Usage: hamming.sh <string1> <string2>"
  exit 1
fi

string1="$1"
string2="$2"

if [[ ${#string1} -ne ${#string2} ]]; then
  echo "Error: strands must be of equal length."
  echo "Usage: hamming.sh <string1> <string2>"
  exit 1
fi

distance=0
for ((i = 0; i < ${#string1}; i++)); do
  char1=${string1:$i:1}
  char2=${string2:$i:1}

  if [[ "$char1" != "$char2" ]]; then
    distance=$((distance + 1))
  fi
done

echo "$distance"
