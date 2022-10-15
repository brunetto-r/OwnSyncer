#!/bin/bash
while true
do 
	owncloudcmd --user "$OC_USER" --password "$OC_PASS" --exclude /dev/null /mnt "https://$OC_SERVER/owncloud/remote.php/webdav/"
	sleep 30
done
