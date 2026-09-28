#!/usr/bin/env bash

phrase=$1

phrase=${phrase,,}

for ((i = 0; i < ${#phrase}; i++)); do
  letter="${phrase:i:1}"
  if [[ "${letter}" == "-" ]] || [[ "${letter}" == " " ]]; then
    continue
  fi
  phrase_minus_letter="${phrase/${letter}/}"
  if [[ "${phrase_minus_letter}" == *"${letter}"* ]]; then
    echo "false"
    exit
  fi
done

echo "true"
