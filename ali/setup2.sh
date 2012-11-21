#!/usr/bin/expect 
spawn fdisk /dev/xvdb
expect "Command (m for help):"
send "n\r"
expect "Select (default p):"
send "p\r"
expect "Partition number (1-4, default 1):"
send "1\r"
expect -re  "First sector*"
send "\r"
expect -re "Last sector*"
send "\r"
expect "Command (m for help):"
send "w\r"
expect "Command (m for help):"
send "q\r"

