import mysql.connector
alx_book_store = mysql.connector.connect(
  host = "lcoalhost",
  user = "username",
  password = "today",
  database = "alx_book_store"
)
cursor = alx_book_store.cursor()
cursor.execute(
