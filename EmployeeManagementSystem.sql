-- Create the database
CREATE DATABASE IF NOT EXISTS EmployeeManagementSystem;

-- Use the database
USE EmployeeManagementSystem;

-- Table to store location information
CREATE TABLE Locations (
    LocationID INT PRIMARY KEY AUTO_INCREMENT,
    Address VARCHAR(255) NOT NULL,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    Country VARCHAR(100) NOT NULL
);

-- Table to store department information
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100) UNIQUE NOT NULL,
    LocationID INT,
    FOREIGN KEY (LocationID) REFERENCES Locations(LocationID)
);

-- Table to store job titles
CREATE TABLE Jobs (
    JobID INT PRIMARY KEY AUTO_INCREMENT,
    JobTitle VARCHAR(100) UNIQUE NOT NULL,
    MinSalary DECIMAL(10, 2) NOT NULL,
    MaxSalary DECIMAL(10, 2) NOT NULL
);

-- Table to store employee information
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(20),
    HireDate DATE NOT NULL,
    TerminationDate DATE,
    JobID INT,
    DepartmentID INT,
    ManagerID INT,
    Salary DECIMAL(10, 2) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    PostalCode VARCHAR(20) NOT NULL,
    Country VARCHAR(100) NOT NULL,
    DateOfBirth DATE,
    EmergencyContactName VARCHAR(100),
    EmergencyContactPhone VARCHAR(20),
    FOREIGN KEY (JobID) REFERENCES Jobs(JobID),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);

-- Table to store employee benefits
CREATE TABLE EmployeeBenefits (
    EmployeeBenefitID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT NOT NULL,
    BenefitType VARCHAR(100) NOT NULL,
    EnrollmentDate DATE NOT NULL,
    CoverageAmount DECIMAL(10, 2),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Table to store employee performance reviews
CREATE TABLE PerformanceReviews (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT NOT NULL,
    ReviewDate DATE NOT NULL,
    ReviewerID INT NOT NULL,
    PerformanceScore INT NOT NULL,
    Comments TEXT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ReviewerID) REFERENCES Employees(EmployeeID)
);

-- Table to store training programs
CREATE TABLE TrainingPrograms (
    TrainingID INT PRIMARY KEY AUTO_INCREMENT,
    ProgramName VARCHAR(255) NOT NULL,
    Description TEXT,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL
);

-- Table to store employee training records
CREATE TABLE EmployeeTraining (
    EmployeeTrainingID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT NOT NULL,
    TrainingID INT NOT NULL,
    CompletionDate DATE,
    Result VARCHAR(50),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (TrainingID) REFERENCES TrainingPrograms(TrainingID)
);

-- Insert sample data into Locations
INSERT INTO Locations (Address, City, State, Country) VALUES
('123 Main St', 'New York', 'NY', 'USA'),
('456 Oak Ave', 'Los Angeles', 'CA', 'USA'),
('789 Pine Ln', 'Chicago', 'IL', 'USA');

-- Insert sample data into Departments
INSERT INTO Departments (DepartmentName, LocationID) VALUES
('Human Resources', 1),
('Engineering', 2),
('Sales', 2),
('Marketing', 3);

-- Insert sample data into Jobs
INSERT INTO Jobs (JobTitle, MinSalary, MaxSalary) VALUES
('Software Engineer', 80000.00, 150000.00),
('HR Manager', 70000.00, 120000.00),
('Sales Representative', 50000.00, 100000.00),
('Marketing Specialist', 60000.00, 110000.00);

-- Insert sample data into Employees
INSERT INTO Employees (FirstName, LastName, Email, PhoneNumber, HireDate, JobID, DepartmentID, ManagerID, Salary, Address, City, State, PostalCode, Country, DateOfBirth, EmergencyContactName, EmergencyContactPhone) VALUES
('John', 'Doe', 'john.doe@example.com', '555-1234', '2023-01-15', 1, 2, NULL, 100000.00, '123 Main St', 'New York', 'NY', '10001', 'USA', '1990-05-20', 'Jane Doe', '555-5678'),
('Jane', 'Smith', 'jane.smith@example.com', '555-2345', '2022-08-01', 2, 1, 1, 90000.00, '456 Oak Ave', 'Los Angeles', 'CA', '90001', 'USA', '1985-10-10', 'John Smith', '555-9012'),
('Peter', 'Jones', 'peter.jones@example.com', '555-3456', '2024-03-01', 3, 3, 1, 70000.00, '789 Pine Ln', 'Chicago', 'IL', '60601', 'USA', '1992-02-15', 'Alice Jones', '555-3456'),
('Alice', 'Brown', 'alice.brown@example.com', '555-4567', '2023-09-01', 4, 4, 2, 80000.00, '321 Elm St', 'Houston', 'TX', '77001', 'USA', '1988-07-22', 'Bob Brown', '555-7890');

-- Insert sample data into EmployeeBenefits
INSERT INTO EmployeeBenefits (EmployeeID, BenefitType, EnrollmentDate, CoverageAmount) VALUES
(1, 'Health Insurance', '2023-01-15', 10000.00),
(1, 'Retirement Plan', '2023-01-15', 50000.00),
(2, 'Health Insurance', '2022-08-01', 12000.00),
(3, 'Dental Insurance', '2024-03-01', 5000.00);

-- Insert sample data into PerformanceReviews
INSERT INTO PerformanceReviews (EmployeeID, ReviewDate, ReviewerID, PerformanceScore, Comments) VALUES
(1, '2024-01-15', 2, 90, 'Excellent performance this year.'),
(2, '2024-02-01', 1, 85, 'Good performance, needs improvement in some areas.'),
(3, '2024-03-01', 1, 75, 'Meeting expectations.'),
(4, '2024-02-15', 2, 95, 'Outstanding performance!');

-- Insert sample data into TrainingPrograms
INSERT INTO TrainingPrograms (ProgramName, Description, StartDate, EndDate) VALUES
('New Employee Onboarding', 'Covers company policies and procedures.', '2024-01-01', '2024-01-05'),
('Software Development Basics', 'Introduces fundamental programming concepts.', '2024-02-01', '2024-02-15'),
('Sales Training', 'Teaches effective sales techniques.', '2024-03-01', '2024-03-05'),
('Marketing Fundamentals', 'Covers the basics of marketing strategy.', '2024-04-01', '2024-04-10');

-- Insert sample data into EmployeeTraining
INSERT INTO EmployeeTraining (EmployeeID, TrainingID, CompletionDate, Result) VALUES
(1, 1, '2024-01-05', 'Pass'),
(2, 1, '2024-01-05', 'Pass'),
(2, 2, '2024-02-15', 'Pass'),
(3, 3, '2024-03-05', 'Pass');

-- Stored Procedure to get employees by department
DELIMITER //
CREATE PROCEDURE GetEmployeesByDepartment(IN deptName VARCHAR(100))
BEGIN
    SELECT 
        e.EmployeeID, 
        e.FirstName, 
        e.LastName, 
        e.Email,
        d.DepartmentName
    FROM Employees e
    JOIN Departments d ON e.DepartmentID = d.DepartmentID
    WHERE d.DepartmentName = deptName;
END //
DELIMITER ;

-- Stored Procedure to update employee salary
DELIMITER //
CREATE PROCEDURE UpdateEmployeeSalary(IN empId INT, IN newSalary DECIMAL(10, 2))
BEGIN
    UPDATE Employees
    SET Salary = newSalary
    WHERE EmployeeID = empId;
END //
DELIMITER ;

-- View to get employee details with job and department
CREATE VIEW EmployeeDetailsView AS
SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    e.Email,
    j.JobTitle,
    d.DepartmentName,
    e.Salary
FROM Employees e
JOIN Jobs j ON e.JobID = j.JobID
JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Function to calculate the number of employees in a department
DELIMITER //
CREATE FUNCTION GetEmployeeCountByDepartment(deptName VARCHAR(100)) RETURNS INT
BEGIN
    DECLARE employeeCount INT;
    SELECT COUNT(*) INTO employeeCount
    FROM Employees e
    JOIN Departments d ON e.DepartmentID = d.DepartmentID
    WHERE d.DepartmentName = deptName;
    RETURN employeeCount;
END //
DELIMITER ;
