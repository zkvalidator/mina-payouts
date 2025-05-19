#!/bin/bash

# List directories of the form number1-number2, sort by number1
#directories=$(ls -d [0-9]*-[0-9]* | sort -t- -k1,1n)
directories=$(ls -d */ | grep -E '^[0-9]+-[0-9]+/?$' | tr -d '/' | sort -t- -k1,1n)

counter=0

for dir in $directories; do
  # Extract number1 and number2
  number1=$(echo $dir | cut -d- -f1)
  number2=$(echo $dir | cut -d- -f2)

  # New directory name
  new_dir="0-$counter-$number1-$number2"

  # Rename the directory
  echo "$dir" "$new_dir"

  # Increment counter
  counter=$((counter + 1))
done
