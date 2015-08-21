#!/bin/bash
ssh user@hostname "cd /pcaps; mkdir $1"
scp $2 user@hostname:/pcaps/$1/
if [ "$?" = "0" ]; then
	echo "Backed up file $2 to hostname:/pcaps/"$1"/"
	rm  $2
	exit 0
else
	echo "Cannot backup pcap file. SSH error"
	exit 1
fi