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
CREATE TABLE department AS
SELECT employee_data.employee_number, employee_data.last_name, employee_data.first_name, deparment_managers.department_number
FROM employee_data
RIGHT JOIN deparment_managers ON
employee_data.employee_number=deparment_managers.employee_number;
--retreive data from all of department
SELECT * FROM department;

--creating table for department name
CREATE TABLE q_four AS
SELECT department.employee_number, department.last_name, department.first_name, departments.depo_no, departments.dept_name
FROM department
RIGHT JOIN departments ON
department.department_number= departments.depo_no;
SELECT * FROM q_four;

--query for employees named Hercules
SELECT employee_data.first_name, employee_data.last_name, employee_data.sex
FROM employee_data 
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%';

--query for sales department employees
SELECT q_four.employee_number, q_four.first_name, q_four.last_name, q_four.dept_name
FROM q_four
WHERE dept_name LIKE 'Sales';

--creating table with employee data and department name and number
CREATE TABLE employee_department AS
SELECT employee_data.employee_number, 
employee_data.first_name, 
employee_data.last_name,  
department_employee.department_number
FROM employee_data
INNER JOIN department_employee ON
employee_data.employee_number= department_employee.employee_number;
--display all data from employee_department
SELECT * FROM employee_department;

--table join for finding employees in Sales and Development Departments
CREATE TABLE employee_complete AS
SELECT employee_department.employee_number, 
employee_department.first_name, 
employee_department.last_name,
employee_department.department_number,
departments.dept_name
FROM employee_department
JOIN departments ON
employee_department.department_number=departments.depo_no;
--display all data in employee_complete
SELECT * FROM employee_complete;
--query for employees in sales and development
SELECT employee_complete.employee_number, 
employee_complete.last_name, 
employee_complete.first_name, 
employee_complete.dept_name
FROM employee_complete
WHERE dept_name IN ('Sales', 'Development');

--query for frequency count of last names
SELECT employee_complete.last_name, COUNT(last_name)AS Frequency
FROM employee_complete
GROUP BY last_Name
ORDER BY COUNT(last_name) DESC;