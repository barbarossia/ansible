#! /bin/bash

test -f /mnt/sdb1/photo/rsync.lock && exit 1
touch /mnt/sdb1/photo/rsync.lock
mount 192.168.1.112:/volume1/photo /mnt/download
today="$(date +%Y%m%d)"

mv /mnt/download/upload/ /mnt/download/$today
rsync --exclude=@eaDir -av --log-file=/mnt/sdb1/photo/$today_rsync.log --progress /mnt/download/$today/ /mnt/sdb1/photo/$today
mkdir /mnt/download/upload
umount /mnt/download
rm /mnt/sdb1/photo/rsync.lock 
