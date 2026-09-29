#!/usr/bin/env bash

if [[ $# -ne 2 ]]; then
  exit 1
fi

string=$1
key=$2

if [[ ! "${key}" =~ ^[0-9]{1,2}$ ]]; then
  exit 1
fi
if [[ ${key} -lt 0 ]] || [[ ${key} -gt 26 ]]; then
  exit 1
fi

ALPHABET_LOWER="abcdefghijklmnopqrstuvwxyz"
ALPHABET_UPPER="ABCDEFGHIJKLMNOPQRSTUVWXYZ"

get_lower_char_idx() {
  char=$1
  for ((i = 0; i < ${#ALPHABET_LOWER}; i++)); do
    if [[ "${ALPHABET_LOWER:i:1}" == "${char}" ]]; then
      echo "${i}"
      return
    fi
  done
}
get_upper_char_idx() {
  char=$1
  for ((i = 0; i < ${#ALPHABET_UPPER}; i++)); do
    if [[ "${ALPHABET_UPPER:i:1}" == "${char}" ]]; then
      echo "${i}"
      return
    fi
  done
}

new_string=""
for ((i = 0; i < ${#string}; i++)); do
  char="${string:i:1}"
  if [[ ${char} =~ ^[A-Z]$ ]]; then
    char_idx=$(get_upper_char_idx "${char}")
  elif [[ "${char}" =~ ^[a-z]$ ]]; then
    char_idx=$(get_lower_char_idx "${char}")
  else
    new_string+="${char}"
    continue
  fi
  new_char_idx=$((char_idx + key))
  new_char_idx=$((new_char_idx % 26))
  if [[ ${char} =~ ^[A-Z]$ ]]; then
    new_char="${ALPHABET_UPPER:${new_char_idx}:1}"
  elif [[ "${char}" =~ ^[a-z]$ ]]; then
    new_char="${ALPHABET_LOWER:${new_char_idx}:1}"
  fi
  if [[ -z "${new_char}" ]]; then
    new_char="${char}"
  fi
  new_string+="${new_char}"
done

echo "${new_string}"
