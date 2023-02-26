--DATA ENGINEERING


-- Drop Tables if already exist in the database
DROP TABLE IF EXISTS Salaries;
DROP TABLE IF EXISTS Dept_Employees;
DROP TABLE IF EXISTS Dept_Managers;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Titles;


-- Change 'date' format to MDY for the database I am using: 'employees_db'
-- The CSV named 'employees' has dates in MM-DD-YYYY format
-- PostgreSQL defaults to YYYY-MM-DD so altering this setting
ALTER DATABASE employees_db SET datestyle TO "ISO, MDY";
	
-- Create all tables
-- Create a table of titles
CREATE TABLE Titles(
	title_id VARCHAR(10) NOT NULL,
	title_name VARCHAR(30) NOT NULL,
	UNIQUE (title_id, title_name),
	PRIMARY KEY (title_id)
);

-- Create a table of employees
CREATE TABLE Employees(
	employee_no INTEGER NOT NULL,
	employee_title_id VARCHAR(10) NOT NULL,
	FOREIGN KEY (employee_title_id) REFERENCES Titles(title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender VARCHAR(10) NOT NULL,
	hire_date DATE NOT NULL,
	UNIQUE (employee_no),
	PRIMARY KEY (employee_no)
);

-- Create a table of departments
CREATE TABLE Departments(
	dept_no VARCHAR(10) NOT NULL,
	dept_name VARCHAR(50) NOT NULL,
	UNIQUE (dept_no),
	PRIMARY KEY (dept_no)
);

-- Create a table of department employees
CREATE TABLE Dept_Employees(
	employee_no INTEGER NOT NULL,
	FOREIGN KEY (employee_no) REFERENCES Employees(employee_no),
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	PRIMARY KEY (employee_no, dept_no)
);

-- Create a table of department managers
CREATE TABLE Dept_Managers(
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	employee_no INTEGER NOT NULL,
	FOREIGN KEY (employee_no) REFERENCES Employees(employee_no),
	PRIMARY KEY (dept_no, employee_no)
);

-- Create a table of salaries
CREATE TABLE Salaries(
	employee_no INTEGER NOT NULL,
	FOREIGN KEY (employee_no) REFERENCES Employees(employee_no),
	salary INTEGER NOT NULL,
	UNIQUE (employee_no),
	PRIMARY KEY (employee_no)
);


-- Import each CSV file into its corresponding SQL table
-- Display each table to confirm data is imported properly
SELECT * FROM Titles;
SELECT * FROM Employees;
SELECT * FROM Departments;
SELECT * FROM Dept_Employees;
SELECT * FROM Dept_Managers;
SELECT * FROM Salaries;