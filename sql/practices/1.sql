
-- Creating a Database Named Company (this will help us to organize our tables)
CREATE DATABASE Company;
GO

-- Here We are using the Database we Have Created
USE Company;
GO

-- Creating a Table Named Employees with Relevant Columns
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2) -- Well here we are setting the number of digits before and after the decimal point
);

-- Inserting Sample Data into Employees Table
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary) VALUES
(1, 'John', 'Doe', 1, 50000),
(2, 'Jane', 'Smith', 2, 60000),
(3, 'Mike', 'Johnson', 3, 55000),
(4, 'Mary', 'Williams', 2, 62000),
(5, 'David', 'Brown', 3, 58000);

--------------- SELECTION QUERIES ----------------

-- Query to Select All Employees from the table of Employees
SELECT * FROM Employees;

-- Query to Select only the FirstName and LastName of the Employees
SELECT FirstName, LastName FROM Employees;


-- Query to select the distinct (unique) departments form the Employees table
SELECT DISTINCT DepartmentID FROM Employees;

-- Create Departments table for reference
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(50)
);

INSERT INTO Departments VALUES 
(1, 'HR'),
(2, 'IT'),
(3, 'Sales'),
(4, 'Marketing');

-- Add foreign key constraint
ALTER TABLE Employees 
ADD CONSTRAINT fk_employee_department 
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);

--------------- FILTERING QUERIES ----------------

-- Query to find Employees with Salary greater than 55000
SELECT * FROM Employees WHERE Salary > 55000;

-- Query to find Employees in the IT Department
SELECT * FROM Employees WHERE DepartmentID = 2;

-- Query to find Employees with Salary less than 60000
SELECT * FROM Employees WHERE Salary < 60000;

-- Query to find Employees whose FirstName starts with 'John'
SELECT * FROM Employees WHERE FirstName LIKE 'John%'; -- % means any the rest of the words on the cell selected

-- Query to find Employees whose LastName ends with 's'
SELECT * FROM Employees WHERE LastName LIKE '%s'; -- % means any the rest of the words on the cell selected

-- Query to find Employees whose FirstName contains 'an'
SELECT * FROM Employees WHERE FirstName LIKE '%an%'; -- % means any the rest of the words on the cell selected 

--------------- SORTING QUERIES ----------------

-- Query to order Employees by Salary in descending order
SELECT * FROM Employees ORDER BY Salary DESC;

-- Query to order Employees by departments in alphabetical order
SELECT * FROM Employees e 
JOIN Departments d ON e.DepartmentID = d.DepartmentID
ORDER BY d.DepartmentName ASC;

-- Query to order Employees by Department and then by Salary within each Department
SELECT * FROM Employees e 
JOIN Departments d ON e.DepartmentID = d.DepartmentID
ORDER BY d.DepartmentName ASC, Salary DESC; -- this makes the Employees to be graded according to the departments (in their alphabetical order) and their salaries(in descending order)

--------------- AGGREGATE QUERIES ----------------

-- Query to find the average Salary of all Employees
SELECT AVG(Salary) AS AverageSalary FROM Employees;

-- Query to find the total number of Employees in each Department
SELECT d.DepartmentName, COUNT(*) AS NumberOfEmployees 
FROM Employees e 
JOIN Departments d ON e.DepartmentID = d.DepartmentID 
GROUP BY d.DepartmentName;

-- Query to find the maximum Salary in the Employees table
SELECT MAX(Salary) AS MaxSalary FROM Employees;

-- Query to find the minimum Salary in the Employees table
SELECT MIN(Salary) AS MinSalary FROM Employees;

-- Query to find the total Salary expenditure of the Company
SELECT SUM(Salary) AS TotalSalaryExpenditure FROM Employees;

--------------- COMBINED QUERIES ----------------

-- Query to find the average Salary of Employees in the IT Department
SELECT AVG(Salary) AS AverageITSalary FROM Employees WHERE DepartmentID = 2;

-- Query to find the number of Employees with Salary greater than 55000 in each Department
SELECT d.DepartmentName, COUNT(*) AS NumberOfHighEarners 
FROM Employees e 
JOIN Departments d ON e.DepartmentID = d.DepartmentID 
WHERE Salary > 55000 
GROUP BY d.DepartmentName;

-- Query to find the highest Salary in each Department
SELECT d.DepartmentName, MAX(Salary) AS HighestSalary 
FROM Employees e 
JOIN Departments d ON e.DepartmentID = d.DepartmentID 
GROUP BY d.DepartmentName;

-- Query to find the total Salary expenditure for Employees in the Sales Department
SELECT SUM(Salary) AS TotalSalesSalary FROM Employees WHERE DepartmentID = 3;

-- Query to find the Employees in the IT Department ordered by Salary in descending order
SELECT * FROM Employees WHERE DepartmentID = 2 ORDER BY Salary DESC;

-- Query to find the number of Employees whose FirstName contains 'a' in each Department
SELECT d.DepartmentName, COUNT(*) AS NumberOfEmployeesWithA 
FROM Employees e 
JOIN Departments d ON e.DepartmentID = d.DepartmentID 
WHERE FirstName LIKE '%a%' 
GROUP BY d.DepartmentName;

-- Query to find the average Salary of Employees in each Department ordered by average Salary in descending order
SELECT d.DepartmentName, AVG(Salary) AS AverageSalary 
FROM Employees e 
JOIN Departments d ON e.DepartmentID = d.DepartmentID 
GROUP BY d.DepartmentName 
ORDER BY AverageSalary DESC;

--------------- More Works With Tables ----------------


-- Creating a Table Named Products with Relevant Columns
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(100),
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
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName NVARCHAR(100),
    ContactName NVARCHAR(100),
    Country NVARCHAR(50)
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
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
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

SELECT e.FirstName, e.LastName, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Query to get all Employees and their Departments, including those without a Department (Left Join Example)

SELECT e.FirstName, e.LastName, d.DepartmentName
FROM Employees e
LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Query to get all Departments and the Employees inside them, including Departments with no Employees (Right Join Example)

SELECT e.FirstName, e.LastName, d.DepartmentName
FROM Employees e
RIGHT JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Query to get all Employees and Departments, even if they don’t match (Full Outer Join Example)
-- (Note: FULL JOIN may not be supported in MySQL)

SELECT e.FirstName, e.LastName, d.DepartmentName
FROM Employees e
FULL OUTER JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Query to show all possible combinations of Employees and Departments (Cross Join Example)

SELECT e.FirstName, e.LastName, d.DepartmentName
FROM Employees e
CROSS JOIN Departments;



------------------- ALTER TABLE COMMANDS ----------------

-- Add a new column to a table
ALTER TABLE Employees
ADD Email NVARCHAR(100);

-- Add multiple columns at once
ALTER TABLE Employees
ADD DateOfBirth DATE,
    Salary DECIMAL(10,2);

-- Modify datatype of an existing column
ALTER TABLE Employees
ALTER COLUMN Salary DECIMAL(12,2);

-- Rename a column
EXEC sp_rename 'Employees.FirstName', 'FName', 'COLUMN';

-- Change column name + datatype
ALTER TABLE Employees
ALTER COLUMN LastName NVARCHAR(200) NULL;

-- Drop (delete) a column
ALTER TABLE Employees
DROP COLUMN Email;

-- Rename a table
EXEC sp_rename 'Employees', 'Staff';

-- Add a primary key (already done in CREATE TABLE, but for reference)
-- ALTER TABLE Departments ADD CONSTRAINT PK_DepartmentID PRIMARY KEY (DepartmentID);

-- Drop a primary key
-- ALTER TABLE Departments DROP CONSTRAINT PK_DepartmentID;

-- Add a foreign key
-- ALTER TABLE Employees ADD CONSTRAINT fk_department FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);

-- Drop a foreign key
-- ALTER TABLE Employees DROP CONSTRAINT fk_department;

-- Add a unique constraint
-- ALTER TABLE Employees ADD CONSTRAINT unique_email UNIQUE (Email);

-- Drop a unique constraint
-- ALTER TABLE Employees DROP CONSTRAINT unique_email;

-- Set a default value
ALTER TABLE Employees
ADD CONSTRAINT DF_Salary DEFAULT 0 FOR Salary;

-- Drop a default value
ALTER TABLE Employees
DROP CONSTRAINT DF_Salary;

-- Add NOT NULL constraint
ALTER TABLE Employees
ALTER COLUMN FirstName NVARCHAR(100) NOT NULL;

-- Remove NOT NULL constraint
ALTER TABLE Employees
ALTER COLUMN FirstName NVARCHAR(100) NULL;


--------------- STORED PROCEDURES ----------------

-- Simple Stored Procedure without parameters
CREATE PROCEDURE GetAllEmployees
AS
BEGIN
    SELECT * FROM Employees;
END;

-- Call the procedure
EXEC GetAllEmployees;

-- Stored Procedure with IN parameters
CREATE PROCEDURE GetEmployeeByDepartment 
    @dept_name INT
AS
BEGIN
    SELECT * FROM Employees WHERE DepartmentID = @dept_name;
END;

-- Call the procedure with parameter
EXEC GetEmployeeByDepartment @dept_name = 2;

-- Stored Procedure with OUT parameters
CREATE PROCEDURE GetAverageSalary 
    @avg_salary DECIMAL(10,2) OUTPUT
AS
BEGIN
    SELECT @avg_salary = AVG(Salary) FROM Employees;
END;

-- Call procedure with OUT parameter
DECLARE @result DECIMAL(10,2);
EXEC GetAverageSalary @avg_salary = @result OUTPUT;
SELECT @result AS AverageSalary;

-- Stored Procedure with INOUT parameters (using OUTPUT)
CREATE PROCEDURE UpdateSalary 
    @emp_id INT,
    @new_salary DECIMAL(10,2) OUTPUT
AS
BEGIN
    UPDATE Employees SET Salary = @new_salary WHERE EmployeeID = @emp_id;
    SELECT @new_salary = Salary FROM Employees WHERE EmployeeID = @emp_id;
END;

-- Call procedure with OUTPUT parameter
DECLARE @salary DECIMAL(10,2) = 70000;
EXEC UpdateSalary @emp_id = 1, @new_salary = @salary OUTPUT;
SELECT @salary AS UpdatedSalary;

-- Stored Procedure with error handling (using TRY CATCH)
CREATE PROCEDURE AddEmployee
    @emp_id INT,
    @fname NVARCHAR(50),
    @lname NVARCHAR(50),
    @dept_id INT,
    @sal DECIMAL(10,2)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
        INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary) 
        VALUES (@emp_id, @fname, @lname, @dept_id, @sal);
        COMMIT;
        SELECT 'Employee added successfully' AS SuccessMessage;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        SELECT 
            ERROR_NUMBER() AS ErrorNumber,
            ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;

-- Call procedure with error handling
EXEC AddEmployee @emp_id = 6, @fname = 'Sarah', @lname = 'Wilson', @dept_id = 1, @sal = 52000;


--------------- FUNCTIONS ----------------

-- Simple scalar function to calculate bonus
CREATE FUNCTION dbo.CalculateBonus(@base_salary DECIMAL(10,2)) 
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @base_salary * 0.10;
END;

-- Use function in query (MSSQL requires schema prefix)
SELECT EmployeeID, FirstName, LastName, Salary, 
       dbo.CalculateBonus(Salary) AS Bonus, 
       (Salary + dbo.CalculateBonus(Salary)) AS TotalCompensation 
FROM Employees;

-- Function with multiple parameters
CREATE FUNCTION dbo.GetFullName(@first_name NVARCHAR(50), @last_name NVARCHAR(50)) 
RETURNS NVARCHAR(100)
AS
BEGIN
    RETURN @first_name + ' ' + @last_name;
END;

-- Use function to get full names
SELECT EmployeeID, dbo.GetFullName(FirstName, LastName) AS FullName, DepartmentID 
FROM Employees;


--------------- TRIGGERS ----------------

-- Create audit table for triggers
CREATE TABLE Salary_Audit (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT,
    OldSalary DECIMAL(10,2),
    NewSalary DECIMAL(10,2),
    ChangeDate DATETIME DEFAULT GETDATE()
);

-- Create Department Statistics table
CREATE TABLE DepartmentStats (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(50),
    EmployeeCount INT DEFAULT 0,
    TotalSalary DECIMAL(12,2) DEFAULT 0
);

INSERT INTO DepartmentStats (DepartmentID, DepartmentName) 
SELECT DepartmentID, DepartmentName FROM Departments;

-- BEFORE INSERT Trigger (INSTEAD OF in MSSQL)
CREATE TRIGGER trg_employee_insert
ON Employees
INSTEAD OF INSERT
AS
BEGIN
    -- Auto-generate EmployeeID if not provided
    INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary)
    SELECT 
        ISNULL(i.EmployeeID, (SELECT COALESCE(MAX(EmployeeID), 0) + 1 FROM Employees)),
        i.FirstName, 
        i.LastName, 
        i.DepartmentID, 
        CASE WHEN i.Salary < 0 THEN 0 ELSE i.Salary END
    FROM inserted i;
END;

-- AFTER UPDATE Trigger
CREATE TRIGGER trg_employee_update
ON Employees
AFTER UPDATE
AS
BEGIN
    -- Log salary changes to an audit table
    INSERT INTO Salary_Audit (EmployeeID, OldSalary, NewSalary, ChangeDate)
    SELECT 
        d.EmployeeID, 
        d.Salary AS OldSalary, 
        i.Salary AS NewSalary, 
        GETDATE()
    FROM inserted i
    INNER JOIN deleted d ON i.EmployeeID = d.EmployeeID
    WHERE d.Salary <> i.Salary;
END;

-- BEFORE DELETE Trigger (INSTEAD OF in MSSQL)
CREATE TRIGGER trg_employee_delete
ON Employees
INSTEAD OF DELETE
AS
BEGIN
    -- Prevent deletion of employees in IT department
    IF EXISTS (
        SELECT 1 FROM deleted 
        WHERE DepartmentID = 2  -- IT Department
    )
    BEGIN
        RAISERROR('Cannot delete IT department employees', 16, 1);
        ROLLBACK;
        RETURN;
    END
    
    -- Delete records that are not in IT department
    DELETE FROM Employees 
    WHERE EmployeeID IN (
        SELECT EmployeeID FROM deleted 
        WHERE DepartmentID <> 2
    );
END;

-- AFTER INSERT Trigger for Department Statistics
CREATE TRIGGER trg_employee_insert_stats
ON Employees
AFTER INSERT
AS
BEGIN
    UPDATE DepartmentStats 
    SET EmployeeCount = EmployeeCount + 1 
    FROM DepartmentStats ds
    INNER JOIN inserted i ON ds.DepartmentID = i.DepartmentID;
END;

-- BEFORE UPDATE Trigger for complex validation (INSTEAD OF in MSSQL)
CREATE TRIGGER trg_employee_salary_update
ON Employees
INSTEAD OF UPDATE
AS
BEGIN
    DECLARE @avg_salary DECIMAL(10,2);
    DECLARE @max_increase DECIMAL(10,2);
    
    -- Update with validation
    UPDATE e
    SET Salary = CASE 
        WHEN i.Salary > (d.Salary * 1.20) THEN d.Salary * 1.20
        ELSE i.Salary
    END,
    FirstName = i.FirstName,
    LastName = i.LastName,
    DepartmentID = i.DepartmentID
    FROM Employees e
    INNER JOIN inserted i ON e.EmployeeID = i.EmployeeID
    INNER JOIN deleted d ON e.EmployeeID = d.EmployeeID
    
    -- Get average salary for the department (if needed for complex logic)
    -- SELECT @avg_salary = AVG(Salary) FROM Employees WHERE DepartmentID = i.DepartmentID;
END;


--------------- CURSORS ----------------

-- Simple Cursor Example
CREATE PROCEDURE ProcessEmployees
AS
BEGIN
    -- Declare variables
    DECLARE @done INT = 0;
    DECLARE @emp_id INT;
    DECLARE @emp_firstname NVARCHAR(50);
    DECLARE @emp_lastname NVARCHAR(50);
    DECLARE @emp_dept INT;
    DECLARE @emp_salary DECIMAL(10,2);
    
    -- Create temporary table for results
    CREATE TABLE #EmployeeSummary (
        EmployeeID INT,
        FullName NVARCHAR(100),
        DepartmentID INT,
        Salary DECIMAL(10,2),
        SalaryGrade NVARCHAR(20)
    );
    
    -- Declare cursor
    DECLARE emp_cursor CURSOR LOCAL FOR 
        SELECT EmployeeID, FirstName, LastName, DepartmentID, Salary 
        FROM Employees;
    
    -- Open cursor
    OPEN emp_cursor;
    
    -- Loop through cursor
    FETCH NEXT FROM emp_cursor INTO @emp_id, @emp_firstname, @emp_lastname, @emp_dept, @emp_salary;
    
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Insert processed data into summary table
        INSERT INTO #EmployeeSummary (EmployeeID, FullName, DepartmentID, Salary, SalaryGrade)
        VALUES (
            @emp_id, 
            @emp_firstname + ' ' + @emp_lastname, 
            @emp_dept, 
            @emp_salary,
            CASE 
                WHEN @emp_salary > 60000 THEN 'High'
                WHEN @emp_salary > 55000 THEN 'Medium'
                ELSE 'Low'
            END
        );
        
        FETCH NEXT FROM emp_cursor INTO @emp_id, @emp_firstname, @emp_lastname, @emp_dept, @emp_salary;
    END
    
    -- Close cursor
    CLOSE emp_cursor;
    DEALLOCATE emp_cursor;
    
    -- Return results
    SELECT * FROM #EmployeeSummary ORDER BY Salary DESC;
    
    -- Clean up
    DROP TABLE #EmployeeSummary;
END;

-- Call cursor procedure
EXEC ProcessEmployees;

-- Cursor with multiple result sets
CREATE PROCEDURE GetDepartmentStatistics
AS
BEGIN
    DECLARE @done INT = 0;
    DECLARE @dept_id INT;
    DECLARE @emp_count INT;
    DECLARE @avg_sal DECIMAL(10,2);
    
    CREATE TABLE #DeptStats (
        DepartmentID INT,
        EmployeeCount INT,
        AverageSalary DECIMAL(10,2)
    );
    
    -- Cursor for department statistics
    DECLARE dept_cursor CURSOR LOCAL FOR 
        SELECT d.DepartmentID, COUNT(e.EmployeeID), AVG(e.Salary)
        FROM Departments d
        LEFT JOIN Employees e ON d.DepartmentID = e.DepartmentID
        GROUP BY d.DepartmentID;
    
    OPEN dept_cursor;
    
    FETCH NEXT FROM dept_cursor INTO @dept_id, @emp_count, @avg_sal;
    
    WHILE @@FETCH_STATUS = 0
    BEGIN
        INSERT INTO #DeptStats VALUES (@dept_id, @emp_count, @avg_sal);
        FETCH NEXT FROM dept_cursor INTO @dept_id, @emp_count, @avg_sal;
    END
    
    CLOSE dept_cursor;
    DEALLOCATE dept_cursor;
    
    SELECT * FROM #DeptStats ORDER BY AverageSalary DESC;
    DROP TABLE #DeptStats;
END;


--------------- TRANSACTIONS ----------------

-- Basic transaction example
BEGIN TRANSACTION;

INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary) 
VALUES (7, 'Tom', 'Harris', 3, 56000);

UPDATE Employees SET Salary = Salary * 1.05 WHERE DepartmentID = 3;

-- Commit the transaction
COMMIT;

-- Transaction with rollback
BEGIN TRANSACTION;

INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary) 
VALUES (8, 'Lisa', 'Davis', 2, 65000);

-- If something goes wrong, rollback
ROLLBACK;

-- Transaction with savepoints (using named transactions)
BEGIN TRANSACTION;

INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary) 
VALUES (9, 'Mike', 'Chen', 1, 53000);

-- Savepoint equivalent using nested transactions
BEGIN TRANSACTION SavePoint1;

INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary) 
VALUES (10, 'Anna', 'Garcia', 4, 54000);

-- Rollback to savepoint (partial rollback)
ROLLBACK TRANSACTION SavePoint1;

COMMIT;


--------------- VARIABLES ----------------

-- Session variables
DECLARE @employee_count INT;
DECLARE @dept_name NVARCHAR(50);
DECLARE @avg_salary DECIMAL(10,2);

SET @employee_count = (SELECT COUNT(*) FROM Employees);
SELECT @employee_count AS TotalEmployees;

SET @dept_name = 'IT';
SET @avg_salary = (SELECT AVG(Salary) FROM Employees WHERE DepartmentID = 2);
SELECT @avg_salary AS AverageITSalary;

-- Local variables in procedures
CREATE PROCEDURE CalculateDepartmentStats 
    @dept_name NVARCHAR(50)
AS
BEGIN
    DECLARE @emp_count INT = 0;
    DECLARE @total_salary DECIMAL(12,2) = 0;
    DECLARE @avg_salary DECIMAL(10,2) = 0;
    
    SELECT @emp_count = COUNT(*), @total_salary = SUM(Salary), @avg_salary = AVG(Salary)
    FROM Employees 
    WHERE DepartmentID = CAST(@dept_name AS INT);
    
    SELECT 
        @dept_name AS Department,
        @emp_count AS EmployeeCount,
        @total_salary AS TotalSalary,
        @avg_salary AS AverageSalary;
END;

EXEC CalculateDepartmentStats @dept_name = '2';


--------------- DYNAMIC SQL ----------------


-- Dynamic SQL with EXECUTE
CREATE PROCEDURE DynamicQuery
    @table_name NVARCHAR(50),
    @column_name NVARCHAR(50)
AS
BEGIN
    DECLARE @sql NVARCHAR(MAX);
    SET @sql = 'SELECT ' + @column_name + ' FROM ' + @table_name;
    EXEC sp_executesql @sql;
END;

-- Call dynamic query
EXEC DynamicQuery @table_name = 'Employees', @column_name = 'FirstName, LastName';

-- Dynamic SQL with parameters
CREATE PROCEDURE FilterAndSort
    @filter_column NVARCHAR(50),
    @filter_value NVARCHAR(50),
    @sort_column NVARCHAR(50),
    @sort_order NVARCHAR(4)
AS
BEGIN
    DECLARE @sql NVARCHAR(MAX);
    DECLARE @param_definition NVARCHAR(100) = '@filter_value NVARCHAR(50)';
    
    SET @sql = 'SELECT * FROM Employees WHERE ' + @filter_column + ' = @filter_value ORDER BY ' + @sort_column + ' ' + @sort_order;
    
    EXEC sp_executesql @sql, @param_definition, @filter_value;
END;

EXEC FilterAndSort @filter_column = 'DepartmentID', @filter_value = '2', @sort_column = 'Salary', @sort_order = 'DESC';


--------------- ERROR HANDLING ----------------

-- Error handling with custom error messages (using TRY CATCH)
CREATE PROCEDURE SafeEmployeeInsert
    @emp_id INT,
    @fname NVARCHAR(50),
    @lname NVARCHAR(50),
    @dept_id INT,
    @sal DECIMAL(10,2),
    @result_message NVARCHAR(100) OUTPUT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
        INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary) 
        VALUES (@emp_id, @fname, @lname, @dept_id, @sal);
        COMMIT;
        SET @result_message = 'Employee inserted successfully';
    END TRY
    BEGIN CATCH
        ROLLBACK;
        IF ERROR_NUMBER() = 2627 -- Primary key violation
        BEGIN
            SET @result_message = 'Error: Employee ID already exists';
        END
        ELSE IF ERROR_NUMBER() = 547 -- Foreign key constraint
        BEGIN
            SET @result_message = 'Error: Invalid department';
        END
        ELSE IF ERROR_NUMBER() = 8114 -- Data type conversion error
        BEGIN
            SET @result_message = 'Error: Invalid data type';
        END
        ELSE
        BEGIN
            SET @result_message = 'Error: ' + ERROR_MESSAGE();
        END
    END CATCH
END;

-- Test error handling
DECLARE @result NVARCHAR(100);
EXEC SafeEmployeeInsert @emp_id = 11, @fname = 'Test', @lname = 'User', @dept_id = 99, @sal = 50000, @result_message = @result OUTPUT;
SELECT @result;


--------------- VIEWS ----------------

-- Simple view
CREATE VIEW EmployeeDetails AS
SELECT 
    EmployeeID,
    FirstName + ' ' + LastName AS FullName,
    DepartmentID,
    Salary,
    dbo.CalculateBonus(Salary) AS Bonus
FROM Employees;

-- Use the view
SELECT * FROM EmployeeDetails WHERE DepartmentID = 2;

-- Complex view with join
CREATE VIEW DepartmentSummary AS
SELECT 
    d.DepartmentID,
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount,
    AVG(e.Salary) AS AverageSalary,
    SUM(e.Salary) AS TotalSalary,
    MAX(e.Salary) AS HighestSalary,
    MIN(e.Salary) AS LowestSalary1
FROM Departments d
LEFT JOIN Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName;

-- Use the view
SELECT * FROM DepartmentSummary ORDER BY AverageSalary DESC;

-- Updatable view
CREATE VIEW ITEmployees AS
SELECT EmployeeID, FirstName, LastName, Salary
FROM Employees
WHERE DepartmentID = 2;

-- Update through view
UPDATE ITEmployees SET Salary = Salary * 1.10 WHERE EmployeeID = 2;

-- Drop view
DROP VIEW EmployeeDetails;


--------------- INDEXES ----------------

-- Create index on single column
CREATE INDEX idx_department ON Employees(DepartmentID);

-- Create index on multiple columns
CREATE INDEX idx_dept_salary ON Employees(DepartmentID, Salary DESC);

-- Create unique index (requires Email column to exist)
-- CREATE UNIQUE INDEX idx_employee_email ON Employees(Email);

-- Create full-text index (for text search) - requires table to be full-text enabled
-- CREATE FULLTEXT CATALOG ft_catalog AS DEFAULT;
-- CREATE FULLTEXT INDEX ON Employees(FirstName, LastName) KEY INDEX PK__Employees__EMPLOYEE;

-- Use full-text search (MSSQL syntax)
-- SELECT * FROM Employees 
-- WHERE FREETEXT((FirstName, LastName), 'John Smith');

-- Drop index
DROP INDEX idx_department ON Employees;

--------------- SUBQUERIES AND CTEs ----------------


-- Subquery examples
SELECT * FROM Employees 
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

SELECT DepartmentID, (SELECT COUNT(*) FROM Employees e2 WHERE e2.DepartmentID = e1.DepartmentID) AS EmployeeCount
FROM Employees e1
GROUP BY DepartmentID;

-- Common Table Expressions (CTEs)
WITH DepartmentStats AS (
    SELECT 
        DepartmentID,
        COUNT(*) AS EmployeeCount,
        AVG(Salary) AS AverageSalary
    FROM Employees
    GROUP BY DepartmentID
),
HighSalaryEmployees AS (
    SELECT EmployeeID, FirstName, LastName, Salary
    FROM Employees
    WHERE Salary > 60000
)
SELECT 
    d.DepartmentID,
    h.FirstName,
    h.LastName,
    h.Salary,
    d.AverageSalary
FROM HighSalaryEmployees h
JOIN DepartmentStats d ON h.DepartmentID = d.DepartmentID
ORDER BY h.Salary DESC;

-- Recursive CTE (MSSQL syntax)
WITH EmployeeHierarchy AS (
    -- Base case: top-level employees (no manager)
    SELECT EmployeeID, FirstName, LastName, DepartmentID, Salary, 1 AS Level
    FROM Employees
    WHERE EmployeeID = 1
    
    UNION ALL
    
    -- Recursive case
    SELECT e.EmployeeID, e.FirstName, e.LastName, e.DepartmentID, e.Salary, eh.Level + 1
    FROM Employees e
    JOIN EmployeeHierarchy eh ON e.EmployeeID > eh.EmployeeID
    WHERE eh.Level < 5 -- Prevent infinite recursion
)
SELECT * FROM EmployeeHierarchy ORDER BY Level, EmployeeID;


