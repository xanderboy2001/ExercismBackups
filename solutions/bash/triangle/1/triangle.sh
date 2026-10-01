#!/usr/bin/env bash

triangle_type=$1
side1=$2
side2=$3
side3=$4

compare() {
  bc <<< "$1"
}

valid_triangle() {
  (($(compare "${side1} > 0"))) &&
    (($(compare "${side2} > 0"))) &&
    (($(compare "${side3} > 0"))) &&
    (($(compare "${side1} + ${side2} > ${side3}"))) &&
    (($(compare "${side1} + ${side3} > ${side2}"))) &&
    (($(compare "${side2} + ${side3} > ${side1}")))
}

if ! valid_triangle; then
  echo "false"
  exit 0
fi

case "${triangle_type}" in
  equilateral)
    if (($(compare "${side1} == ${side2} && ${side2} == ${side3}"))); then
      echo "true"
    else
      echo "false"
    fi
    ;;
  isosceles)
    if (($(compare \
      "${side1} == ${side2} || \
         ${side1} == ${side3} || \
         ${side2} == ${side3}"))); then
      echo "true"
    else
      echo "false"
    fi
    ;;
  scalene)
    if (($(compare \
      "${side1} != ${side2} && \
         ${side1} != ${side3} && \
         ${side2} != ${side3}"))); then
      echo "true"
    else
      echo "false"
    fi
    ;;
esac
