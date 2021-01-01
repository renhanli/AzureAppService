#!/bin/bash

# install mysql package if needed
if [ `npm list | grep -c mysql` -eq 1 ]
 then
        echo "mysql package installed."
else
        echo "mysql package not installed, installing..."
        npm install mysql
        echo "====install mysql package done===="
fi

# Ask the user for login details
read -p 'MySQL server: ' server
read -p 'Port: ' port
read -p 'Username: ' user
read -sp 'Password: ' passwd
read -p 'Database: ' database

echo ">>>>>>>>>Run connection test "
node ./mysqltest.js $server $user $passwd $database $port
