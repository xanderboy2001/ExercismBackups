#!/usr/bin/env bash

string=${1,,}

declare -A WORD_COUNT

word=""
for ((i = 0; i < ${#string}; i++)); do
  char="${string:i:1}"
  if [[ "${char}" =~ [[:alnum:]] ]]; then
    word+="${char}"
  elif [[ "${char}" == "'" ]]; then
    next_char=${string:i+1:1}
    if [[ -n "${word}" && "${next_char}" =~ [[:alnum:]] ]]; then
      word+="${char}"
    fi
  else
    if [[ -n "${word}" ]]; then
      ((WORD_COUNT[${word}]++))
      word=""
    fi
  fi
done
if [[ -n ${word} ]]; then
  ((WORD_COUNT["${word}"]++))
fi

for word in "${!WORD_COUNT[@]}"; do
  echo "${word}: ${WORD_COUNT[${word}]}"
done
