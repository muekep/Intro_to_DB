CREATE DATABASE IF NOT EXISTS `alx_book_store`;
USE `alx_book_store`;

-- Table structure for table `Books` 

CREATE TABLE Books (
    book_id VARCHAR(50) PRIMARY KEY,
    title VARCHAR(130),
    author_id VARCHAR(50) REFERENCES Authors(author_id),
    price DOUBLE,
    publication_date DATE
);

-- Table structure for table `Authors` 

CREATE TABLE Authors (
    author_id VARCHAR(50) PRIMARY KEY,
    author_name VARCHAR(215)
);

-- Table structure for table `Customers` 

CREATE TABLE Customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(215),
    email VARCHAR(215),
    address TEXT
);

-- Table structure for table `Orders` 

CREATE TABLE Orders (
    order_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20) REFERENCES Customers(customer_id),
    order_date DATE
);

-- Table structure for table `Order_Details` 

CREATE TABLE Order_Details (
    orderdetailid VARCHAR(50) PRIMARY KEY,
    order_id VARCHAR(50) REFERENCES Orders(order_id),
    book_id VARCHAR(50) REFERENCES Books(book_id),
    quantity DOUBLE
);
