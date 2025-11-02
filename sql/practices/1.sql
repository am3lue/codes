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