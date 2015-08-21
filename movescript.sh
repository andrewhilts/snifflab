#!/bin/bash

# Set these vars to the SSH details of your pcap collecting machine
SSHUSERNAME=user
SSHHOSTNAME=hostname

ssh $SSHUSERNAME@$SSHHOSTNAME "cd /pcaps; mkdir $1"
scp $2 $SSHUSERNAME@$SSHHOSTNAME:/pcaps/$1/
if [ "$?" = "0" ]; then
	echo "Backed up file $2 to $SSHHOSTNAME:/pcaps/"$1"/"
	rm  $2
	exit 0
else
	echo "Cannot backup pcap file. SSH error"
	exit 1
fi
