create database uni

use uni

create table students (studentID int primary key, first_name varchar(20), second_name varchar(20) , email varchar(20) unique);


create table course (CourseID int primary key, CourseName varchar(20) unique, credits varchar(20));


create table enrollment (EnrollmentID int primary key, studentID int foreign key references students(studentID), second_name varchar(20) , EnrollmentDate date default getdate());

alter table course 
alter column credits int

alter table course
add constraint ch_ck check(credits > 1 and credits < 5)

alter table Enrollment
add constraint fk_enrollstudent foreign key (studentID)
references students(studentID) on delete cascade;

alter table Enrollment
drop column second_name;

alter table Enrollment
add courseID int


alter table Enrollment
add constraint fk_enrollcourse foreign key (CourseID)
references course(CourseID) on delete cascade;
