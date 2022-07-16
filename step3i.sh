#!/bin/bash
echo "please enter your user name: "
read username

read -p "enter the password: " password
len="${#password}"
if test $len -ge 8 ; then
    echo "$password" | grep -q [0-9]
    if test $? -eq 0 ; then
           echo "$password" | grep -q [A-Z]
                if test $? -eq 0 ; then
                    echo "$password" | grep -q [a-z]   
                  if test $? -eq 0 ; then
                        echo "$password" | grep -q "[!@#$%^&*]" 
                            if test $? -eq 0 ; then
                                echo "Strong password"
                            else
                            echo "weak password include a special char"
                             fi        
                   else
                       echo "weak password include lower case char"
                   fi
               else
               echo "weak password include capital char" 
               fi
    else
       echo "please include the numbers in password it is weak password"   
    fi
else
    echo "password length should be greater than or equal 8 hence weak password"
fi

read -p "please re enter your password: " repassword
if [ $password == $repassword ] ; then
    echo "your registration sucessfull"
else
    echo "please re enter your password correctly"
fi        