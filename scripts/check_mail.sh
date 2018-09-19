#!/bin/sh
maildirs="$HOME/Mail/magazino/INBOX/new/"
ml="$(find "$maildirs" -type f | wc -l)"
if [ $ml > 0 ]; then
  echo "$ml"
else
  echo "0"
fi
