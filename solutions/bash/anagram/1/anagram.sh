#!/usr/bin/env bash

word1="${1,,}"

IFS=' ' read -ra candidate_words <<< "${2}"
declare -a anagrams

for candidate_word in "${candidate_words[@]}"; do
  normalized_word="${candidate_word,,}"

  if [[ "${word1}" == "${normalized_word}" ]]; then
    continue
  fi

  if [[ "${#word1}" -ne "${#normalized_word}" ]]; then
    continue
  fi

  is_anagram=true
  test_word1="${word1}"
  for ((i = 0; i < ${#normalized_word}; i++)); do
    letter="${normalized_word:${i}:1}"
    if [[ "${test_word1}" != *"${letter}"* ]]; then
      is_anagram=false
    fi
    test_word1="${test_word1/${letter}/}"
  done

  if ${is_anagram}; then
    anagrams+=("${candidate_word}")
  fi
done

echo "${anagrams[@]}"
