#!/usr/bin/env bash

declare -A AMINO_ACIDS
AMINO_ACIDS["AUG"]="Methionine"
AMINO_ACIDS["UUU"]="Phenylalanine"
AMINO_ACIDS["UUC"]="Phenylalanine"
AMINO_ACIDS["UUA"]="Leucine"
AMINO_ACIDS["UUG"]="Leucine"
AMINO_ACIDS["UCU"]="Serine"
AMINO_ACIDS["UCC"]="Serine"
AMINO_ACIDS["UCA"]="Serine"
AMINO_ACIDS["UCG"]="Serine"
AMINO_ACIDS["UAU"]="Tyrosine"
AMINO_ACIDS["UAC"]="Tyrosine"
AMINO_ACIDS["UGU"]="Cysteine"
AMINO_ACIDS["UGC"]="Cysteine"
AMINO_ACIDS["UGG"]="Tryptophan"
AMINO_ACIDS["UAA"]="STOP"
AMINO_ACIDS["UAG"]="STOP"
AMINO_ACIDS["UGA"]="STOP"

string=$1

protein=()
for ((i = 0; i < ${#string}; i += 3)); do
  codon="${string:i:3}"
  amino_acid="${AMINO_ACIDS[${codon}]}"
  if [[ -z "${amino_acid}" ]]; then
    echo "Invalid codon"
    exit 1
  fi
  if [[ "${amino_acid}" == "STOP" ]]; then
    break
  fi
  protein+=("${amino_acid}")
done

echo "${protein[@]}"
