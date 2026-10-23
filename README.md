# E-commerce Database

## Project Overview

This project focuses on designing a relational database for an e-commerce platform using Microsoft SQL Server.

The database is designed to organize and manage customers, addresses, product categories, products, orders, shopping carts, payments, shipments, and product reviews.

The main goal of this project is to apply relational database design principles and practice SQL Server through a practical, real-world-inspired scenario.

## Project Objectives

* Design a relational database schema for an e-commerce platform.
* Define primary keys and foreign key relationships.
* Implement data integrity constraints.
* Model relationships between database entities.
* Apply appropriate SQL Server data types.
* Practice database normalization and relational modeling.

## Technologies Used

* Microsoft SQL Server
* SQL
* SQL Server Management Studio (SSMS)

## Database Entities

The database consists of 11 entities:

| #  | Entity     | Description                                                                        |
| -- | ---------- | ---------------------------------------------------------------------------------- |
| 1  | Customer   | Stores customer information.                                                       |
| 2  | Address    | Stores customer address information.                                               |
| 3  | Category   | Organizes products into categories and subcategories.                              |
| 4  | Product    | Stores product information.                                                        |
| 5  | Orders     | Stores customer order information.                                                 |
| 6  | Order_Item | Stores products included in each order, along with quantities and purchase prices. |
| 7  | Cart       | Represents a customer's shopping cart.                                             |
| 8  | Payment    | Stores payment information associated with orders.                                 |
| 9  | Shipping   | Stores shipment and delivery information.                                          |
| 10 | Cart_Item  | Stores products added to shopping carts.                                           |
| 11 | Review     | Stores customer reviews of products.                                               |

## Database Design Concepts

This project covers the following database concepts:

* Primary Keys (PK)
* Foreign Keys (FK)
* Composite Primary Keys
* One-to-One Relationships
* One-to-Many Relationships
* Many-to-Many Relationships
* UNIQUE Constraints
* NOT NULL Constraints
* CHECK Constraints
* DEFAULT Constraints
* Referential Integrity
* Self-Referencing Relationships

## SQL Implementation

The database schema is implemented using SQL Server DDL statements.

The SQL script defines the tables, columns, data types, primary keys, foreign keys, and constraints required to establish relationships and enforce data integrity.

The design also uses SQL Server features such as `IDENTITY` and `SYSDATETIME()` where appropriate.

## How to Run the Project

1. Install Microsoft SQL Server and SQL Server Management Studio (SSMS).
2. Open SQL Server Management Studio and connect to your SQL Server instance.
3. Create a new database for the project.
4. Open the `ecommerce_database.sql` script.
5. Select the project database.
6. Execute the script to create the tables and their constraints.
7. Review the database structure and relationships.

## Project File

* `ecommerce_database.sql` — Contains the SQL statements used to create the database tables and define their relationships and constraints.

## Future Improvements

Planned improvements include:

* Adding realistic sample data.
* Writing SQL queries using JOINs, GROUP BY, CTEs, and window functions.
* Testing the database relationships and constraints.
* Creating an Entity-Relationship Diagram (ERD).
* Exploring indexes and query performance optimization.
* Developing data extraction and transformation workflows using Python.

## Learning Outcomes

This project provides hands-on practice in relational database design, SQL Server, data modeling, and data integrity.

It represents an important step in developing practical SQL skills and building a foundation for further learning in Data Engineering.

## Author

Created as a personal learning project to strengthen database design and SQL development skills.
