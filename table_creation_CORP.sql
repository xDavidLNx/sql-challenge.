DROP TABLE Department;
DROP TABLE Title;
DROP TABLE Employees;
DROP TABLE Salaries;
DROP TABLE Depto_manager;
DROP TABLE Depto_emp;


CREATE TABLE Department (
	depto_no VARCHAR(4) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(200) NOT NULL);
	
SELECT * FROM Department;
	
CREATE TABLE Title (
	title_id VARCHAR(6) PRIMARY KEY NOT NULL,
	title VARCHAR(100));
SELECT * FROM Title;

CREATE TABLE Employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(100) NOT NULL,
	birth_date VARCHAR(10),
	first_name VARCHAR(200) NOT NULL,
	last_name VARCHAR(200) NOT NULL,
	sex CHAR(1) NOT NULL,
	hire_date VARCHAR(10),
	FOREIGN KEY(emp_title_id) REFERENCES Title(title_id));
SELECT * FROM Employees;

CREATE TABLE Salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES Employees(emp_no));
SELECT * FROM Salaries;

CREATE TABLE Depto_manager (
	depto_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY(depto_no) REFERENCES Department(depto_no),
	FOREIGN KEY(emp_no) REFERENCES Employees(emp_no));
SELECT * FROM Depto_manager;

CREATE TABLE Depto_emp (
	emp INT NOT NULL,
	depto_no VARCHAR(4) NOT NULL,
	FOREIGN KEY(depto_no) REFERENCES Department(depto_no),
	FOREIGN KEY(emp) REFERENCES Employees(emp_no));

SELECT * FROM Depto_emp;
