CREATE DATABASE library;
USE library;

CREATE TABLE Branch (
Branch_no INT PRIMARY KEY,
Manager_Id INT,
Branch_address VARCHAR(200),
Contact_no VARCHAR(15)
);

CREATE TABLE Employee (
Emp_Id INT PRIMARY KEY,
Emp_name VARCHAR(100),
Position VARCHAR(50),
Salary INT,
Branch_no INT,
FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

CREATE TABLE Books (
ISBN INT PRIMARY KEY,
Book_title VARCHAR(200),
Category VARCHAR(100),
Rental_Price DECIMAL(10,2),
Status VARCHAR(5),
Author VARCHAR(100),
Publisher VARCHAR(100)
);

CREATE TABLE Customer (
Customer_Id INT PRIMARY KEY,
Customer_name VARCHAR(100),
Customer_address VARCHAR(200),
Reg_date DATE
);

CREATE TABLE IssueStatus (
Issue_Id INT PRIMARY KEY,
Issued_cust INT,
Issued_book_name VARCHAR(200),
Issue_date DATE,
Isbn_book INT,
FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);


CREATE TABLE ReturnStatus (
Return_Id INT PRIMARY KEY,
Return_cust INT,
Return_book_name VARCHAR(200),
Return_date DATE,
Isbn_book2 INT,
FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

SHOW TABLES;

SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status='yes';

SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

SELECT IssueStatus.Issued_book_name, Customer.Customer_name
FROM IssueStatus
JOIN Customer
ON IssueStatus.Issued_cust = Customer.Customer_Id;

SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;
SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;
SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN
(SELECT Issued_cust FROM IssueStatus);


SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;

SELECT DISTINCT Customer.Customer_name
FROM IssueStatus
JOIN Customer
ON IssueStatus.Issued_cust = Customer.Customer_Id
WHERE MONTH(Issue_date)=6 AND YEAR(Issue_date)=2023;

SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';

SELECT Branch_no, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

SELECT Emp_name, Branch_address
FROM Employee
JOIN Branch
ON Employee.Emp_Id = Branch.Manager_Id;

SELECT Emp_name, Branch_address
FROM Employee
JOIN Branch
ON Employee.Emp_Id = Branch.Manager_Id;

SELECT DISTINCT Customer.Customer_name
FROM IssueStatus
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
WHERE Books.Rental_Price > 25;
