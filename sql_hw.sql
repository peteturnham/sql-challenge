-- table for departments
CREATE TABLE departments (
depo_no VARCHAR(20),
dept_name VARCHAR(30)
	
);
--displaying data from table
SELECT * FROM departments;

--table for department and employee
CREATE TABLE department_employee(
employee_number INT,
department_number VARCHAR(10)
);
--displaying data from department_employee
SELECT * FROM department_employee;

-- table for department managers
CREATE TABLE deparment_managers(
department_number VARCHAR(10),
employee_number INT
);
--displaying data from deparment_managers
SELECT * FROM deparment_managers;

--Table for employee data
CREATE TABLE employee_data(
employee_number INT,
employee_title_id VARCHAR(10),
birth_date DATE,
first_name VARCHAR(30),
last_name VARCHAR(30),
sex VARCHAR(10),
hire_date DATE
);
--displaying data from employee_data
SELECT * FROM employee_data;

--table for salaries
CREATE TABLE salaries(
employee_number INT,
salary INT
);
--displaying data from salaries
SELECT * FROM salaries;

-- Table for staff titles
CREATE TABLE staff_title(
title_id VARCHAR(10),
title VARCHAR(30)
);
--displaying data from staff_titles
SELECT * FROM staff_title;


--joining databases employee data and salaries and displaying query info
SELECT employee_data.employee_number, employee_data.last_name, employee_data.first_name, employee_data.sex, salaries.salary
FROM employee_data
INNER JOIN salaries ON
employee_data.employee_number=salaries.employee_number;

-- query for employees hired in 1986
SELECT first_name, last_name, hire_date FROM employee_data
WHERE hire_date IN (1986);

SELECT * FROM deparment_managers;

--query for department of employee with name and department name
SELECT employee_data.employee_number, employee_data.last_name, employee_data.first_name, 
deparment_managers.employee_number, deparment_managers.department_number
FROM employee_data
RIGHT JOIN deparment_managers ON
employee_data.employee_number=deparment_managers.employee_number;

