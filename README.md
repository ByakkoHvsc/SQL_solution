# Employee Management System Database

This repository contains the SQL code for creating and managing a database for an Employee Management System. The database is designed to store and manage information about employees, departments, jobs, and other related data.

## Database Structure

The database consists of the following tables:

* **Locations:** Stores address information for company locations.
* **Departments:** Stores department names and their locations.
* **Jobs:** Stores job titles, minimum salaries, and maximum salaries.
* **Employees:** Stores employee details, including personal information, job information, department, manager, and salary.
* **EmployeeBenefits:** Stores information about employee benefits, such as health insurance and retirement plans.
* **PerformanceReviews:** Stores employee performance review records.
* **TrainingPrograms:** Stores information about available training programs.
* **EmployeeTraining:** Stores records of employee participation in training programs.

## SQL Code Details

The SQL code includes the following:

* **Database Creation:** The script starts by creating the database if it doesn't exist:
    ```sql
    CREATE DATABASE IF NOT EXISTS EmployeeManagementSystem;
    USE EmployeeManagementSystem;
    ```
* **Table Creation:** The script defines the structure of each table using the `CREATE TABLE` statement.  Data types, constraints (such as `PRIMARY KEY`, `NOT NULL`, `UNIQUE`, and `FOREIGN KEY`), and relationships between tables are specified.
* **Sample Data Insertion:** The script includes `INSERT INTO` statements to populate the tables with sample data. This allows you to quickly set up the database with some initial data for testing and development.
* **Stored Procedures:**
    * `GetEmployeesByDepartment`: Retrieves a list of employees in a specified department.
    * `UpdateEmployeeSalary`: Updates the salary of a specified employee.
* **View:**
    * `EmployeeDetailsView`:  A view that combines data from the `Employees`, `Jobs`, and `Departments` tables to provide a consolidated view of employee information.
* **Function:**
    * `GetEmployeeCountByDepartment`:  A function that calculates the number of employees in a specified department.

## How to Use

1.  **Database Server:** Ensure you have a database server installed (e.g., MySQL, PostgreSQL).
2.  **Execute the SQL Script:** Use a database client (e.g., MySQL Workbench, pgAdmin) to connect to your database server and execute the SQL script. This will create the database, tables, and populate them with the sample data.

## Contributions

Contributions to this project are welcome.  You can contribute by:

* Improving the database schema.
* Adding more stored procedures, views, or functions.
* Providing additional sample data.
* Creating documentation.
