#! /bin/bash

vm_name=$1
vmid=$(vim-cmd vmsvc/getallvms | grep $vm_name | awk '{print $1}')
vim-cmd vmsvc/power.getstate $vmid
