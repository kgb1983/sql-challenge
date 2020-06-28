-- List the following details of each employee: employee number, last name, first name, sex and salary
-- Will need Employees table and Salary tables

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON (e.emp_no = s.emp_no)

-- List first name, last name and hire date for employees hired in 1986

SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date between '1986-01-01' and '1986-12-31'

-- List manager of each department with the following information: department number, department name, manager's employee number, last name, first name
-- Will need dept_manager table, department table, employees table

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
LEFT JOIN departments
ON dept_manager.dept_no = departments.dept_no
LEFT JOIN employees
ON dept_manager.emp_no = employees.emp_no

-- List the department of each employee with the following information: employee number, 
-- last name, first name, and department name. Will need dept_emp, department, and employee
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp
ON dept_emp.emp_no = employees.emp_no
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no


-- List first name, last name, and sex for employees whose first name is Hercules and last name begins with B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

-- List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp
ON dept_emp.emp_no = employees.emp_no
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'
-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp
ON dept_emp.emp_no = employees.emp_no
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'
UNION
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp
ON dept_emp.emp_no = employees.emp_no
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Development'

-- In descending order, list the frequency count of employee last names
SELECT last_name, COUNT(last_name) AS "name count"
FROM employees
GROUP BY last_name
ORDER BY "name count" DESC;

