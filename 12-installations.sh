#!/usr/bin
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"




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
        echo -e "$2...$R FAILURE $N"
    else 
        echo -e "$2 ... $G SUCCESS $N"    

    fi
}


dnf instll mysql -y &>>$LOGFILE
VALIDATE $? "mysql installation"

dnf install git -y &>>$LOGFILE
VALIDATE $? "Git installation"

dnf install wrong -y &>>$LOGFILE
VALIDATE $? "Wrong installation"