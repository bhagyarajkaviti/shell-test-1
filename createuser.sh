#!/bin/bash
userfile=userlist.txt
username=$(cat userlist.txt)
password=$username@123
for user in $username
do
	echo $user
done
