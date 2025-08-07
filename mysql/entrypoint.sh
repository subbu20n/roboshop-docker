#!/bin/bash 

if [-f /tmp/mysql_root_password.txt]; then 
   PASSWORD=$(cat /tmp/mysql_root_password.txt) 
   echo "Accessed root password" 
else 
   echo "Password file not found" 
fi 
# making it as available env 
export mysql_root_password=$PASSWORD 

rm -rf /tmp/mysql_root_password.txt 

exec /entrypoint.sh mysqld 