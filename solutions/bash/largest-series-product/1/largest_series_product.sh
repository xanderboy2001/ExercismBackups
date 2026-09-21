#!/usr/bin/env bash

# The following comments should help you get started:
# - Bash is flexible. You may use functions or write a "raw" script.
#
# - Complex code can be made easier to read by breaking it up
#   into functions, however this is sometimes overkill in bash.
#
# - You can find links about good style and other resources
#   for Bash in './README.md'. It came with this exercise.
#
#   Example:
#   # other functions here
#   # ...
#   # ...
#
#   main () {
#     # your main function code here
#   }
#
#   # call main with all of the positional arguments
#   main "$@"
#
# *** PLEASE REMOVE THESE COMMENTS BEFORE SUBMITTING YOUR SOLUTION ***

get_product() {
  local input=$1
  local term1="${input:0:1}"
  local term2="${input:1:1}"
  local term3="${input:2:1}"
  echo $((term1 * term2 * term3))
}

input=$1
span=$2

if [[ ${span} -gt ${#input} ]]; then
  echo "span must not exceed string length"
  exit 1
fi
if ! [[ ${input} =~ ^[0-9]+$ ]]; then
  echo "digits input must only contain digits"
  exit 1
fi
if [[ ${span} -lt 0 ]]; then
  echo "span must not be negative"
  exit 1
fi

groups=()

for ((i = 0; i < ${#input}; i++)); do
  slice="${input:${i}:${span}}"
  if [[ ${#slice} -eq ${span} ]]; then
    groups+=("${slice}")
  fi
done

max_product=0
for series in "${groups[@]}"; do
  product=1
  for ((i = 0; i < ${#series}; i++)); do
    digit=${series:${i}:1}
    product=$((product * digit))
  done
  if [[ ${product} -gt ${max_product} ]]; then
    max_product=${product}
  fi
done

echo "${max_product}"
