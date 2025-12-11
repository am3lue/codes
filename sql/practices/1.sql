-- Creating a Database Named Company (this will help us to organize our tables)
CREATE DATABASE Company;

-- Here We are using the Database we Have Created
USE Company;

-- Creating a Table Named Employees with Relevant Columns
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2) -- Well here we are setting the number of digits before and after the decimal point
);

-- Inserting Sample Data into Employees Table
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary) VALUES
(1, 'John', 'Doe', 'HR', 50000),
(2, 'Jane', 'Smith', 'IT', 60000),
(3, 'Mike', 'Johnson', 'Sales', 55000),
(4, 'Mary', 'Williams', 'IT', 62000),
(5, 'David', 'Brown', 'Sales', 58000);

--------------- SELECTION QUERIES ----------------

-- Query to Select All Employees from the table of Employees
SELECT * FROM Employees;

-- Query to Select only the FirstName and LastName of the Employees
SELECT FirstName, LastName FROM Employees;

-- Query to select the distinct (unique) departments form the Employees table
SELECT DISTINCT Department FROM Employees;


--------------- FILTERING QUERIES ----------------


-- Query to find Employees with Salary greater than 55000
SELECT * FROM Employees WHERE Salary > 55000;

-- Query to find Employees in the IT Department
SELECT * FROM Employees WHERE Department = 'IT';

-- Query to find Employees with Salary between less than 60000
SELECT * FROM Employees WHERE Salary < 60000;

-- Query to find Employees whose FirstName starts with named 'peter'
SELECT * FROM Employees WHERE FirstName LIKE 'Peter%'; -- % means any the rest of the words on the cell selected

-- Query to find Employees whose LastName ends with 's'
SELECT * FROM Employees WHERE LastName LIKE '%s'; -- % means any the rest of the words on the cell selected

-- Query to find Employees whose FirstName contains 'an'
SELECT * FROM Employees WHERE FirstName LIKE '%an%'; -- % means any the rest of the words on the cell selected 

--------------- SORTING QUERIES ----------------

-- Query to order Employees by Salary in descending order
SELECT * FROM Employees ORDER BY Salary DESC;

-- Query to order Employees by departments in alphabetical order
SELECT * FROM Employees ORDER BY Department ASC;

-- Query to order Employees by Department and then by Salary within each Department
SELECT * FROM Employees ORDER BY Department ASC, Salary DESC; -- this makes the Employees to be graded according to the departments (in their alphabetical order) and their salaries(in descending order)

--------------- AGGREGATE QUERIES ----------------

-- Query to find the average Salary of all Employees
SELECT AVG(Salary) AS AverageSalary FROM Employees;

-- Query to find the total number of Employees in each Department
SELECT Department, COUNT(*) AS NumberOfEmployees FROM Employees GROUP BY Department;

-- Query to find the maximum Salary in the Employees table
SELECT MAX(Salary) AS MaxSalary FROM Employees;

-- Query to find the minimum Salary in the Employees table
SELECT MIN(Salary) AS MinSalary FROM Employees;

-- Query to find the total Salary expenditure of the Company
SELECT SUM(Salary) AS TotalSalaryExpenditure FROM Employees;

--------------- COMBINED QUERIES ----------------

-- Query to find the average Salary of Employees in the IT Department
SELECT AVG(Salary) AS AverageITSalary FROM Employees WHERE Department = 'IT';

-- Query to find the number of Employees with Salary greater than 55000 in each Department
SELECT Department, COUNT(*) AS NumberOfHighEarners FROM Employees WHERE Salary > 55000 GROUP BY Department;

-- Query to find the highest Salary in each Department
SELECT Department, MAX(Salary) AS HighestSalary FROM Employees GROUP BY Department;

-- Query to find the total Salary expenditure for Employees in the Sales Department
SELECT SUM(Salary) AS TotalSalesSalary FROM Employees WHERE Department = 'Sales';

-- Query to find the Employees in the IT Department ordered by Salary in descending order
SELECT * FROM Employees WHERE Department = 'IT' ORDER BY Salary DESC;

-- Query to find the number of Employees whose FirstName contains 'a' in each Department
SELECT Department, COUNT(*) AS NumberOfEmployeesWithA FROM Employees WHERE FirstName LIKE '%a%' GROUP BY Department;

-- Query to find the average Salary of Employees in each Department ordered by average Salary in descending order
SELECT Department, AVG(Salary) AS AverageSalary FROM Employees GROUP BY Department ORDER BY AverageSalary DESC;

--------------- More Works With Tables ----------------

-- Creating a Table Named Products with Relevant Columns
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    SupplierID INT,
    CategoryID INT,
    Price DECIMAL(10, 2)
);

-- Inserting Sample Data into Products Table
INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, Price) VALUES
(1, 'Chai', 101, 1, 800.00),
(2, 'Coffee', 102, 1, 600.00),
(3, 'Orange Juice', 103, 2, 400.00),
(4, 'Apple Juice', 104, 2, 450.00),
(5, 'Green Tea', 105, 1, 700.00),
(6, 'Black Tea', 106, 1, 650.00),
(7, 'Lemonade', 107, 2, 300.00),
(8, 'Soda', 108, 2, 350.00);


-- Creating a table Named Customers with Relevant Columns
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    ContactName VARCHAR(100),
    Country VARCHAR(50)
);

-- Inserting Sample Data into Customers Table
INSERT INTO Customers (CustomerID, CustomerName, ContactName, Country) VALUES
(1, 'Alfred Futterkiste', 'Maria Anders', 'Germany'),
(2, 'Ana Trujillo Emparedados y Frios', 'Ana Trujillo', 'Mexico'),
(3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Mexico'),
(4, 'Around the Horn', 'Thomas Hardy', 'UK'),
(5, 'Berglunds snabbköp', 'Christina Berglund', 'Sweden');

-- Creating a table Named Orders with Relevant Columns
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2)
);

--------------- UPDATE AND DELETE QUERIES-----------------


-- Updating the Salary of an Employee
UPDATE Employees SET Salary = 65000 WHERE EmployeeID = 2;   

-- Deleting a Product from the Products Table
DELETE FROM Products WHERE ProductID = 3;


------------------- JOINS QUERIES ----------------

-- Query to get all Employees along with their Departments (Inner Join Example)
SELECT Employees.FirstName, Employees.LastName, Departments.DepartmentName
FROM Employees
INNER JOIN Departments ON Employees.Department = Departments.DepartmentID;

-- Query to get all Employees and their Departments, including those without a Department (Left Join Example)
SELECT Employees.FirstName, Employees.LastName, Departments.DepartmentName
FROM Employees
LEFT JOIN Departments ON Employees.Department = Departments.DepartmentID;

-- Query to get all Departments and the Employees inside them, including Departments with no Employees (Right Join Example)
SELECT Employees.FirstName, Employees.LastName, Departments.DepartmentName
FROM Employees
RIGHT JOIN Departments ON Employees.Department = Departments.DepartmentID;

-- Query to get all Employees and Departments, even if they don’t match (Full Outer Join Example)
-- (Note: FULL JOIN may not be supported in MySQL)
SELECT Employees.FirstName, Employees.LastName, Departments.DepartmentName
FROM Employees
FULL OUTER JOIN Departments ON Employees.Department = Departments.DepartmentID;

-- Query to show all possible combinations of Employees and Departments (Cross Join Example)
SELECT Employees.FirstName, Employees.LastName, Departments.DepartmentName
FROM Employees
CROSS JOIN Departments;


------------------- ALTER TABLE COMMANDS ----------------

-- Add a new column to a table
ALTER TABLE Employees
ADD Email VARCHAR(100);

-- Add multiple columns at once
ALTER TABLE Employees
ADD (
    DateOfBirth DATE,
    Salary DECIMAL(10,2)
);

-- Modify datatype of an existing column
ALTER TABLE Employees
MODIFY COLUMN Salary DECIMAL(12,2);

-- Rename a column
ALTER TABLE Employees
RENAME COLUMN FirstName TO FName;

-- Change column name + datatype (MySQL)
ALTER TABLE Employees
CHANGE LastName LastName VARCHAR(200);

-- Drop (delete) a column
ALTER TABLE Employees
DROP COLUMN Email;

-- Rename a table
ALTER TABLE Employees
RENAME TO Staff;

-- Add a primary key
ALTER TABLE Departments
ADD PRIMARY KEY (DepartmentID);

-- Drop a primary key
ALTER TABLE Departments
DROP PRIMARY KEY;

-- Add a foreign key
ALTER TABLE Employees
ADD CONSTRAINT fk_department
FOREIGN KEY (Department) REFERENCES Departments(DepartmentID);

-- Drop a foreign key
ALTER TABLE Employees
DROP FOREIGN KEY fk_department;

-- Add a unique constraint
ALTER TABLE Employees
ADD CONSTRAINT unique_email UNIQUE (Email);

-- Drop a unique constraint
ALTER TABLE Employees
DROP INDEX unique_email;

-- Set a default value
ALTER TABLE Employees
ALTER COLUMN Salary SET DEFAULT 0;

-- Drop a default value
ALTER TABLE Employees
ALTER COLUMN Salary DROP DEFAULT;

-- Add NOT NULL constraint
ALTER TABLE Employees
MODIFY COLUMN FirstName VARCHAR(100) NOT NULL;


-- Remove NOT NULL constraint
ALTER TABLE Employees
MODIFY COLUMN FirstName VARCHAR(100) NULL;

--------------- STORED PROCEDURES ----------------

-- Simple Stored Procedure without parameters
DELIMITER //
CREATE PROCEDURE GetAllEmployees()
BEGIN
    SELECT * FROM Employees;
END //
DELIMITER ;

-- Call the procedure
CALL GetAllEmployees();

-- Stored Procedure with IN parameters
DELIMITER //
CREATE PROCEDURE GetEmployeeByDepartment(IN dept_name VARCHAR(50))
BEGIN
    SELECT * FROM Employees WHERE Department = dept_name;
END //
DELIMITER ;

-- Call the procedure with parameter
CALL GetEmployeeByDepartment('IT');

-- Stored Procedure with OUT parameters
DELIMITER //
CREATE PROCEDURE GetAverageSalary(OUT avg_salary DECIMAL(10,2))
BEGIN
    SELECT AVG(Salary) INTO avg_salary FROM Employees;
END //
DELIMITER ;

-- Call procedure with OUT parameter
CALL GetAverageSalary(@avg_salary);
SELECT @avg_salary AS AverageSalary;

-- Stored Procedure with INOUT parameters
DELIMITER //
CREATE PROCEDURE UpdateSalary(IN emp_id INT, INOUT new_salary DECIMAL(10,2))
BEGIN
    UPDATE Employees SET Salary = new_salary WHERE EmployeeID = emp_id;
    SELECT Salary INTO new_salary FROM Employees WHERE EmployeeID = emp_id;
END //
DELIMITER ;

-- Call procedure with INOUT parameter
SET @salary = 70000;
CALL UpdateSalary(1, @salary);
SELECT @salary AS UpdatedSalary;

-- Stored Procedure with error handling
DELIMITER //
CREATE PROCEDURE AddEmployee(
    IN emp_id INT,
    IN fname VARCHAR(50),
    IN lname VARCHAR(50),
    IN dept VARCHAR(50),
    IN sal DECIMAL(10,2)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error occurred while adding employee' AS ErrorMessage;
    END;
    
    START TRANSACTION;
    INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary) 
    VALUES (emp_id, fname, lname, dept, sal);
    COMMIT;
    
    SELECT 'Employee added successfully' AS SuccessMessage;
END //
DELIMITER ;

-- Call procedure with error handling
CALL AddEmployee(6, 'Sarah', 'Wilson', 'HR', 52000);

--------------- FUNCTIONS ----------------

-- Simple function to calculate bonus
DELIMITER //
CREATE FUNCTION CalculateBonus(base_salary DECIMAL(10,2)) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN base_salary * 0.10;
END //
DELIMITER ;

-- Use function in query
SELECT EmployeeID, FirstName, LastName, Salary, 
       CalculateBonus(Salary) AS Bonus, 
       (Salary + CalculateBonus(Salary)) AS TotalCompensation 
FROM Employees;

-- Function with multiple parameters
DELIMITER //
CREATE FUNCTION GetFullName(first_name VARCHAR(50), last_name VARCHAR(50)) 
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    RETURN CONCAT(first_name, ' ', last_name);
END //
DELIMITER ;

-- Use function to get full names
SELECT EmployeeID, GetFullName(FirstName, LastName) AS FullName, Department 
FROM Employees;

--------------- TRIGGERS ----------------

-- Create Departments table first (referenced in triggers)
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments VALUES 
(1, 'HR'),
(2, 'IT'),
(3, 'Sales'),
(4, 'Marketing');

-- Add foreign key constraint
ALTER TABLE Employees 
ADD CONSTRAINT fk_employee_department 
FOREIGN KEY (Department) REFERENCES Departments(DepartmentID);

-- BEFORE INSERT Trigger
DELIMITER //
CREATE TRIGGER before_employee_insert
BEFORE INSERT ON Employees
FOR EACH ROW
BEGIN
    -- Auto-generate EmployeeID if not provided
    IF NEW.EmployeeID IS NULL THEN
        SET NEW.EmployeeID = (SELECT COALESCE(MAX(EmployeeID), 0) + 1 FROM Employees);
    END IF;
    
    -- Ensure salary is not negative
    IF NEW.Salary < 0 THEN
        SET NEW.Salary = 0;
    END IF;
END //
DELIMITER ;

-- AFTER UPDATE Trigger
DELIMITER //
CREATE TRIGGER after_employee_update
AFTER UPDATE ON Employees
FOR EACH ROW
BEGIN
    -- Log salary changes to an audit table
    INSERT INTO Salary_Audit (EmployeeID, OldSalary, NewSalary, ChangeDate)
    VALUES (OLD.EmployeeID, OLD.Salary, NEW.Salary, NOW());
END //
DELIMITER ;

-- Create audit table for triggers
CREATE TABLE Salary_Audit (
    AuditID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    OldSalary DECIMAL(10,2),
    NewSalary DECIMAL(10,2),
    ChangeDate DATETIME
);

-- BEFORE DELETE Trigger
DELIMITER //
CREATE TRIGGER before_employee_delete
BEFORE DELETE ON Employees
FOR EACH ROW
BEGIN
    -- Prevent deletion of employees in IT department
    IF OLD.Department = 'IT' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete IT department employees';
    END IF;
END //
DELIMITER ;

-- AFTER INSERT Trigger for Department Statistics
DELIMITER //
CREATE TRIGGER after_employee_insert_stats
AFTER INSERT ON Employees
FOR EACH ROW
BEGIN
    UPDATE DepartmentStats 
    SET EmployeeCount = EmployeeCount + 1 
    WHERE DepartmentID = NEW.Department;
END //
DELIMITER ;

-- Create Department Statistics table
CREATE TABLE DepartmentStats (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    EmployeeCount INT DEFAULT 0,
    TotalSalary DECIMAL(12,2) DEFAULT 0
);

INSERT INTO DepartmentStats (DepartmentID, DepartmentName) 
SELECT DepartmentID, DepartmentName FROM Departments;

-- BEFORE UPDATE Trigger for complex validation
DELIMITER //
CREATE TRIGGER before_employee_salary_update
BEFORE UPDATE ON Employees
FOR EACH ROW
BEGIN
    DECLARE avg_salary DECIMAL(10,2);
    DECLARE max_increase DECIMAL(10,2);
    
    -- Get average salary for the department
    SELECT AVG(Salary) INTO avg_salary 
    FROM Employees WHERE Department = NEW.Department;
    
    -- Calculate maximum allowed increase (20% of current salary)
    SET max_increase = OLD.Salary * 0.20;
    
    -- Check if increase is too high
    IF NEW.Salary > (OLD.Salary + max_increase) THEN
        SET NEW.Salary = OLD.Salary + max_increase;
    END IF;
END //
DELIMITER ;

--------------- CURSORS ----------------

-- Simple Cursor Example
DELIMITER //
CREATE PROCEDURE ProcessEmployees()
BEGIN
    -- Declare variables
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE emp_firstname VARCHAR(50);
    DECLARE emp_lastname VARCHAR(50);
    DECLARE emp_dept VARCHAR(50);
    DECLARE emp_salary DECIMAL(10,2);
    
    -- Declare cursor
    DECLARE emp_cursor CURSOR FOR 
        SELECT EmployeeID, FirstName, LastName, Department, Salary 
        FROM Employees;
    
    -- Declare continue handler
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Create temporary table for results
    CREATE TEMPORARY TABLE IF NOT EXISTS EmployeeSummary (
        EmployeeID INT,
        FullName VARCHAR(100),
        Department VARCHAR(50),
        Salary DECIMAL(10,2),
        SalaryGrade VARCHAR(20)
    );
    
    -- Open cursor
    OPEN emp_cursor;
    
    -- Loop through cursor
    read_loop: LOOP
        FETCH emp_cursor INTO emp_id, emp_firstname, emp_lastname, emp_dept, emp_salary;
        
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Insert processed data into summary table
        INSERT INTO EmployeeSummary (EmployeeID, FullName, Department, Salary, SalaryGrade)
        VALUES (
            emp_id, 
            CONCAT(emp_firstname, ' ', emp_lastname), 
            emp_dept, 
            emp_salary,
            CASE 
                WHEN emp_salary > 60000 THEN 'High'
                WHEN emp_salary > 55000 THEN 'Medium'
                ELSE 'Low'
            END
        );
    END LOOP;
    
    -- Close cursor
    CLOSE emp_cursor;
    
    -- Return results
    SELECT * FROM EmployeeSummary ORDER BY Salary DESC;
    
    -- Clean up
    DROP TEMPORARY TABLE EmployeeSummary;
END //
DELIMITER ;

-- Call cursor procedure
CALL ProcessEmployees();

-- Cursor with multiple result sets
DELIMITER //
CREATE PROCEDURE GetDepartmentStatistics()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE dept_id INT;
    DECLARE emp_count INT;
    DECLARE avg_sal DECIMAL(10,2);
    
    -- Cursor for department statistics
    DECLARE dept_cursor CURSOR FOR 
        SELECT d.DepartmentID, COUNT(e.EmployeeID), AVG(e.Salary)
        FROM Departments d
        LEFT JOIN Employees e ON d.DepartmentID = e.Department
        GROUP BY d.DepartmentID;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    CREATE TEMPORARY TABLE IF NOT EXISTS DeptStats (
        DepartmentID INT,
        EmployeeCount INT,
        AverageSalary DECIMAL(10,2)
    );
    
    OPEN dept_cursor;
    
    dept_loop: LOOP
        FETCH dept_cursor INTO dept_id, emp_count, avg_sal;
        
        IF done THEN
            LEAVE dept_loop;
        END IF;
        
        INSERT INTO DeptStats VALUES (dept_id, emp_count, avg_sal);
    END LOOP;
    
    CLOSE dept_cursor;
    
    SELECT * FROM DeptStats ORDER BY AverageSalary DESC;
    DROP TEMPORARY TABLE DeptStats;
END //
DELIMITER ;

--------------- TRANSACTIONS ----------------

-- Basic transaction example
START TRANSACTION;

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary) 
VALUES (7, 'Tom', 'Harris', 'Sales', 56000);

UPDATE Employees SET Salary = Salary * 1.05 WHERE Department = 'Sales';

-- Commit the transaction
COMMIT;

-- Transaction with rollback
START TRANSACTION;

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary) 
VALUES (8, 'Lisa', 'Davis', 'IT', 65000);

-- If something goes wrong, rollback
ROLLBACK;

-- Transaction with savepoints
START TRANSACTION;

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary) 
VALUES (9, 'Mike', 'Chen', 'HR', 53000);

SAVEPOINT after_first_insert;

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary) 
VALUES (10, 'Anna', 'Garcia', 'Marketing', 54000);

-- Rollback to savepoint
ROLLBACK TO after_first_insert;

COMMIT;

--------------- VARIABLES ----------------

-- Session variables
SET @employee_count = (SELECT COUNT(*) FROM Employees);
SELECT @employee_count AS TotalEmployees;

SET @dept_name = 'IT';
SET @avg_salary = (SELECT AVG(Salary) FROM Employees WHERE Department = @dept_name);
SELECT @avg_salary AS AverageITSalary;

-- Local variables in procedures
DELIMITER //
CREATE PROCEDURE CalculateDepartmentStats(IN dept_name VARCHAR(50))
BEGIN
    DECLARE emp_count INT DEFAULT 0;
    DECLARE total_salary DECIMAL(12,2) DEFAULT 0;
    DECLARE avg_salary DECIMAL(10,2) DEFAULT 0;
    
    SELECT COUNT(*), SUM(Salary), AVG(Salary) 
    INTO emp_count, total_salary, avg_salary
    FROM Employees 
    WHERE Department = dept_name;
    
    SELECT 
        dept_name AS Department,
        emp_count AS EmployeeCount,
        total_salary AS TotalSalary,
        avg_salary AS AverageSalary;
END //
DELIMITER ;

CALL CalculateDepartmentStats('IT');

--------------- DYNAMIC SQL ----------------

-- Dynamic SQL with EXECUTE
DELIMITER //
CREATE PROCEDURE DynamicQuery(IN table_name VARCHAR(50), IN column_name VARCHAR(50))
BEGIN
    SET @sql = CONCAT('SELECT ', column_name, ' FROM ', table_name);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

-- Call dynamic query
CALL DynamicQuery('Employees', 'FirstName, LastName');

-- Dynamic SQL with parameters
DELIMITER //
CREATE PROCEDURE FilterAndSort(
    IN filter_column VARCHAR(50),
    IN filter_value VARCHAR(50),
    IN sort_column VARCHAR(50),
    IN sort_order VARCHAR(4)
)
BEGIN
    SET @sql = CONCAT(
        'SELECT * FROM Employees WHERE ', 
        filter_column, ' = ? ORDER BY ', 
        sort_column, ' ', sort_order
    );
    
    PREPARE stmt FROM @sql;
    SET @param = filter_value;
    EXECUTE stmt USING @param;
    DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

CALL FilterAndSort('Department', 'IT', 'Salary', 'DESC');

--------------- ERROR HANDLING ----------------

-- Error handling with custom error messages
DELIMITER //
CREATE PROCEDURE SafeEmployeeInsert(
    IN emp_id INT,
    IN fname VARCHAR(50),
    IN lname VARCHAR(50),
    IN dept VARCHAR(50),
    IN sal DECIMAL(10,2),
    OUT result_message VARCHAR(100)
)
BEGIN
    DECLARE EXIT HANDLER FOR 1062 -- Duplicate key error
    BEGIN
        SET result_message = 'Error: Employee ID already exists';
        ROLLBACK;
    END;
    
    DECLARE EXIT HANDLER FOR 1452 -- Foreign key constraint
    BEGIN
        SET result_message = 'Error: Invalid department';
        ROLLBACK;
    END;
    
    DECLARE EXIT HANDLER FOR 1264 -- Out of range value
    BEGIN
        SET result_message = 'Error: Salary value out of range';
        ROLLBACK;
    END;
    
    START TRANSACTION;
    INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary) 
    VALUES (emp_id, fname, lname, dept, sal);
    COMMIT;
    
    SET result_message = 'Employee inserted successfully';
END //
DELIMITER ;

-- Test error handling
CALL SafeEmployeeInsert(11, 'Test', 'User', 'InvalidDept', 50000, @result);
SELECT @result;

--------------- VIEWS ----------------

-- Simple view
CREATE VIEW EmployeeDetails AS
SELECT 
    EmployeeID,
    CONCAT(FirstName, ' ', LastName) AS FullName,
    Department,
    Salary,
    CalculateBonus(Salary) AS Bonus
FROM Employees;

-- Use the view
SELECT * FROM EmployeeDetails WHERE Department = 'IT';

-- Complex view with join
CREATE VIEW DepartmentSummary AS
SELECT 
    d.DepartmentID,
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount,
    AVG(e.Salary) AS AverageSalary,
    SUM(e.Salary) AS TotalSalary,
    MAX(e.Salary) AS HighestSalary,
    MIN(e.Salary) AS LowestSalary
FROM Departments d
LEFT JOIN Employees e ON d.DepartmentID = e.Department
GROUP BY d.DepartmentID, d.DepartmentName;

-- Use the view
SELECT * FROM DepartmentSummary ORDER BY AverageSalary DESC;

-- Updatable view
CREATE VIEW ITEmployees AS
SELECT EmployeeID, FirstName, LastName, Salary
FROM Employees
WHERE Department = 'IT';

-- Update through view
UPDATE ITEmployees SET Salary = Salary * 1.10 WHERE EmployeeID = 2;

-- Drop view
DROP VIEW IF EXISTS EmployeeDetails;

--------------- INDEXES ----------------

-- Create index on single column
CREATE INDEX idx_department ON Employees(Department);

-- Create index on multiple columns
CREATE INDEX idx_dept_salary ON Employees(Department, Salary DESC);

-- Create unique index
CREATE UNIQUE INDEX idx_employee_email ON Employees(Email);

-- Create full-text index (for text search)
CREATE FULLTEXT INDEX idx_employee_name ON Employees(FirstName, LastName);

-- Use full-text search
SELECT * FROM Employees 
WHERE MATCH(FirstName, LastName) AGAINST('John Smith' IN BOOLEAN MODE);

-- Drop index
DROP INDEX idx_department ON Employees;

--------------- SUBQUERIES AND CTEs ----------------

-- Subquery examples
SELECT * FROM Employees 
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

SELECT Department, (SELECT COUNT(*) FROM Employees e2 WHERE e2.Department = e1.Department) AS EmployeeCount
FROM Employees e1
GROUP BY Department;

-- Common Table Expressions (CTEs)
WITH DepartmentStats AS (
    SELECT 
        Department,
        COUNT(*) AS EmployeeCount,
        AVG(Salary) AS AverageSalary
    FROM Employees
    GROUP BY Department
),
HighSalaryEmployees AS (
    SELECT EmployeeID, FirstName, LastName, Salary
    FROM Employees
    WHERE Salary > 60000
)
SELECT 
    d.Department,
    h.FirstName,
    h.LastName,
    h.Salary,
    d.AverageSalary
FROM HighSalaryEmployees h
JOIN DepartmentStats d ON h.Department = d.Department
ORDER BY h.Salary DESC;

-- Recursive CTE
WITH RECURSIVE EmployeeHierarchy AS (
    -- Base case: top-level employees (no manager)
    SELECT EmployeeID, FirstName, LastName, Department, Salary, 1 AS Level
    FROM Employees
    WHERE EmployeeID = 1
    
    UNION ALL
    
    -- Recursive case
    SELECT e.EmployeeID, e.FirstName, e.LastName, e.Department, e.Salary, eh.Level + 1
    FROM Employees e
    JOIN EmployeeHierarchy eh ON e.EmployeeID > eh.EmployeeID
    WHERE eh.Level < 5 -- Prevent infinite recursion
)
SELECT * FROM EmployeeHierarchy ORDER BY Level, EmployeeID;


