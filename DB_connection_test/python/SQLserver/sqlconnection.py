import pyodbc
import sys

# Obtain connection string information from the portal
server = sys.argv[1]
port = sys.argv[2]
username = sys.argv[3]
password = sys.argv[4]
database = sys.argv[5]
driver= '{ODBC Driver 17 for SQL Server}'

try:
   conn = pyodbc.connect('DRIVER='+driver+';SERVER='+server+';PORT='+port+';DATABASE='+database+';UID='+username+';PWD='+ password)
   print("Successfully connected to the SQL server")
except pyodbc.Error as err:
   print(err)
else:
   csr = conn.cursor()

# list all databases in the SQL server
csr.execute("SELECT name FROM sys.databases")
for row in csr.fetchall():
        print(row)

# Cleanup
csr.close()
conn.close()
