#!/usr/bin/env bash

input=$1

output=${input/#+1 /}
output=${output/#1 /}
output=${output//\)/}
output=${output//\(/}
output=${output//-/}
output=${output//\./}
output=${output// /}

if [[ ! "${output}" =~ ^[2-9][0-9]{2}[2-9][0-9]{6}$ ]]; then
  if [[ "${#output}" -eq 11 ]] && [[ "${output:0:1}" == "1" ]]; then
    output="${output:1}"
  else
    echo "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
    exit 1
  fi
fi

echo "${output}"
