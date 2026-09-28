#!/usr/bin/env bash

if [[ $# -ne 2 ]]; then
  echo "invalid args"
  exit 1
fi

x=$1
y=$2

if [[ ! "${x}" =~ ^(-{0,1})[0-9]+(.{0,1}[0-9]+){0,1}$ ]]; then
  echo "invalid args"
  exit 1
fi
if [[ ! "${y}" =~ ^(-{0,1})[0-9]+(.{0,1}[0-9]+){0,1}$ ]]; then
  echo "invalid args"
  exit 1
fi

scale=1
if [[ "${x}" == *"."* ]] && [[ "${y}" == *"."* ]]; then
  scale=100
  x="${x//\./}"
  y="${y//\./}"
elif [[ "${x}" == *"."* ]]; then
  scale=100
  x="${x//\./}"
  y=$((y * 10))
elif [[ "${y}" == *"."* ]]; then
  scale=100
  x=$((x * 10))
  y="${y//\./}"
fi

x="${x/#-/}"
y="${y/#-/}"
x="${x/#0/}"
y="${y/#0/}"

dist_to_center_sqrd=$(((x ** 2) + (y ** 2)))

if ((dist_to_center_sqrd <= ((1 ** 2) * scale))); then
  echo "10"
elif ((dist_to_center_sqrd <= ((5 ** 2) * scale))); then
  echo "5"
elif ((dist_to_center_sqrd <= ((10 ** 2) * scale))); then
  echo "1"
else
  echo "0"
fi
