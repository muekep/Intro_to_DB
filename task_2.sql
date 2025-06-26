import mysql.connector
from mysql.connector import Error

def create_tables():
    try:
        # Connect to the alx_book_store database
        alx_book_store = mysql.connector.connect(
          host = "lcoalhost",
          user = "username",
          password = "today",
          database = "alx_book_store"
        )
        cursor = alx_book_store.cursor()

        # Define table creation queries in proper order
        tables = {
            "Authors": """
                CREATE TABLE IF NOT EXISTS Authors (
                    author_id VARCHAR(50) PRIMARY KEY,
                    author_name VARCHAR(215)
                )
            """,
            "Books": """
                CREATE TABLE IF NOT EXISTS Books (
                    book_id VARCHAR(50) PRIMARY KEY,
                    title VARCHAR(130),
                    author_id VARCHAR(50),
                    price DOUBLE,
                    publication_date DATE,
                    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
                )
            """,
            "Customers": """
                CREATE TABLE IF NOT EXISTS Customers (
                    customer_id VARCHAR(20) PRIMARY KEY,
                    customer_name VARCHAR(215),
                    email VARCHAR(215),
                    address TEXT
                )
            """,
            "Orders": """
                CREATE TABLE IF NOT EXISTS Orders (
                    order_id INT PRIMARY KEY,
                    customer_id INT,
                    order_date DATE,
                    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
                )
            """,
            "Order_Details": """
                CREATE TABLE IF NOT EXISTS Order_Details (
                    orderdetailid VARCHAR(50) PRIMARY KEY,
                    order_id INT,
                    book_id VARCHAR(50),
                    quantity DOUBLE,
                    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
                    FOREIGN KEY (book_id) REFERENCES Books(book_id)
                )
            """
        }

        # Execute table creation queries
        for name, query in tables.items():
            cursor.execute(query)
            print(f"Table '{name}' created successfully!")

    except Error as e:
        print(f"An error occurred: {e}")
    finally:
        if alx_book_store.is_connected():
            cursor.close()
            alx_book_store.close()
