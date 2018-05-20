#!/bin/bash
# sync offlineimap if you have connection to the internet
# and you can ping your imap server successfully.
# just add this to your crontab
# */1 * * * * /home/user/src/dotfiles/offlineimap_sync.sh > /tmp/imap.log
# shamelessly stolen from
# https://hobo.house/2015/09/09/take-control-of-your-email-with-mutt-offlineimap-notmuch/

source /home/rothe/.profile
imapserver=$(cat ~/.offlineimaprc | grep remotehost | awk '{print $3}')
imapactive=$(ps -ef | grep '[o]fflineimap' | wc -l)
netactive=$(ping -c3 $imapserver >/dev/null 2>&1 && echo up || echo down)
mailsync="/usr/bin/offlineimap -o -u quiet"

# kill offlineimap if active, sometimes it hangs
case $imapactive in
'1')
 killall offlineimap && sleep 5
;;
esac

# Check that you can access the SMTP server
case $netactive in
'up')
 $mailsync
;;
'down')
 :
;;
esac
