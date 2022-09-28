-- Deliverable 1
SELECT e.emp_no, 
	first_name, 
	last_name, 
	title, 
	from_date, 
	to_date
INTO retirement_titles
FROM employees AS e
JOIN titles AS t ON e.emp_no = t.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- Employee count per title
SELECT COUNT(title), 
	title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;



-- Deliverable 2
-- Mentorship Eligibility table
SELECT DISTINCT ON (emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibilty
FROM employees AS e
JOIN dept_emp AS de on e.emp_no = de.emp_no
JOIN titles AS t ON t.emp_no = e.emp_no
WHERE de.to_date = '9999-01-01' AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY emp_no, title ASC;

-- Count of Eligible Employees
SELECT COUNT(emp_no) FROM mentorship_eligibilty;