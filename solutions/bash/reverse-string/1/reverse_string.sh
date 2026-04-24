#!/usr/bin/env bash

input_string=$1
reversed_string=""

for ((i = ${#input_string}; i >= 0; i--)); do
  reversed_string+=${input_string:i:1}
done
echo "$reversed_string"
