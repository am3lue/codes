-- =============================================
-- DATABASE CREATION AND SELECTION
-- =============================================
-- Creates a new database named 'company'
CREATE DATABASE company;
-- Switches to use the 'company' database
USE company;

-- =============================================
-- TABLE CREATION SECTION
-- =============================================
-- Creating Department table with department ID and name
CREATE TABLE Dept (
    Did INT PRIMARY KEY,              -- Department ID (unique identifier)
    Dname VARCHAR(255) NOT NULL UNIQUE -- Department name (must be unique and not empty)
);

-- Creating Employee table with various employee details
CREATE TABLE Emp (
    eid INT PRIMARY KEY,                  -- Employee ID (unique identifier)
    ename VARCHAR(255) NOT NULL,          -- Employee name (cannot be empty)
    age INT CHECK (age >= 18 AND age <= 65), -- Age must be between 18 and 65
    city VARCHAR(255) DEFAULT 'Unknown',   -- City with default value 'Unknown'
    email VARCHAR(255) UNIQUE NOT NULL,    -- Email must be unique and not empty
    deptid INT,                           -- Department ID (foreign key)
    salary DECIMAL(10,2) CHECK (salary >= 0), -- Salary must be positive
    hire_date DATE DEFAULT CURRENT_DATE,   -- Hire date defaults to current date
    FOREIGN KEY (deptid) REFERENCES Dept(Did), -- Links employee to department
    CONSTRAINT salary_range CHECK (salary BETWEEN 30000 AND 150000) -- Salary must be between 30k and 150k
);

-- Creating Project table to store project information
CREATE TABLE Project (
    pid INT PRIMARY KEY,       -- Project ID (unique identifier)
    pname VARCHAR(255),        -- Project name
    budget DECIMAL(10,2),      -- Project budget
    start_date DATE           -- Project start date
);

-- Creating junction table for Employee-Project relationship
CREATE TABLE Employee_Project (
    eid INT,                  -- Employee ID
    pid INT,                  -- Project ID
    hours_worked INT,         -- Hours worked on project
    PRIMARY KEY (eid, pid)    -- Composite primary key
);

-- =============================================
-- CONSTRAINTS AND KEYS SECTION
-- =============================================
-- Adding additional constraints to Project table
ALTER TABLE Project
    ADD CONSTRAINT budget_check CHECK (budget > 0),    -- Ensures budget is positive
    ADD CONSTRAINT pname_notnull NOT NULL (pname),     -- Makes project name required
    ALTER COLUMN start_date SET DEFAULT CURRENT_DATE;  -- Sets default start date

-- Adding constraints to Employee_Project table
ALTER TABLE Employee_Project
    ADD CONSTRAINT fk_emp FOREIGN KEY (eid) REFERENCES Emp(eid),    -- Links to Employee table
    ADD CONSTRAINT fk_proj FOREIGN KEY (pid) REFERENCES Project(pid), -- Links to Project table
    ADD CONSTRAINT hours_check CHECK (hours_worked > 0);            -- Ensures positive hours

-- =============================================
-- DEFAULT VALUES SECTION
-- =============================================
-- In Emp table: city DEFAULT 'Unknown'
-- In Emp table: hire_date DEFAULT CURRENT_DATE
-- In Project table: start_date DEFAULT CURRENT_DATE

-- =============================================
-- DATA INSERTION SECTION
-- =============================================
-- Inserting department data
INSERT INTO Dept (Did, Dname) VALUES 
    (1, 'CSE'),    -- Computer Science Department
    (2, 'SCA'),    -- School of Computer Applications
    (3, 'ECE');    -- Electronics and Communication

-- Inserting employee data
INSERT INTO Emp (eid, ename, age, city, email, deptid, salary) VALUES
    (1, 'John Doe', 25, 'New York', 'john@gmail.com', 1, 50000),   -- CSE employee
    (2, 'Jane Smith', 30, 'Delhi', 'jane@gmail.com', 2, 60000),    -- SCA employee
    (3, 'Bob Wilson', 35, 'London', 'bob@gmail.com', 3, 70000);    -- ECE employee

-- Inserting project data
INSERT INTO Project (pid, pname, budget) VALUES
    (1, 'Website Redesign', 100000),    -- Website project
    (2, 'Mobile App', 80000);           -- Mobile app project

-- Inserting employee-project assignments
INSERT INTO Employee_Project (eid, pid, hours_worked) VALUES
    (1, 1, 40),    -- John working 40 hours on Website Redesign
    (2, 1, 30),    -- Jane working 30 hours on Website Redesign
    (3, 2, 25);    -- Bob working 25 hours on Mobile App

-- =============================================
-- QUERY SECTION
-- =============================================
-- Selecting all employee records
SELECT * FROM Emp;
