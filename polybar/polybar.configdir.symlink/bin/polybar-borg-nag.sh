#!/bin/bash
THRESHHOLD=100
if [[ ! -f /mnt/data/borgrepo ]]; then
	exit;
fi
LASTBACKUP=$(borg list --format="{start}" --last 1 /mnt/data/borgrepo | awk '{print $2}')
DAYSSINCE=$(datediff $LASTBACKUP $(date +%F))
if [[ $DAYSSINCE -ge $THRESHHOLD ]]; then
	echo "$DAYSSINCE days since last backup!"
fi
