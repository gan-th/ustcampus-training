CREATE DATABASE company_db;

USE company_db;

CREATE TABLE employees(
	emp_id INT PRIMARY KEY,
	name VARCHAR(50),
	department VARCHAR(50),
	salary DECIMAL(10,2),
	hire_date DATE);


INSERT INTO employees VALUES (1, 'ABC','HR',1000,'10-07-2022');

SELECT * FROM employees;

INSERT INTO employees VALUES(2, 'XYZ','DATA',1200, '02-20-2022');
INSERT INTO employees VALUES(3,'DEF','DevOps',1300,'02-12-2022');

SELECT CURRENT_TIMESTAMP;
SELECT UPPER(name) FROM employees;
SELECT LOWER(Name) FROM employees;
SELECT LEN(name) FROM employees;
SELECT COUNT(*) FROM employees;
SELECT AVG(salary) FROM employees;
SELECT SUM(salary) FROM emplOYEES;


CREATE TABLE departments(
department_id INT PRIMARY KEY,
department_name VARCHAR(50));

INSERT INTO departments VALUES
(1, 'HR'),(2,'DATA'),(3,'DevOps');

INSERT INTO departments VALUES(4,'Java');

SELECT * FROM departments;

UPDATE Employees
SET Department = CASE 
    WHEN Department = 'HR'     THEN 1
    WHEN Department = 'DevOps' THEN 3
    WHEN Department = 'Data'   THEN 2
    ELSE Department -- Keeps the original value if it doesn't match these three
END
WHERE Department IN ('HR', 'DevOps', 'DATA');

SELECT * FROM employees;
SELECT * FROM departments;

SELECT e.name, d.department_name FROM employees e INNER JOIN departments d ON e.department = d.department_id;
SELECT e.name, d.department_name FROM employees e LEFT JOIN departments d ON e.department=d.department_id;

INSERT INTO employees Values (4,'Anvesh',2,3000,'02-12-2026'),
(5,'Chandru',2,3000,'02-12-2026'),
(6,'Vinay',3, 2800,'02-12-2026');

SELECT * FROM employees group by department;

SELECT 
    Department,SUM(Salary) AS DepartmentPayroll, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY Department;

SELECT department, COUNT(*) FROM employees group by department;

SELECT ROUND(avg(salary),2) from employees;

SELECT max(salary), min(salary) from employees;


CREATE VIEW high_salary_employees AS
SELECT name, salary FROM employees WHERE salary>2000;
SELECT * FROM high_salary_employees;


SELECT name, salary FROM employees WHERE salary> (SELECT AVG(salary) FROM employees);

--SELECT name, salary, department from employees ORDER BY name DESC LIMIT 2;   only works with MySQL
SELECT TOP 2 name, salary, department FROM employees ORDER BY name DESC;

