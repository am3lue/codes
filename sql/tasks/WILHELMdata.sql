    create database student
      
       use student

      create table students (StudentID int primary key,fistname varchar(50) not null,LastName Varchar(50),Emai Varchar(100) UNIQUE); 

      create table courses(CourseID int primary key,CourseName varchar(100), Credits int check(Credits between 1 and 5));

      
CREATE TABLE Enrollments (
    EnrollmentDate DATE DEFAULT GETDATE() NOT NULL, -- Default current date with current month
    StudentId INT FOREIGN KEY REFERENCES Students(StudentId) ON DELETE CASCADE,
    CourseId INT FOREIGN KEY REFERENCES Courses(CourseID) ON DELETE CASCADE,
    PRIMARY KEY (EnrollmentDate),
    FOREIGN KEY (StudentId) REFERENCES Students(StudentId)
);

alter table courses drop constraint Course_credit_check;

alter table courses add constraint  unique_course unique (CourseName,Credits);
select * from  student