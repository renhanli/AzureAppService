import sys
import mysql.connector
from mysql.connector import errorcode

# Obtain connection string information from the portal
config = {
  'host': sys.argv[1],
  'user': sys.argv[2],
  'password': sys.argv[3],
  'database': sys.argv[4]
}

# Construct connection string
try:
   conn = mysql.connector.connect(**config)
   print("Connection established")
except mysql.connector.Error as err:
   print(err)
else:
  cursor = conn.cursor()

# list all databases in the MySQL server
cursor.execute("show databases")
print(cursor.fetchall())
print("Finished listing databases")

# Cleanup
conn.commit()
cursor.close()
conn.close()
print("Done.")
