#! /bin/bash

server=192.168.1.112:/volume1/

function pre_process() {
    src=$1
    dest=$2

    test -f /mnt/sdb1/$dest/rsync.lock && exit 1
    touch /mnt/sdb1/$dest/rsync.lock
    mount $server:/mnt/sdb1/download/$src /mnt/download
}

function post_process() {
    src=$1
    dest=$2
    
    umount /mnt/download
    rm /mnt/sdb1/$dest/rsync.lock 
}
