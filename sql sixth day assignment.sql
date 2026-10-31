use sqlassigment;

-- Q26. Find all employees who earn more than the company average salary ;

create TABLE Employees(emp_id INT PRIMARY KEY,emp_name VARCHAR(50),job_title VARCHAR(50),manager_id INT,salary DECIMAL(10,2));
insert into employees values
(1, 'John', 'HR', 100, 25000),
(2, 'viswa', 'Mgr', 101, 38000),
(3, 'Yugan', 'Prg', 101, 45000),
(4, 'bala', 'Tl', 102,43000),
(5, 'Pandi', 'finance', 103, 35000),
(6, 'Karthiga', 'salesofficer', 104, 40000),
(7, 'Devi', 'germng', 105,80000);
 select * from employees;
 select emp_id,emp_name, salary from  Employees where salary > (select avg(salary) from Employees);
 
 -- Q27. Find employees who work in the &#39;Engineering&#39; department using a subquery (No Explicit JOIN).;
 
 CREATE TABLE Departments (dept_id INT PRIMARY KEY,dept_name VARCHAR(50),location VARCHAR(50));
INSERT INTO Departments VALUES
(10, 'HR', 'New York'),
(20, 'Engineering', 'San Francisco'),
(30, 'Marketing', 'London'),
(40, 'Sales', 'Chicago'),
(50, 'Legal', 'Toronto');

CREATE TABLE Empl (emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
job_title VARCHAR(50),
manager_id INT,
hire_date DATE,
salary DECIMAL(10,2),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES Departments(dept_id));
INSERT INTO Empl values
(101, 'Alice Smith', 'HR Manager', NULL, '2020-01-15', 95000.00, 10),
(102, 'Bob Jones', 'Software Engineer', 105, '2021-03-22', 105000.00, 20),
(103, 'Charlie Brown','qa Engineer', 105, '2022-06-01', 70000.00, 20),
(104, 'David Miller', 'Marketing Specialist', 106, '2023-02-10', 65000.00, 30),
(105, 'Emma Davis', 'Engineering Director', NULL, '2019-05-12', 150000.00, 20),
(106, 'Frank Wilson', 'Marketing Director', NULL, '2018-11-20', 140000.00, 30),
(107, 'Grace Lee', 'Sales Rep', 108, '2024-01-05', 55000.00, 40),
(108, 'Henry Clark', 'Sales Manager', NULL, '2017-03-15', 115000.00, 40),
(109, 'Ivy Taylor', 'Software Engineer', 105, '2025-08-19', 98000.00, 20);

select * from empl where dept_id = (select dept_id from departments where dept_name = 'Engineer');

-- 28. Find the names of employees who are working on at least one project.
CREATE TABLE Emp (emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
job_title VARCHAR(50),
manager_id INT,
hire_date DATE,
salary DECIMAL(10,2),
dept_id INT);
INSERT INTO Emp values
(101, 'Alice Smith', 'HR Manager', NULL, '2020-01-15', 95000.00, 10),
(102, 'Bob Jones', 'Software Engineer', 105, '2021-03-22', 105000.00, 20),
(103, 'Charlie Brown','qa Engineer', 105, '2022-06-01', 70000.00, 20),
(104, 'David Miller', 'Marketing Specialist', 106, '2023-02-10', 65000.00, 30),
(105, 'Emma Davis', 'Engineering Director', NULL, '2019-05-12', 150000.00, 20),
(106, 'Frank Wilson', 'Marketing Director', NULL, '2018-11-20', 140000.00, 30),
(107, 'Grace Lee', 'Sales Rep', 108, '2024-01-05', 55000.00, 40),
(108, 'Henry Clark', 'Sales Manager', NULL, '2017-03-15', 115000.00, 40),
(109, 'Ivy Taylor', 'Software Engineer', 105, '2025-08-19', 98000.00, 20);

CREATE TABLE Employee_Projects (
    emp_id INT,
    project_id INT,
    hours_worked INT,
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id) REFERENCES Emp(emp_id)
);

INSERT INTO Employee_Projects VALUES
(102, 501, 120),
(102, 502, 80),
(103, 501, 150),
(104, 503, 200),
(105, 501, 40),
(107, 504, 180),
(108, 504, 50),
(109, 502, 100);
select emp_name from emp where emp_id in ( select emp_id from Employee_Projects);

--  Find the names of employees who are NOT working on any project.
CREATE TABLE Employee_Project (
    emp_id INT,
    project_id INT,
    hours_worked INT,
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id) REFERENCES Emp(emp_id)
);

INSERT INTO Employee_Project VALUES
(102, 501, 120),
(102, 502, 80),
(103, 501, 150),
(104, 503, 200),
(105, 501, 40),
(107, 504, 180),
(108, 504, 50),
(109, 502, 100);

CREATE TABLE Employees1 (emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
job_title VARCHAR(50),
manager_id INT,
hire_date DATE,
salary DECIMAL(10,2),
dept_id INT);

INSERT INTO Employees1 values
(101, 'Alice Smith', 'HR Manager', NULL, '2020-01-15', 95000.00, 10),
(102, 'Bob Jones', 'Software Engineer', 105, '2021-03-22', 105000.00, 20),
(103, 'Charlie Brown','qa Engineer', 105, '2022-06-01', 70000.00, 20),
(104, 'David Miller', 'Marketing Specialist', 106, '2023-02-10', 65000.00, 30),
(105, 'Emma Davis', 'Engineering Director', NULL, '2019-05-12', 150000.00, 20),
(106, 'Frank Wilson', 'Marketing Director', NULL, '2018-11-20', 140000.00, 30),
(107, 'Grace Lee', 'Sales Rep', 108, '2024-01-05', 55000.00, 40),
(108, 'Henry Clark', 'Sales Manager', NULL, '2017-03-15', 115000.00, 40),
(109, 'Ivy Taylor', 'Software Engineer', 105, '2025-08-19', 98000.00, 20);

select emp_name from Employees1 where emp_id not in (select emp_id from Employee_Project);

-- Q30. Find the project with the highest budget.
CREATE TABLE Projects (project_id INT PRIMARY KEY,
project_name VARCHAR(50),
budget DECIMAL(12,2),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);
INSERT INTO Projects VALUES
(501, 'Apollo Project', 250000.00, 20),
(502, 'Zeus Initiative', 120000.00, 20),
(503, 'Global Branding', 85000.00, 30),
(504, 'CRM Migration', 150000.00, 40),
(505, 'Talent Acquisition', 30000.00, 10);
select  * from Projects where budget  = (select max(budget) from Projects);

-- Q31. Find departments that have a higher-than-average project budget allocation.

 CREATE TABLE Department (dept_id INT PRIMARY KEY,dept_name VARCHAR(50),location VARCHAR(50));
INSERT INTO Department VALUES
(10, 'HR', 'New York'),
(20, 'Engineering', 'San Francisco'),
(30, 'Marketing', 'London'),
(40, 'Sales', 'Chicago'),
(50, 'Legal', 'Toronto');
CREATE TABLE Project (project_id INT PRIMARY KEY,
project_name VARCHAR(50),
budget DECIMAL(12,2),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);
INSERT INTO Project VALUES
(501, 'Apollo Project', 250000.00, 20),
(502, 'Zeus Initiative', 120000.00, 20),
(503, 'Global Branding', 85000.00, 30),
(504, 'CRM Migration', 150000.00, 40),
(505, 'Talent Acquisition', 30000.00, 10);

SELECT d.dept_id, d.dept_name
FROM Departments d
WHERE d.dept_id IN (SELECT p.dept_id FROM Projects p GROUP BY p.dept_id HAVING AVG(p.budget) > (SELECT AVG(budget) FROM Projects));

-- Q32. Find employees who earn more than the maximum salary of the Marketing department.
CREATE TABLE Department (dept_id INT PRIMARY KEY,dept_name VARCHAR(50),location VARCHAR(50));
INSERT INTO Department VALUES
(10, 'HR', 'New York'),
(20, 'Engineering', 'San Francisco'),
(30, 'Marketing', 'London'),
(40, 'Sales', 'Chicago'),
(50, 'Legal', 'Toronto');


CREATE TABLE Employees (emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
job_title VARCHAR(50),
manager_id INT,
hire_date DATE,
salary DECIMAL(10,2),
dept_id INT);

INSERT INTO Employees values
(101, 'Alice Smith', 'HR Manager', NULL, '2020-01-15', 95000.00, 10),
(102, 'Bob Jones', 'Software Engineer', 105, '2021-03-22', 105000.00, 20),
(103, 'Charlie Brown','qa Engineer', 105, '2022-06-01', 70000.00, 20),
(104, 'David Miller', 'Marketing Specialist', 106, '2023-02-10', 65000.00, 30),
(105, 'Emma Davis', 'Engineering Director', NULL, '2019-05-12', 150000.00, 20),
(106, 'Frank Wilson', 'Marketing Director', NULL, '2018-11-20', 140000.00, 30),
(107, 'Grace Lee', 'Sales Rep', 108, '2024-01-05', 55000.00, 40),
(108, 'Henry Clark', 'Sales Manager', NULL, '2017-03-15', 115000.00, 40),
(109, 'Ivy Taylor', 'Software Engineer', 105, '2025-08-19', 98000.00, 20);

 select e.emp_id, e.emp_name,salary from employees e where salary = (select max(salary) from employees where employees.dept_id = 30);
 
-- Q33. Use a correlated subquery to find employees who earn more than the average salary of their own department.
CREATE TABLE Employees (emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
job_title VARCHAR(50),
manager_id INT,
hire_date DATE,
salary DECIMAL(10,2),
dept_id INT);


INSERT INTO Employees values
(101, 'Alice Smith', 'HR Manager', NULL, '2020-01-15', 95000.00, 10),
(102, 'Bob Jones', 'Software Engineer', 105, '2021-03-22', 105000.00, 20),
(103, 'Charlie Brown','qa Engineer', 105, '2022-06-01', 70000.00, 20),
(104, 'David Miller', 'Marketing Specialist', 106, '2023-02-10', 65000.00, 30),
(105, 'Emma Davis', 'Engineering Director', NULL, '2019-05-12', 150000.00, 20),
(106, 'Frank Wilson', 'Marketing Director', NULL, '2018-11-20', 140000.00, 30),
(107, 'Grace Lee', 'Sales Rep', 108, '2024-01-05', 55000.00, 40),
(108, 'Henry Clark', 'Sales Manager', NULL, '2017-03-15', 115000.00, 40),
(109, 'Ivy Taylor', 'Software Engineer', 105, '2025-08-19', 98000.00, 20);

 select e.emp_id, e.emp_name, salary from employees e where salary >  (select avg(salary)from employees e where dept_id =e.dept_id);
 
-- 34 .Find the names of departments that actually have employees assigned to them usingEXISTS.
CREATE TABLE Employees (emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
job_title VARCHAR(50),
manager_id INT,
hire_date DATE,
salary DECIMAL(10,2),
dept_id INT);
INSERT INTO Employees values
(101, 'Alice Smith', 'HR Manager', NULL, '2020-01-15', 95000.00, 10),
(102, 'Bob Jones', 'Software Engineer', 105, '2021-03-22', 105000.00, 20),
(103, 'Charlie Brown','qa Engineer', 105, '2022-06-01', 70000.00, 20),
(104, 'David Miller', 'Marketing Specialist', 106, '2023-02-10', 65000.00, 30),
(105, 'Emma Davis', 'Engineering Director', NULL, '2019-05-12', 150000.00, 20),
(106, 'Frank Wilson', 'Marketing Director', NULL, '2018-11-20', 140000.00, 30),
(107, 'Grace Lee', 'Sales Rep', 108, '2024-01-05', 55000.00, 40),
(108, 'Henry Clark', 'Sales Manager', NULL, '2017-03-15', 115000.00, 40),
(109, 'Ivy Taylor', 'Software Engineer', 105, '2025-08-19', 98000.00, 20);

CREATE TABLE Department (dept_id INT PRIMARY KEY,dept_name VARCHAR(50),location VARCHAR(50));
INSERT INTO Department VALUES
(10, 'HR', 'New York'),
(20, 'Engineering', 'San Francisco'),
(30, 'Marketing', 'London'),
(40, 'Sales', 'Chicago'),
(50, 'Legal', 'Toronto');

select d.dept_name from department d where exists(select 1 from employees e where d.dept_id = e.dept_id);

-- Q35. Find departments that do not have any projects registered using NOT EXISTS.

CREATE TABLE Department (dept_id INT PRIMARY KEY,dept_name VARCHAR(50),location VARCHAR(50));
INSERT INTO Department VALUES
(10, 'HR', 'New York'),
(20, 'Engineering', 'San Francisco'),
(30, 'Marketing', 'London'),
(40, 'Sales', 'Chicago'),
(50, 'Legal', 'Toronto');
CREATE TABLE Projects (project_id INT PRIMARY KEY,
project_name VARCHAR(50),
budget DECIMAL(12,2),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);
INSERT INTO Projects VALUES
(501, 'Apollo Project', 250000.00, 20),
(502, 'Zeus Initiative', 120000.00, 20),
(503, 'Global Branding', 85000.00, 30),
(504, 'CRM Migration', 150000.00, 40),
(505, 'Talent Acquisition', 30000.00, 10);

select department.dept_name from department where not exists(select * from Projects where department.dept_id = Projects.dept_id );

-- Q36. Select employee names alongside a column showing the total company payroll (Scalar Subquery).

select e.emp_id,e.emp_name,(select sum(salary)from employees) as total_company_payroll from employees e;

-- Q37. Find the oldest employee(s) based on hire date.
 select e.emp_id, e.emp_name from employees e where hire_date = (select min(hire_date) from employees);
 
 -- Q38. Find the second highest salary in the company.
 select * from employees where salary =(select DISTINCT salary from employees order by salary desc limit 1 offset 1);
 
-- Q39. Find projects that have a budget greater than all projects managed by the Sales department combined.
select  p.project_id,p.project_name, budget from projects p where budget > ( select sum(p2.budget) from projects p2 join 
department d on p2.dept_id = d.dept_id where d.dept_name = 'sales');

-- 40. List all employees whose manager works in a different department.
select e.emp_name from employees e where e.dept_id <> ( select m.dept_id from employees m where m.dept_id = e.manager_id );

-- Q41. Find the name of the department that has the highest number of employees.
SELECT dept_name FROM department WHERE dept_id =
(SELECT dept_id FROM employees GROUP BY dept_id HAVING COUNT(*) = 
(SELECT MAX(emp_count) FROM (SELECT COUNT(*) AS emp_count FROM employees GROUP BY dept_id ) AS temp));

-- Q43. Find departments located in cities starting with newyork; or San Francisco; using a subquery.

select d.dept_name, d.location from Department d where d.location in(select location from Department where location like 'new york' or 'San Francisco' );

-- Q44. Fetch employees whose salary is higher than the salary of any employee hired in 2024.
select e.emp_name,e.salary from employees e where e.salary =(select salary from employees e where e.hire_date between '2024-1-1' and '2024-12-30');

 -- Q45. Find the names of managers who supervise at least 2 employees.
SELECT emp_name
FROM employees
WHERE emp_id IN (SELECT manager_id FROM employees WHERE manager_id IS NOT NULL
    GROUP BY manager_id
    HAVING COUNT(*) >= 2);
		  
          
-- Q46. Get the project names whose budget is lower than the average project budget across the company.
select p.project_name from project p where p.budget <  (select avg(p.budget) from project p);


    