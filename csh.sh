#!/bin/bash
if [ "$1" = "" ]; then
	user="lian"
else
	user=$1
fi
#echo $user
csshx -l $user ali[1-3]
