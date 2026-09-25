#!/usr/bin/env bash

raw_input="${1}"

input_cleaned="${raw_input/-/ }"
input_cleaned="${input_cleaned/_/ }"
input_cleaned="${input_cleaned/\*/ }"
IFS=' ' read -ra word_array <<< "${input_cleaned}"

acronym=""
for word in "${word_array[@]}"; do
  letter_1="${word:0:1}"
  acronym+="${letter_1^^}"
done

echo "${acronym}"
