#!/usr/bin/env bash

action=$1
input_num=$2

function get_square_of_sums() {
  local sum
  sum=0
  for ((i = 1; i <= input_num; i++)); do
    sum=$((sum + i))
  done
  echo $((sum ** 2))
}

function get_sum_of_squares() {
  local sum=0
  for ((i = 1; i <= input_num; i++)); do
    local sum_of_squares
    sum_of_squares=$((sum_of_squares + i ** 2))
  done
  echo "$sum_of_squares"
}

function get_difference() {

  local square_of_sums
  square_of_sums=$(get_square_of_sums "$input_num")
  local sum_of_squares
  sum_of_squares=$(get_sum_of_squares "$input_num")

  echo $((square_of_sums - sum_of_squares))
}

case "$action" in
  square_of_sum) get_square_of_sums ;;
  sum_of_squares) get_sum_of_squares ;;
  difference) get_difference ;;
esac
