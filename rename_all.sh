#!/bin/bash

if [[ $# != 1 ]] ; then
  >&2 echo "Usage: $0 MICROSERVICE_NAME"
  exit 1
fi

MICROSERVICE_NAME="$1"

find . -type d -path '*/.git' -prune -o \
  -type d -path "*/bin" -prune -o \
  -type d -path "*/obj" -prune -o \
  -not -name ".gitignore" \
  -not -name ".gitattributes" \
  -not -wholename "$0" \
  -not -wholename . \
  -print | sort -r | while read FILE_NAME
do
  PATTERN='s/___MICROSERVICE_NAME___/'"$MICROSERVICE_NAME"'/g'
  NEW_FILE_NAME=.tmp/`echo "$FILE_NAME" | sed -e "$PATTERN"`
  mkdir -p `dirname "$NEW_FILE_NAME"`
  mv "$FILE_NAME" "$NEW_FILE_NAME"
  if [[ -f "$NEW_FILE_NAME" ]] ; then
    sed -i "$PATTERN" "$NEW_FILE_NAME"
  fi
done

mv 
