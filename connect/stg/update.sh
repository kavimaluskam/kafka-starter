#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "No parameters provided, exiting..."
  exit 1
fi
if [ -z "$2" ]; then
  echo "Key provided, but no value, breaking"
  exit 1
fi
if [ -z "$3" ] && [ -z "$setPropertyFile" ]; then
  echo "No file provided or setPropertyFile is not set, exiting..."
  exit 1
fi

if [ "$setPropertyFile" ] && [ "$3" ]; then
    echo "setPropertyFile variable is set AND filename in comamnd! Use only or the other. Exiting..."
    exit 1
else
  if [ "$3" ] && [ ! -f "$3" ]; then
    echo "File in command NOT FOUND!"
    exit 1
  elif [ "$setPropertyFile" ] && [ ! -f "$setPropertyFile" ]; then
    echo "File in setPropertyFile variable NOT FOUND!"
    exit 1
  fi
fi

if [ "$setPropertyFile" ]; then
  file=$setPropertyFile
else
  file=$3
fi

awk -v pat="^$1=" -v value="$1=$2" '{ if ($0 ~ pat) print value; else print $0; }' "$file" > "$file".tmp
mv "$file".tmp "$file"