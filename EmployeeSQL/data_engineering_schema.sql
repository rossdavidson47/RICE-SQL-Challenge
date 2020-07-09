-- Data Engineering for Pewlett Hackard
-- Create tables for each of the CSV files, using the ERD diagram.
-- delete tables if already existing
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;

--Create tables and columns
CREATE TABLE titles  (
	title_id VARCHAR(30) PRIMARY KEY,
	title VARCHAR(30)); 
  
CREATE TABLE employees   (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(30),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date DATE,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(30),
	hire_date DATE); 

CREATE TABLE departments ( 
	dept_no VARCHAR(30)PRIMARY KEY,
	dept_name VARCHAR(30));
  
CREATE TABLE dept_emp  (
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(30),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no));
  
CREATE TABLE dept_manager  (
	dept_no VARCHAR(30),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no));
  
CREATE TABLE salaries (
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT);
	
-- Lets see what they look like
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;

-- Used for data check
select count(*) from titles;
select count(*) from employees;
select count(*) from departments;
select count(*) from dept_emp;
select count(*) from dept_manager;
select count(*) from salaries;


