# -Library-Management-System
# Library Management System (MySQL)

## Project Overview

This project is a **Library Management System database** created using **MySQL**.
It manages information about books, customers, employees, and library branches.
The system keeps track of book availability, book issuing, and returning status.

## Database Name

`library`

## Tables Created

The project contains the following tables:

1. **Branch**
2. **Employee**
3. **Books**
4. **Customer**
5. **IssueStatus**
6. **ReturnStatus**

## Table Description

### Branch

Stores details of library branches.

| Column         | Description           |
| -------------- | --------------------- |
| Branch_no      | Primary Key           |
| Manager_Id     | Manager of the branch |
| Branch_address | Address of the branch |
| Contact_no     | Contact number        |

### Employee

Stores information about employees.

| Column    | Description                    |
| --------- | ------------------------------ |
| Emp_Id    | Primary Key                    |
| Emp_name  | Employee name                  |
| Position  | Job position                   |
| Salary    | Employee salary                |
| Branch_no | Foreign Key referencing Branch |

### Books

Stores book details.

| Column       | Description             |
| ------------ | ----------------------- |
| ISBN         | Primary Key             |
| Book_title   | Title of the book       |
| Category     | Book category           |
| Rental_Price | Rental cost             |
| Status       | Availability (Yes / No) |
| Author       | Author name             |
| Publisher    | Publisher name          |

### Customer

Stores library customer information.

| Column           | Description       |
| ---------------- | ----------------- |
| Customer_Id      | Primary Key       |
| Customer_name    | Customer name     |
| Customer_address | Address           |
| Reg_date         | Registration date |

### IssueStatus

Tracks issued books.

| Column           | Description               |
| ---------------- | ------------------------- |
| Issue_Id         | Primary Key               |
| Issued_cust      | Customer ID (Foreign Key) |
| Issued_book_name | Name of issued book       |
| Issue_date       | Date of issue             |
| Isbn_book        | ISBN (Foreign Key)        |

### ReturnStatus

Tracks returned books.

| Column           | Description        |
| ---------------- | ------------------ |
| Return_Id        | Primary Key        |
| Return_cust      | Customer ID        |
| Return_book_name | Book name          |
| Return_date      | Return date        |
| Isbn_book2       | ISBN (Foreign Key) |

## SQL Queries Implemented

1. Retrieve available books with title, category and rental price.
2. List employee names with salaries in descending order.
3. Retrieve book titles with customers who issued them.
4. Display total number of books in each category.
5. Retrieve employees with salary above ₹50,000.
6. List customers registered before **2022-01-01** who haven't issued books.
7. Show branch numbers with total employees.
8. Display customers who issued books in **June 2023**.
9. Retrieve books containing the word **"history"** in the title.
10. Display branches having more than **5 employees**.
11. Retrieve employees who manage branches and their branch addresses.
12. Display customers who issued books with rental price greater than **₹25**.

## Screenshots

Screenshots of all query outputs are included in the repository.

## Technologies Used

* MySQL
* SQL Queries
* GitHub

## Author

**Siyan**

## Submission

The project includes:

* SQL database creation script
* SQL queries
* Output screenshots
