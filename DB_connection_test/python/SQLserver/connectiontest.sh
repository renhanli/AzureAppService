#!/bin/bash

if [ -f ".venv/bin/activate" ]; then
    echo ">>>>>.venv already created, Activate .venv"
    source .venv/bin/activate
    if [ `pip list | grep -c pyodbc` -eq 1 ]
      then
          echo "pyodbc package installed."
      else
        echo "pyodbc package not installed, install g++ and pyodbc..."
        apt-get update
        apt-get install g++ --assume-yes
        pip install pyodbc
        echo "====install pyodbc package done===="
    fi
else
    echo ">>>>>No .venv exist, initial .venv"
    python3 -m venv .venv
    echo ">>>>>Activate .venv"
    source .venv/bin/activate
    echo ">>>>>Install g++ and pyodbc..."
    apt-get update
    apt-get install g++ --assume-yes
    pip install pyodbc
    echo "====install pyodbc package done===="
fi

# Ask the user for login details
read -p 'SQL server url: ' server
read -p 'Port: ' port
read -p 'Username: ' user
read -sp 'Password: ' passwd
read -p 'Database: ' database

echo ">>>>>Run Mysql connection test"
python sqlconnection.py $server $port $user $passwd $database
