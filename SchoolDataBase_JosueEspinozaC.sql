Create Database SchoolDatabase__JosueEspinozaC;
Go

USE SchoolDatabase__JosueEspinozaC;
GO

CREATE TABLE SCHOOL (
    SchoolId INT PRIMARY KEY,
    SchoolName VARCHAR(50) NOT NULL,
    Descriptions VARCHAR(1000),
    Addresss VARCHAR(50),
    Phone VARCHAR(50),
    PostCode VARCHAR(50),
    PostAddress VARCHAR(50)
);
GO

CREATE TABLE COURSE (
    CourseId INT PRIMARY KEY,
    CourseName VARCHAR(50) NOT NULL,
    SchoolId INT FOREIGN KEY REFERENCES SCHOOL(SchoolId),
    Descriptions VARCHAR(1000)
);
GO

CREATE TABLE CLASS (
    ClassId INT PRIMARY KEY,
    SchoolId INT FOREIGN KEY REFERENCES SCHOOL(SchoolId),
    ClassName VARCHAR(50) NOT NULL,
    Descriptions VARCHAR(1000)
);
GO

CREATE TABLE TEACHER (
    TeacherId INT PRIMARY KEY,
    SchoolId INT FOREIGN KEY REFERENCES SCHOOL(SchoolId),
    TeacherName VARCHAR(50) NOT NULL,
    Descriptions VARCHAR(1000)
);
GO

CREATE TABLE STUDENT (
    StudentId INT PRIMARY KEY,
    ClassId INT FOREIGN KEY REFERENCES CLASS(ClassId),
    StudentName VARCHAR(100) NOT NULL,
    StudentNumber VARCHAR(20),
    TotalGrade FLOAT,
    Addresss VARCHAR(100),
    Phone VARCHAR(20),
    EMail VARCHAR(100)
);
GO

CREATE TABLE STUDENT_COURSE (
    StudentId INT FOREIGN KEY REFERENCES STUDENT(StudentId),
    CourseId INT FOREIGN KEY REFERENCES COURSE(CourseId),
);
GO

CREATE TABLE TEACHER_COURSE (
    TeacherId INT FOREIGN KEY REFERENCES TEACHER(TeacherId),
    CourseId INT FOREIGN KEY REFERENCES COURSE(CourseId),
);
GO

CREATE TABLE GRADE (
    GradeId INT PRIMARY KEY,
    StudentId INT FOREIGN KEY REFERENCES STUDENT(StudentId),
    CourseId INT FOREIGN KEY REFERENCES COURSE(CourseId),
    Grade FLOAT,
    Comment VARCHAR(1000)
);
GO