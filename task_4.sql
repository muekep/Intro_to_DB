import mysql.connector
from mysql.connector import Error


# Connect to the alx_book_store database
alx_book_store = mysql.connector.connect(
  host = "lcoalhost",
  user = "username",
  password = "today",
  database = "alx_book_store"
)
cursor = alx_book_store.cursor()
  
cursor.execute("""
  USE alx_book_store;
  SELECT * FROM 
    information_schema.columns
WHERE 
    table_schema = DATABASE() AND table_name = 'Books'
""")
