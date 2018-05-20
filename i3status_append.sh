#!/bin/sh
# shell script to prepend i3status with more stuff

eml(){
      maildirs="$HOME/Mail/magazino/INBOX/new/"
      ml="$(find "$maildirs" -type f | wc -l)"
      if [ $ml > 0 ]; then
        echo "$ml"
      else
        echo "0"
      fi
}

i3status | while :
do
	read line
    echo "Mails $(eml) | $line" || exit 1
done
