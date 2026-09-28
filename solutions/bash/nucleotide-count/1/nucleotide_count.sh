#!/usr/bin/env bash

sequence=$1
sequence="${sequence^^}"

num_a=0
num_c=0
num_g=0
num_t=0

for ((i = 0; i < ${#sequence}; i++)); do
  nucleotide="${sequence:i:1}"
  case "${nucleotide}" in
    'A') num_a=$((++num_a)) ;;
    'C') num_c=$((++num_c)) ;;
    'G') num_g=$((++num_g)) ;;
    'T') num_t=$((++num_t)) ;;
    *)
      echo "Invalid nucleotide in strand"
      exit 1
      ;;
  esac
done

echo "A: ${num_a}"
echo "C: ${num_c}"
echo "G: ${num_g}"
echo "T: ${num_t}"
