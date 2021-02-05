#!/usr/bin/expect

spawn chroot chroot 

send "passwd root\n"
expect "UNIX"
send "123\n"
expect "UNIX"
send "123\n"

send "adduser user\n"
expect "UNIX"
send "123456\n"
expect "UNIX"
send "123456\n"
expect "Name"
send "\n"
expect "Room"
send "\n"
expect "Work"
send "\n"
expect "Home"
send "\n"
expect "Other"
send "\n"
expect "Y"
send "Y\n"

send "adduser admin\n"
expect "UNIX"
send "123456\n"
expect "UNIX"
send "123456\n"
expect "Name"
send "\n"
expect "Room"
send "\n"
expect "Work"
send "\n"
expect "Home"
send "\n"
expect "Other"
send "\n"
expect "Y"
send "Y\n"


 
