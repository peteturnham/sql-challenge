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


--table for employess and their departments
CREATE TABLE employee_department(
employee_number INT NOT NULL,
department_number VARCHAR(20));


-------------------------------------
--Data Analysis
-------------------------------------
-- Query Schema: 
--1. List the following details of each employee: 
--employee number, last name, first name, sex, and salary.

SELECT e.employee_number, 
e.last_name, 
e.first_name,
e.sex, s.salary
FROM employee_data e
JOIN salaries s
ON(e.employee_number=s.employee_number);

--Query Schema for Question 2: 
--2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT e.first_name, 
e.last_name, 
e.hire_date
FROM employee_data e
WHERE hire_date >= '1986-01-01'
AND hire_date <='1986-12-31';

--Query Schema for question 3:
--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

SELECT 
e.first_name, 
e.last_name, 
e.employee_number, 
dm.employee_number, 
dm.department_number, 
department.department_name
FROM employee_data e
	INNER JOIN department_manangers dm ON e.employee_number=dm.employee_number
	INNER JOIN department ON dm.department_number= department.departement_number;


--query schemafor question 4:
--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT e.employee_number,
e.first_name,
e.last_name,
d.department_name
FROM employee_data e
INNER JOIN employee_department ed ON e.employee_number=ed.employee_number
INNER JOIN department d ON ed.department_number=d.departement_number;

--Query for question 5:
--List first name, last name, and sex for employees 
--whose first name is "Hercules" and last names begin with "B."

SELECT e.first_name,
e.last_name,
e.sex
FROM employee_data e
WHERE first_name='Hercules'
AND last_name LIKE 'B%';

--Query for Question 6:
--List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.
SELECT e.last_name,
e.first_name,
ed.employee_number,
d.department_name
FROM employee_data e
INNER JOIN employee_department ed ON e.employee_number=ed.employee_number
INNER JOIN department d ON ed.department_number=d.departement_number
WHERE department_name='Sales';

--Query for Question 7:
--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT e.last_name,
e.first_name,
ed.employee_number,
d.department_name
FROM employee_data e
INNER JOIN employee_department ed ON e.employee_number=ed.employee_number
INNER JOIN department d ON ed.department_number=d.departement_number
WHERE department_name='Sales' OR department_name= 'Development';

--Query for Question 8:
--In descending order, list the frequency count of 
--employee last names, i.e., how many employees share each last name.

SELECT COUNT(e.last_name), e.last_name AS "Last Name"
FROM employee_data e
GROUP BY e.last_name
ORDER BY e.last_name DESC;




