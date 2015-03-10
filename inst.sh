#!/bin/bash

[ -f .instpaths ] || exit 2

# read each line and assign fields to variables
# (the last var "$junk" discards everything after the fourth field)
while read -r src dest mode userid groupid junk; do
  # strip out lines that are whitespace or comments
  echo $src | egrep -v '^[[:space:]]*(#)?$' || continue
  sudo install -v -C -D -m $mode -o $userid -g $groupid $src $dest
done < .instpaths

