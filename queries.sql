-- QUERIES

-- 1. List the employee number, last name, first name, sex, and salary of each employee

SELECT 
	em.emp_no, 
	em.last_name, 
	em.first_name, 
	em.sex, 
	salary.salary
FROM Employees em INNER JOIN salaries salary ON em.emp_no = salary.emp_no;
	
-- 2. List the first name, last name, and hire date for the employees who were hired in 1986
SELECT
	hd.first_name,
	hd.last_name,
	hd.hire_date
	
FROM Employees hd WHERE hd.hire_date like '%1986%';
-- 3.List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT
	dm.depto_no,
	dep.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name
FROM Depto_manager dm 
	JOIN Employees e ON dm.emp_no = e.emp_no
	FULL OUTER JOIN Department dep ON dm.depto_no = dep.depto_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name

SELECT
	em.depto_no,
	e.emp_no,
	e.first_name,
	e.last_name,
	dep.dept_name
FROM Depto_emp em 
	JOIN Employees e ON em.emp = e.emp_no
	JOIN Department dep ON em.depto_no = dep.depto_no;
	
-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT
	hd.first_name,
	hd.last_name,
	hd.sex
	
FROM Employees hd WHERE hd.first_name like '%Hercules%' AND hd.last_name LIKE '%B%';

--6. List each employee in the Sales department, including their employee number, last name, and first name
SELECT
	d.dept_name,
	e.emp_no,
	e.last_name,
	e.first_name
FROM Employees e
	JOIN Depto_emp de ON de.emp = e.emp_no
	JOIN Department d ON d.depto_no = de.depto_no WHERE d.dept_name = 'Sales'; 
	
-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	d.dept_name,
	e.emp_no,
	e.last_name,
	e.first_name
FROM Employees e
	JOIN Depto_emp de ON de.emp = e.emp_no
	JOIN Department d ON d.depto_no = de.depto_no WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
	ORDER BY d.dept_name DESC; 
	
-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT 
	e.last_name,
	COUNT(e.last_name) AS "shared last name"
FROM Employees e
	GROUP BY e.last_name
	ORDER BY "shared last name" DESC;
