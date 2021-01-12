#!/bin/bash

if [ -f ".venv/bin/activate" ]; then
    echo ">>>>>.venv already created, Activate .venv"
    source .venv/bin/activate
    if [ `pip list | grep -c mysql-connector-python` -eq 1 ]
      then
          echo "mysql package installed."
      else
        echo "mysql package not installed, insatll mysql-connector-python..."
        pip install mysql-connector-python
        echo "====install mysql package done===="
    fi
else
    echo ">>>>>No .venv exist, initial .venv"
    python3 -m venv .venv

    echo ">>>>>Activate .venv"
    source .venv/bin/activate

    echo ">>>>>Install mysql-connector-python"
    pip install mysql-connector-python
    echo "====install mysql package done===="
fi

# Ask the user for login details
read -p 'MySQL server: ' server
read -p 'Username: ' user
read -sp 'Password: ' passwd
read -p 'Database: ' database

echo ">>>>>Run Mysql connection test"
python mysqlconnection.py $server $user $passwd $database
