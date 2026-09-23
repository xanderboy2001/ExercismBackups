#!/usr/bin/env bash

usage() {
  echo "Usage: resistor_color.sh <command> [args]"
  echo ""
  echo "Commands:"
  echo "  code <color>    Output the numeric code for a given color"
  echo "  colors          List all available resitor colors in order"
}

if [[ $# -lt 1 ]]; then
  usage
  exit 1
fi

COLORS=(
  "black"
  "brown"
  "red"
  "orange"
  "yellow"
  "green"
  "blue"
  "violet"
  "grey"
  "white"
)

get_code() {
  color=$1

}

if [[ $1 == "code" ]]; then
  if [[ $# -ne 2 ]]; then
    usage
    exit 1
  fi
  color=${2,,}
  for ((i = 0; i < ${#COLORS[@]}; i++)); do
    if [[ ${COLORS[${i}]} == ${color} ]]; then
      echo "${i}"
    fi
  done
elif [[ $1 == "colors" ]]; then
  for color in ${COLORS[@]}; do
    echo "${color}"
  done
else
  usage
  exit 1
fi
