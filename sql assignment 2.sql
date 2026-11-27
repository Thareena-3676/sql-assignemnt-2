CREATE DATABASE Employees;

USE Employees;
SHOW TABLES;
DESC employees;
DESC Departments_Info;
DESC Locations;
INSERT INTO Departments_Info
(department_id, department_name)
VALUES
(1, 'Software Development'),
(2, 'Marketing'),
(3, 'Data Science');
INSERT INTO Locations
(location_id, location_name)
VALUES
(1, 'Kochi'),
(2, 'Calicut'),
(3, 'Bangalore');
INSERT INTO employees
(employee_id, employee_name, gender, date_of_joining,
designation, department_id, location_id, salary, email)
VALUES
(1, 'Employee Name', 'Male', '2018-01-10',
'Data Analyst', 1, 1, 55000, 'employee1@gmail.com');
SELECT * FROM employees;
SELECT * FROM Departments_Info;
SELECT * FROM Locations;
SELECT DISTINCT salary
FROM employees;
SELECT age AS Employee_Age,
salary AS Employee_Salary
FROM employees;
SELECT *
FROM employees
WHERE salary > 50000
AND date_of_joining < '2016-01-01';
SELECT *
FROM employees
WHERE designation IS NULL;
UPDATE employees
SET designation = 'Data Scientist'
WHERE designation IS NULL;
SELECT *
FROM employees
ORDER BY department_id ASC, salary DESC;
SELECT *
FROM employees
WHERE YEAR(date_of_joining) = 2018
LIMIT 5;
SELECT SUM(e.salary)
FROM employees e
JOIN Departments_Info d
ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';
SELECT MIN(age)
FROM employees;
SELECT location_id, MAX(salary)
FROM employees
GROUP BY location_id;
SELECT designation, AVG(salary)
FROM employees
WHERE designation LIKE '%Analyst%'
GROUP BY designation;
SELECT department_id, COUNT(employee_id)
FROM employees
GROUP BY department_id
HAVING COUNT(employee_id) < 3;
SELECT location_id, AVG(age)
FROM employees
WHERE gender = 'Female'
GROUP BY location_id
HAVING AVG(age) < 30;
SELECT e.employee_name, e.designation,
d.department_name
FROM employees e
INNER JOIN Departments_Info d
ON e.department_id = d.department_id;
SELECT d.department_name,
COUNT(e.employee_id) AS Total_Employees
FROM Departments_Info d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;
SELECT l.location_name, e.employee_name
FROM employees e
RIGHT JOIN Locations l
ON e.location_id = l.location_id;