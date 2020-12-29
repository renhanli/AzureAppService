#!/bin/bash
# Ask the user for login details
read -p 'MySQL server: ' server
read -p 'Username: ' user
read -sp 'Password: ' passwd
read -p 'Database: ' database

echo "Run connection test: "
php ./mysqlconnect.php $server $user $passwd $database
