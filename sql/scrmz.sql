create database CAP280
use CAP280
create table Employee(EmpID int, Name varchar(50), department varchar(30), salary decimal(10,2), city varchar(40))
select *from  Employee
insert into Employee
values 
(1, 'Alice', 'HR', 60000, 'Delhi'),
(2, 'Bob', 'Finance', 75000,'Mumbai'),
(3, 'Charlie', 'IT', 50000, 'Bangalore'),
(4, 'David', 'Finance', 72000, 'Delhi'),
(5, 'Emma', 'HR', 65000, 'Chennnai');

insert into Employee values (7, 'Kartik', 'Finance', NULL, 'Mumbai')

--INCREASE ALICE'S SALARY
update Employee 
set salary=62000
where Name='Alice';

--Change David department to Admin and his city to PUNE
update Employee
set department='Admin',
    city='Pune'
	where Name='David';

--increase salary of all employees in finance department by 10%.
update Employee
set salary=salary*1.10
where department='Finance';

/*update employees city:
if department ='HR' to city='hyderbad'
if department= 'IT' to city='Pune'*/
update Employee
set city= case
          when department='HR' then 'Hyderbad'
		  when department='IT' then 'Pune'
		  else city
		  end;

--if salary is NULL set it to 50000
update Employee
set salary=50000
where salary is NULL;

delete from Employee
where department='HR';

delete from Employee
where salary>72000;


