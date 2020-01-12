#! /bin/bash
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")

source $SCRIPTPATH/base.sh

vm_name=$1

start_vm $vm_name