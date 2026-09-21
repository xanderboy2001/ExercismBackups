#!/usr/bin/env bash

NOUNS=(
  "house"
  "malt"
  "rat"
  "cat"
  "dog"
  "cow with the crumpled horn"
  "maiden all forlorn"
  "man all tattered and torn"
  "priest all shaven and shorn"
  "rooster that crowed in the morn"
  "farmer sowing his corn"
  "horse and the hound and the horn"
)

VERBS=(
  "Jack built"
  "lay in"
  "ate"
  "killed"
  "worried"
  "tossed"
  "milked"
  "kissed"
  "married"
  "woke"
  "kept"
  "belonged to"
)

if [[ $1 -gt $2 ]] \
  || [[ $1 -gt ${#NOUNS[@]} ]] || [[ $2 -gt ${#NOUNS[@]} ]] \
  || [[ $1 -le 0 ]] || [[ $2 -le 0 ]]; then
  echo "invalid parameters."
  exit 1
fi

first_verse=$(($1 - 1))
last_verse=$(($2 - 1))

result=()

for ((start = first_verse; start <= last_verse; start++)); do
  phrase="This is"
  for ((i = start; i >= 0; i--)); do
    phrase+=" the ${NOUNS[${i}]} that ${VERBS[${i}]}"
  done
  result+=("${phrase}.")
done

for phrase in "${result[@]}"; do
  echo "${phrase}"
done
