#!/usr/bin/env bash

usage() {
  echo "Usage: resistor_color.sh <command> [args]"
  echo ""
  echo "Commands:"
  echo "  code <color>    Output the numeric code for a given color"
  echo "  colors          List all available resitor colors in order"
}

exit_on_invalid() {
  local string=$1

  if [[ -z "${string}" ]]; then
    echo "invalid color"
    exit 1
  fi
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

get_color_value() {
  local color=$1
  for ((i = 0; i < ${#COLORS[@]}; i++)); do
    if [[ ${COLORS[${i}]} == "${color}" ]]; then
      echo "${i}"
    fi
  done
}

color1=${1,,}
color2=${2,,}

value1=$(get_color_value "${color1}")
exit_on_invalid "${value1}"
value2=$(get_color_value "${color2}")
exit_on_invalid "${value2}"

value="${value1}${value2}"

if [[ "${value:0:1}" == "0" ]]; then
  value="${value:1:1}"
fi

echo "${value}"
