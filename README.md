# Library Management System

## Overview
This is a Java-based Library Management System built using standard Java, Servlets, and JSPs. The project follows the MVC architecture and allows administrators and users to manage books, transactions, and users efficiently.

---

## Project Structure

src/
├─ main/
│ ├─ java/
│ │ └─ com/mahesh/
│ │ ├─ controller/ # Handles HTTP requests
│ │ │ ├─ AdminController.java
│ │ │ └─ UserController.java
│ │ ├─ model/ # Java models representing database tables
│ │ │ ├─ BooksModel.java
│ │ │ ├─ TransactionsModel.java
│ │ │ └─ userModel.java
│ │ └─ service/ # Business logic
│ │ └─ LibraryService.java
│ ├─ resources/ # Application resources
│ └─ webapp/
│ └─ WEB-INF/
│ ├─ adminViews/ # JSP views for admin
│ ├─ studentViews/ # JSP views for students/users
│ ├─ ds-servlet.xml # Spring or servlet configuration
│ └─ web.xml # Web deployment descriptor
└─ Libraries/ # External libraries and dependencies




---

## Features
- Admin can add, update, and delete books.
- Users can view and borrow books.
- Transaction history is maintained for all book borrowings and returns.
- Role-based access control for Admin and Users.

---

## Prerequisites
- JDK 8 or higher
- Apache Tomcat 9.x or compatible server
- MySQL or any relational database
- IDE such as Eclipse, IntelliJ IDEA, or VSCode

---

