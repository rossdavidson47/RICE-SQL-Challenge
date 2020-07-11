-- Data Analysis for Pewlett Hackard
-- 1.	List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;
-- 2.	List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date FROM employees WHERE hire_date > '12/31/1985' AND hire_date < '01/01/1987';
-- 3.	List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
LEFT JOIN departments
ON departments.dept_no = dept_manager.dept_no
LEFT JOIN employees
ON employees.emp_no = dept_manager.emp_no;
-- 4.	List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_emp.emp_no,  employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
LEFT JOIN employees
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no;
-- 5.	List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name, employees.sex 
FROM employees WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%';
-- 6.	List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no,  employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp 
LEFT JOIN employees
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales';
-- 7.	List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp 
LEFT JOIN employees
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';
-- 8.	In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT employees.last_name, count(employees.last_name) as Frequency
FROM employees
GROUP BY employees.last_name
ORDER BY Frequency DESC;

--BONUS
-- Create a bar chart of average salary by title.
SELECT titles.title, employees.emp_no, salaries.salary
FROM employees
LEFT JOIN titles
ON employees.emp_title_id = titles.title_id
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no;
