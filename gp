#!/bin/bash
if [ $# -eq 0 ]
then
   echo "$0 pattern [dir]"
   exit 1
fi

if [ $# -eq 1 ]
then
   dir="."
else
	 dir=$2
fi

grep -R $1 $dir
