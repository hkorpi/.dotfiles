#!/usr/bin/env bash

if [ $# -lt 2 ]; then
  echo "Invalid arguments. Usage: grep-in-path.sh path content"
  exit 1
fi

find $1 -type f -exec grep -H $2 {} \;
