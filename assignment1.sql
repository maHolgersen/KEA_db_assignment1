DROP DATABASE IF EXISTS University;
CREATE DATABASE University;
USE University;
SET FOREIGN_KEY_CHECKS=0;


CREATE TABLE College (
    college_name VARCHAR(50) NOT NULL UNIQUE,
    college_office INT,
    college_phone INT(8)
);
    
CREATE TABLE Academic_Department (
    department_name VARCHAR(50) NOT NULL UNIQUE,
    code_number INT NOT NULL UNIQUE,
    department_office INT,
    department_phone INT(8)
);
    
CREATE TABLE Courses (
    course_name VARCHAR(50) NOT NULL UNIQUE,
    code_number INT NOT NULL UNIQUE,
    course_level INT,
    credit_hours INT,
    description VARCHAR(255)
);
    
CREATE TABLE Instructor (
    instructor_ID INT NOT NULL UNIQUE,
    instructor_name VARCHAR(50),
    instructor_office INT,
    instructor_phone INT(8),
    instructor_rank INT
);
    
CREATE TABLE student (
    f_name VARCHAR(25),
    l_name VARCHAR(25),
    student_ID INT NOT NULL UNIQUE,
    student_address VARCHAR(50),
    student_phone INT,
    major_code INT,
    date_of_birth DATE
);
    
CREATE TABLE Course_Section (
    section_ID INT NOT NULL UNIQUE,
    section_number INT,
    semester VARCHAR(25),
    section_year YEAR,
    day_time DATETIME
);
    
    
    
SET FOREIGN_KEY_CHECKS=1;
    
    
    
    
    
    
    
    
    