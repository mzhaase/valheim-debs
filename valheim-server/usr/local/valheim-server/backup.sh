#!/bin/bash
/usr/bin/tar -czf /usr/local/valheim-server/backup/$(/bin/date +"\%y-\%m-\%d-\%H:\%M")-config.tgz /home/valheim/.config
/usr/bin/find /usr/local/valheim-server/backup/* -mtime +7 -exec rm {} \;