#/usr/bin
USERID=$(id -u)
if [ $USERID -ne 0 ];
then 
    echo "Please be a super user"
    exit 1
else 
    echo "Super user"
fi     

dnf install mysql -y

if [ $? -ne 0 ];
then 
    echo "mysql instllation...FAILURE"
else    
    echo "mysql instllation...SUCCESS"
fi

dnf install git -y 

if [ $? -ne 0 ];
then 
    echo "Git instllation...FAILURE"
else    
    echo "Git instllation...SUCCESS"
fi