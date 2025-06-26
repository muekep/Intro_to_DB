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
  INSERT INTO Customers (customer_id, customer_name, email, address)
  VALUES(1,"Cole Baidoo", "cbaidoo@sandtech.com", "123 Happiness Ave")
""")
