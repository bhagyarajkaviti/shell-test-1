#!/bin/bash
function sign_in()
{
	while [ 1 ] 
	do 
		echo "sign in"
		read -p "enter user name: " username
		read -p "enter password: " password
		read -p "$firstname, $lastname, $user, $pass" < $data_file
		if [[ $username == $user && $password == $pass ]]; then
		return 0;
		else
			echo "user not existed please signup"
			sign_up
		fi
	done
	# TODO For user sign-in
	# 1. Read all user credentials and verify
	# 2. Time-out for entering password
	# 3. Do appropriate activities to log files
}
function sign_up()
{ 
while [ 1 ]
do
echo "signup"
read -p "enter first name: " firstname
read -p "enter last name: " lastname
read -p "please enter your username: " user
read -p "please enter your password: " pass
if [[ ${#user} -ge 5 && "$user" == *[A-Z]* && "$user" == *[a-z]* && "$user" == *[0-9]* ]] && 
[[ ${#pass} -ge 8 && "$pass" == *[A-Z]* && "$pass" == *[a-z]* && "$pass" == *[0-9]* && "$pass" == *[?!@$\%^\&*-]* ]]; then
	echo "$firstname, $lastname, $user, $pass" >> $data_file 
    echo "user name criteria fulfilled" 
break
    exit 1
else
    echo "username criteria: The user-name should contain only alphanumeric symbols"
    echo "password criteria:  contain any symbol in it. Accept at-least 8 characters with at-least a number and symbol"
    exit 1
fi
done
	# TODO For user sign-up
	# 1. Read all user credentials and verify
	# 2. Time-out for entering password
	# 3. Set minimum length and permitted characters for username and password, prompt error incase not matching
	# 4. Check for same user name already exists.
	# 5. Do appropriate activities to log files
}
# TODO Your main scropt starts here 
# 1. Creating a .TestData directory if it doesn't exist
# 2. Creating a .user_credentials.csv file if it doesn't exist

# Just loop till user exits

data_file=".TestData/.user_credentials.csv"
mkdir -p "${data_file%/*}" && touch "$data_file"
while [ 1 ]
do
cat << EOF 
    My Command Line Test
    
	Please choose the below options
	1. Sign In
	2. Sign Up
	3. Exit
EOF
read option
if [[ $option == 3 ]]
then
    echo "time to exit"
    exit 99
elif [[ $option == 2 ]]
then
          sign_up
	exit 1
elif [[ $option == 1 ]]
then
	sign_in
else
   echo "entered option is: $option"
fi
done