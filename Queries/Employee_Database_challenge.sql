SELECT employees.emp_no, employees.first_name, employees.last_name, titles.title, titles.from_date, titles.to_date
INTO retirement_titles
FROM employees
LEFT JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT * FROM retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO current_retirements_by_title
FROM retirement_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no ASC, from_date DESC;

SELECT * FROM current_retirements_by_title

SELECT COUNT(emp_no) AS Retirees, title
INTO retiring_titles
FROM current_retirements_by_title
GROUP BY title
ORDER BY Retirees DESC;

SELECT * FROM retiring_titles

SELECT DISTINCT ON (emp_no) emp.emp_no, emp.first_name, emp.last_name, emp.birth_date, dept_emp.from_date, dept_emp.to_date, titles.title
INTO mentorship_eligibility
FROM employees AS emp
LEFT JOIN dept_emp
ON emp.emp_no = dept_emp.emp_no
LEFT JOIN titles
ON emp.emp_no = titles.emp_no
WHERE (dept_emp.to_date = '9999-01-01') AND (emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp.emp_no;

SELECT * FROM mentorship_eligibility