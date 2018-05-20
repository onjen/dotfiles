#!/usr/bin/env python

import pynotify
import pyinotify
from os.path import expanduser, join
from mailbox import MaildirMessage

maildir = expanduser('~/Mail')
pynotify.init('offlineimap_notify')

with open(expanduser('~/.mutt/mailboxes')) as f:
    mailboxes = f.read()

boxes = []
for m in mailboxes.strip('\n').split(" "):
    if not m == 'mailboxes':
        boxes.append(m.replace('"', '').replace('+', ''))


def new_mail(event):
    with open(event.pathname, 'r') as f:
        mail = MaildirMessage(message=f)
        efrom = 'From: ' + mail['From']
        esubject = 'Subject: ' + mail['Subject']
        n = pynotify.Notification("New mail in " + '/'.join(
            event.path.split('/')[-3:-1]), efrom + "\n" + esubject)
        n.set_timeout(8000)
        n.show()


watch_manager = pyinotify.WatchManager()
file_notifier = pyinotify.Notifier(watch_manager, new_mail)

for box in boxes:
    watch_manager.add_watch(join(maildir, box, 'new'),
                            pyinotify.IN_CREATE | pyinotify.IN_MOVED_TO)

print('running new mail notifier in a loop...')
file_notifier.loop()
