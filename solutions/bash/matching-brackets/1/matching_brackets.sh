#!/usr/bin/env bash

phrase=$1

declare -A close_to_open

close_to_open["}"]="{"
close_to_open["]"]="["
close_to_open[")"]="("

stack=""

for ((i = 0; i < ${#phrase}; i++)); do
  character="${phrase:i:1}"
  if [[ "${character}" =~ ^(\[|\{|\()$ ]]; then
    stack="${character}${stack}"
  elif [[ "${character}" =~ ^(\]|\}|\))$ ]]; then
    expected=${close_to_open["${character}"]}
    if [[ "${stack:0:1}" != "${expected}" ]]; then
      echo "false"
      exit
    fi
    stack="${stack:1}"
  fi
done

if [[ -z "${stack}" ]]; then
  echo "true"
else
  echo "false"
fi
