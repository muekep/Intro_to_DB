import mysql.connector
from mysql.connector import errorcode
def create_database():  
  try: 
    alx_book_store = mysql.connector.connect(
      host = "lcoalhost",
      user = "username",
      password = "today",
      database = "alx_book_store"
    )
    cursor = alx_book_store.cursor()
    cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
    print("Database 'alx_book_store' created successfully!")
  except mysql.connector.Error as err:
    print(f"Error: {err}")
finally:
  if alx_book_store.is_connected():
    cursor.close()
    alx_book_store.close()
  
