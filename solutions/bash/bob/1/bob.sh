#!/usr/bin/env bash

input="${1}"

has_letters=false
[[ "${input}" == *[[:alpha:]]* ]] && has_letters=true

is_yelling=false
if "${has_letters}" && [[ "${input}" != *[[:lower:]]* ]]; then
  is_yelling=true
fi

is_question=false
[[ "${input% }" == *\? ]] && is_question=true

is_silence=false
[[ "${input}" =~ ^[[:space:]]*$ ]] && is_silence=true

if ${is_silence}; then
  echo "Fine. Be that way!"
elif ${is_question} && ${is_yelling}; then
  echo "Calm down, I know what I'm doing!"
elif ${is_question}; then
  echo "Sure."
elif ${is_yelling}; then
  echo "Whoa, chill out!"
else
  echo "Whatever."
fi
