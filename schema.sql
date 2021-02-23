--SCHEMA for creating tables 
--table for department_managers
CREATE TABLE department_manangers(
department_number VARCHAR(20) NOT NULL,
employee_number INT NOT NULL
);

--table for department
CREATE TABLE department(
departement_number VARCHAR(30) NOT NULL,
department_name VARCHAR(50) NOT NULL
);

--table for titles
CREATE TABLE titles(
title_id VARCHAR(20),
title VARCHAR(30) NOT NULL
);

--table for salaries
CREATE TABLE salaries(
employee_number INT NOT NULL,
salary INT NOT NULL
);

--table for all employee data
CREATE TABLE employee_data(
CONSTRAINT "pk" PRIMARY KEY (
	employee_number),
employee_number INT NOT NULL,
employee_title_id VARCHAR(30),
birthdate DATE,
first_name VARCHAR(40) NOT NULL,
last_name VARCHAR(70) NOT NULL,
sex VARCHAR(10) NOT NULL,
hire_date DATE NOT NULL
);


--table for employees and their departments
CREATE TABLE employee_department(
employee_number INT NOT NULL,
department_number VARCHAR(20));