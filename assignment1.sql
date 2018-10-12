DROP DATABASE IF EXISTS University;
CREATE DATABASE University;
USE University;
SET FOREIGN_KEY_CHECKS=0;


CREATE TABLE College (
	college_ID INT NOT NULL,
    college_name VARCHAR(50) NOT NULL UNIQUE,
    college_office INT,
    college_phone INT(8),
    PRIMARY KEY (college_ID)
);
    
CREATE TABLE Academic_Department (
    department_name VARCHAR(50) NOT NULL UNIQUE,
    code_number INT NOT NULL UNIQUE,
    department_office INT,
    department_phone INT(8),
    college_ID INT,
    PRIMARY KEY (code_number),
    FOREIGN KEY (college_ID) REFERENCES College(college_ID)
);
    
CREATE TABLE Courses (
    course_name VARCHAR(50) NOT NULL UNIQUE,
    code_number INT NOT NULL UNIQUE,
    course_level INT,
    credit_hours INT,
    description VARCHAR(255),
    department_code_number INT,
    PRIMARY KEY (code_number),
    FOREIGN KEY (department_code_number) REFERENCES Academic_Department(code_number)
);
    
CREATE TABLE Instructor (
    instructor_ID INT NOT NULL UNIQUE,
    instructor_name VARCHAR(50),
    instructor_office INT,
    instructor_phone INT(8),
    instructor_rank INT,
    department_code_number INT,
    PRIMARY KEY (instructor_ID),
    FOREIGN KEY (department_code_number) REFERENCES Academic_Department(code_number)
);
    
CREATE TABLE Student (
    f_name VARCHAR(25),
    l_name VARCHAR(25),
    student_ID INT NOT NULL UNIQUE,
    student_address VARCHAR(50),
    student_phone INT,
    major_code INT,
    date_of_birth DATE,
    department_code_number INT,
    course_code_number INT,
    PRIMARY KEY (student_ID),
    FOREIGN KEY (course_code_number) REFERENCES Courses(code_number),
    FOREIGN KEY (department_code_number) REFERENCES Academic_Department(code_number)
);
    
CREATE TABLE Course_Section (
    section_ID INT NOT NULL UNIQUE,
    section_number INT,
    semester VARCHAR(25),
    section_year YEAR,
    instructor_ID INT,
    course_code_number INT,
    PRIMARY KEY (section_ID),
    FOREIGN KEY (instructor_ID) REFERENCES Instructor(instructor_ID),
    FOREIGN KEY (course_code_number) REFERENCES Courses(code_number)
);

CREATE TABLE Grade(
	grade VARCHAR (2),
    student_ID INT,
    section_ID INT,
    FOREIGN KEY (student_ID) REFERENCES Student(student_ID),
    FOREIGN KEY (section_ID) REFERENCES Course_Section(section_ID)
);

CREATE TABLE Classroom(
	department_code_number INT,
    classroom_number INT,
    section_ID INT,
    FOREIGN KEY (department_code_number) REFERENCES Academic_Department(code_number),
    FOREIGN KEY (section_ID) REFERENCES Course_Section(section_ID)
    
);
    
CREATE TABLE Class_Schedule(
	class_day CHAR(3),
    class_time INT,
    section_ID INT,
    FOREIGN KEY (section_ID) REFERENCES Course_Section(section_ID),
    CHECK (class_day = 'mon' OR 'tue' OR 'wen' OR 'tur' OR 'fri'),
    CHECK (class_time BETWEEN 0000 AND 2359)
);
    
    
SET FOREIGN_KEY_CHECKS=1;
    
    
    
    
    
    
    
    
    