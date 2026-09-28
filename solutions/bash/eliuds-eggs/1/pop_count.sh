#!/usr/bin/env bash

decimal=$1

egg_count=0
while [[ decimal -gt 0 ]]; do
  remainder=$((decimal % 2))
  egg_count=$((egg_count + remainder))
  decimal=$((decimal / 2))
done

echo "${egg_count}"
