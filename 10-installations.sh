#/usr/bin
USERID=$(id -u)
if [ $USERID -ne 0 ];
then 
    echo "Please be a super user"
    exit 1
else 
    echo "Super user"
fi     

dnf installl mysql -y