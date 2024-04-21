#/bin/bash 
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

for i in $@;
do 
    dnf list installed $i &>>$LOGFILE
    if [ $? -ne 0 ];
    then 
        dnf install $i -y &>>$LOGFILE
        VALIDATE $? "$i instllation"
    else 
        echo -e "$i installation already done .....$Y SKIPPING $N"
    fi     
done 