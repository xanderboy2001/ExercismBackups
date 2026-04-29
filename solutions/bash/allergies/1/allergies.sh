#!/usr/bin/env bash

score=$1
action=$2
item=$3

allergens=(eggs peanuts shellfish strawberries tomatoes chocolate pollen cats)

allergic_to=()

for ((i = 0; i < ${#allergens[@]}; i++)); do
  if ((score & (1 << i))); then
    allergic_to+=("${allergens[i]}")
  fi
done

if [[ $action == 'allergic_to' ]]; then
  allergy_in_list='false'
  for allergy in "${allergic_to[@]}"; do
    if [[ "$item" == "$allergy" ]]; then
      allergy_in_list='true'
      break
    fi
  done
  echo "$allergy_in_list"
elif [[ $action == 'list' ]]; then
  echo "${allergic_to[*]}"
fi
