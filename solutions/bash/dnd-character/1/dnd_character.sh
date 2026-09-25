#!/usr/bin/env bash

if [[ $# -lt 1 ]]; then
  echo "invalid input"
  exit 1
fi

get_modifier() {
  score="${1}"
  ((score % 2 != 0)) && score=$((score - 1))
  echo $(((score / 2) - 5))
}

command="${1}"
if [[ "${command}" == "modifier" ]]; then
  get_modifier "${2}"
elif [[ "${command}" == "generate" ]]; then
  _class_list=(
    "strength"
    "dexterity"
    "constitution"
    "intelligence"
    "wisdom"
    "charisma"
  )
  for class in "${_class_list[@]}"; do
    sum=0
    minimum=6
    for ((i = 0; i < 4; i++)); do
      value="${RANDOM}"
      value=$(((value % 6) + 1))
      [[ ${value} -lt ${minimum} ]] && minimum=${value}
      sum=$((sum + value))
    done
    sum=$((sum - minimum))
    if [[ "${class}" == "constitution" ]]; then
      modifier=$(get_modifier "${sum}")
      hitpoints=$((10 + modifier))
    fi
    echo "${class} ${sum}"
  done
  echo "hitpoints ${hitpoints}"
else
  echo "invalid input"
  exit 1
fi
