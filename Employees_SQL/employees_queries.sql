-- DATA ANALYSIS


-- Question 1
-- List the employee number, last name, first name, sex, and salary of each employee.
-- Note: Data is sorted by employee number for better review.
SELECT e.employee_no, e.last_name, e.first_name, e.gender, s.salary
	FROM Employees as e
INNER JOIN Salaries as s
	ON e.employee_no = s.employee_no
ORDER BY e.employee_no;


-- Question 2
-- List the first name, last name, and hire date for the employees who were hired in 1986.
-- Note: Data is sorted by hire date for better review.
SELECT first_name, last_name, hire_date
	FROM Employees
WHERE 
	hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date ASC;


-- Question 3
-- List the manager of each department along with their department number, 
-- department name, employee number, last name, and first name.
SELECT d.dept_no, d.dept_name, dm.employee_no, e.last_name, e.first_name
	FROM Departments as d
INNER JOIN Dept_Managers as dm
	ON d.dept_no = dm.dept_no
INNER JOIN Employees as e
	ON dm.employee_no = e.employee_no;


-- Question 4
-- List the department number for each employee along with that employee’s 
-- employee number, last name, first name, and department name.
SELECT de.dept_no, de.employee_no, e.last_name, e.first_name, d.dept_name
	FROM Dept_Employees as de
INNER JOIN Employees as e
	ON de.employee_no = e.employee_no
INNER JOIN Departments as d
	ON de.dept_no = d.dept_no;


-- Question 5
-- List first name, last name, and sex of each employee whose first name is Hercules 
-- and whose last name begins with the letter B.
SELECT first_name, last_name, gender
FROM Employees
WHERE
	first_name = 'Hercules'
	AND last_name LIKE 'B%';


-- Question 6
-- List each employee in the Sales department, including their employee number, 
-- last name, and first name.
SELECT e.employee_no, e.last_name, e.first_name, d.dept_name
FROM Employees as e
INNER JOIN Dept_Employees as de
	ON e.employee_no = de.employee_no
INNER JOIN Departments as d
	ON de.dept_no = d.dept_no
	WHERE 
		d.dept_name = 'Sales';


-- Question 7
-- List each employee in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.
SELECT e.employee_no, e.last_name, e.first_name, d.dept_name
FROM Employees as e
INNER JOIN Dept_Employees as de
	ON e.employee_no = de.employee_no
INNER JOIN Departments as d
	ON de.dept_no = d.dept_no
	WHERE 
		d.dept_name = 'Sales'
		OR d.dept_name = 'Development';


-- Question 8
-- List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "Last Name Counts"
	FROM Employees
GROUP BY last_name
ORDER BY "Last Name Counts" DESC;

--------------------------------------------------------------------------------------