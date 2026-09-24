#!/usr/bin/env bash

declare -A DNA_to_RNA
DNA_to_RNA["G"]="C"
DNA_to_RNA["C"]="G"
DNA_to_RNA["T"]="A"
DNA_to_RNA["A"]="U"
readonly DNA_to_RNA

if [[ $# -ne 1 ]]; then
  echo "usage: $0 <strand>"
  exit 1
fi

RNA_strand=""
for ((i = 0; i < ${#1}; i++)); do
  DNA_char="${1:${i}:1}"
  RNA_char="${DNA_to_RNA[${DNA_char}]}"
  if [[ -z "${RNA_char}" ]]; then
    echo "Invalid nucleotide detected."
    exit 1
  fi
  RNA_strand+="${RNA_char}"
done

echo "${RNA_strand}"
