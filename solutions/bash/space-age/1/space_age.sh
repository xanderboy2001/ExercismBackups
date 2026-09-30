#!/usr/bin/env bash

planet=$1
seconds=$2

declare -A ORBITAL_PERIODS

# Scaled by 100,000,000 to remove decimals
ORBITAL_PERIODS["Mercury"]="24084670"
ORBITAL_PERIODS["Venus"]="61519726"
ORBITAL_PERIODS["Earth"]="100000000"
ORBITAL_PERIODS["Mars"]="188081580"
ORBITAL_PERIODS["Jupiter"]="1186261500"
ORBITAL_PERIODS["Saturn"]="2944749800"
ORBITAL_PERIODS["Uranus"]="8401684600"
ORBITAL_PERIODS["Neptune"]="16479132000"

period=${ORBITAL_PERIODS[${planet}]}

if [[ -z "${period}" ]]; then
  echo "${planet} is not a planet"
  exit 1
fi

numerator=$((seconds * 12500000))
denominator=$((39447 * period))
age=$(((numerator + (denominator / 2)) / (denominator)))

whole=$((age / 100))
fraction=$((age % 100))

printf '%d.%02d\n' "${whole}" "${fraction}"
