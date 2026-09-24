#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <word>"
fi
score=0
for ((i = 0; i < ${#1}; i++)); do
  char="${1:${i}:1}"
  char="${char^^}"
  case ${char} in
    "A" | "E" | "I" | "O" | "U" | "L" | "N" | "R" | "S" | "T")
      score=$((score + 1))
      ;;
    "D" | "G")
      score=$((score + 2))
      ;;
    "B" | "C" | "M" | "P")
      score=$((score + 3))
      ;;
    "F" | "H" | "V" | "W" | "Y")
      score=$((score + 4))
      ;;
    "K")
      score=$((score + 5))
      ;;
    "J" | "X")
      score=$((score + 8))
      ;;
    "Q" | "Z")
      score=$((score + 10))
      ;;
    *)
      echo "error"
      exit 1
      ;;
  esac
done

echo "${score}"
