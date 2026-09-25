#!/usr/bin/env bash

is_int() {
  local input="${1}"

  if [[ ! "${input}" =~ ^-?[[:digit:]]+$ ]]; then
    echo "invalid args"
    exit 1
  fi
}

normalize_minutes() {
  local total_minutes="${1}"
  local _minutes_in_day=$((60 * 24)) # 1440
  total_minutes=$((total_minutes % _minutes_in_day))

  if [[ ${total_minutes} -lt 0 ]]; then
    total_minutes=$((total_minutes + _minutes_in_day))
  fi

  echo "${total_minutes}"
}

format_minutes() {
  local total_minutes="${1}"
  local hours=$((total_minutes / 60))
  local minutes=$((total_minutes - (hours * 60)))
  if [[ ${hours} -ge 24 ]]; then
    hours=$((hours % 24))
  fi
  if [[ ${hours} -lt 10 ]]; then
    hours="0${hours}"
  fi
  if [[ ${minutes} -lt 10 ]]; then
    minutes="0${minutes}"
  fi
  echo "${hours}:${minutes}"
}

if [[ $# -eq 2 ]]; then
  hours="${1}"
  minutes="${2}"
  is_int "${hours}"
  is_int "${minutes}"
  total_minutes=$((hours * 60 + minutes))
  normalized_minutes=$(normalize_minutes "${total_minutes}")
  format_minutes "${normalized_minutes}"
elif [[ $# -eq 4 ]]; then
  hours="${1}"
  minutes="${2}"
  operator="${3}"
  delta="${4}"
  is_int "${hours}"
  is_int "${minutes}"
  is_int "${delta}"
  total_minutes=$((hours * 60 + minutes))
  if [[ "${operator}" == "+" ]]; then
    total_minutes=$((total_minutes + delta))
  elif [[ "${operator}" == "-" ]]; then
    total_minutes=$((total_minutes - delta))
  else
    echo "invalid arguments"
    exit 1
  fi
  normalized_minutes=$(normalize_minutes "${total_minutes}")
  format_minutes "${normalized_minutes}"
elif [[ $# -eq 5 ]]; then
  hours_1="${1}"
  minutes_1="${2}"
  operator="${3}"
  hours_2="${4}"
  minutes_2="${5}"
  is_int "${hours_1}"
  is_int "${minutes_1}"
  is_int "${hours_2}"
  is_int "${minutes_2}"
  if [[ "${operator}" != "=" ]]; then
    echo "invalid arguments"
    exit 1
  fi
  total_minutes_1=$((hours_1 * 60 + minutes_1))
  total_minutes_2=$((hours_2 * 60 + minutes_2))
  normalized_minutes_1=$(normalize_minutes "${total_minutes_1}")
  normalized_minutes_2=$(normalize_minutes "${total_minutes_2}")
  if [[ "${normalized_minutes_1}" == "${normalized_minutes_2}" ]]; then
    echo "true"
  else
    echo "false"
  fi
else
  echo "invalid arguments"
  exit 1
fi
