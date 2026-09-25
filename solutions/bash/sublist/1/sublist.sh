#!/usr/bin/env bash

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <list1> <list2>"
  exit 1
fi

list1_raw=$1
list1_raw="${list1_raw#[}"
list1_raw="${list1_raw%]}"
list1_raw="${list1_raw//,/ }"
read -ra list1 <<< "${list1_raw}"

list2_raw=$2
list2_raw="${list2_raw#[}"
list2_raw="${list2_raw%]}"
list2_raw="${list2_raw//,/ }"
read -ra list2 <<< "${list2_raw}"

if [[ "${list1[*]}" == "${list2[*]}" ]]; then
  echo "equal"
  exit
fi

if [[ ${#list1[@]} -eq 0 ]]; then
  echo "sublist"
  exit
fi

for ((i = 0; i <= ${#list2[@]} - ${#list1[@]}; i++)); do
  match=true
  for ((j = 0; j < ${#list1[@]}; j++)); do
    if [[ "${list1[${j}]}" != "${list2[((i + j))]}" ]]; then
      match=false
      break
    fi
  done
  if ${match}; then
    echo "sublist"
    exit
  fi
done

for ((i = 0; i <= ${#list1[@]} - ${#list2[@]}; i++)); do
  match=true
  for ((j = 0; j < ${#list2[@]}; j++)); do
    if [[ "${list2[${j}]}" != "${list1[((i + j))]}" ]]; then
      match=false
      break
    fi
  done
  if ${match}; then
    echo "superlist"
    exit
  fi
done

echo "unequal"
