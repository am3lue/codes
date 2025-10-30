CREATE DATABASE company

USE company

CREATE TABLE Dept (Did INT PRIMARY KEY,Dname VARCHAR (255));

CREATE TABLE Emp (eid INT PRIMARY KEY,
                    ename VARCHAR (255),
                    age VARCHAR (255),
                    city VARCHAR (255),
                    email  VARCHAR (255),
                    deptid INT,
                    salary INT);

INSERT INTO Dept (Did,Dname) VALUES 
                                (1,'CSE'),
                                (2,'SCA'),
                                (3,'ECE')

INSERT INTO emp (eid) VALUES
                            (1,NULL),
                            (25,'Delhi'),
                            (abc@gmail.com),
                            (101,'2025-09-10'),
                            (25000)

INSERT INTO 
                             
