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
  SELECT 
    COLUMN_NAME,
    COLUMN_TYPE,
    IS_NULLABLE,
    COLUMN_KEY,
    COLUMN_DEFAULT,
    EXTRA
  FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_SCHEMA = alx_book_store AND TABLE_NAME = 'Books'
""")
