#!/usr/bin
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo "Green :$G then $N"



USERID=$(id -u)

if [ $USERID -ne 0 ];
then 
    echo "Please be a super user to install following packages"
    exit 1
else 
    echo "SUPER USER"
fi

VALIDATE()
{
    if [ $1 -ne 0 ];
    then 
        echo "$2...FAILURE"
    else 
        echo "$2 ... SUCCESS"    

    fi
}