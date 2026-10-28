
use sqlassigment;

create table employees(emp_id int,emp_name varchar(40),dept_id int);
create table departments(dept_id int, dept_name varchar(50));

insert into employees values (1, 'Alice', 101),(2, 'Bob', 102),(3, 'Charlie', 103),(4, 'David', NULL);
INSERT INTO departments VALUES (101, 'HR'),(102, 'IT'),(104, 'Finance');

select * from employees;
select * from departments;

select employees.emp_name, departments.dept_name,employees.dept_id,departments.dept_id from employees
INNER JOIN departments ON employees.dept_id = departments.dept_id;

select employees.emp_name, departments.dept_name from employees left join departments on employees.dept_id = departments.dept_id;
select employees.emp_name,departments.dept_name from employees right join departments on employees.dept_id = departments.dept_id;
select employees.emp_name,departments.dept_name from employees left join departments on employees.dept_id = departments.dept_id
union
select employees.emp_name,departments.dept_name from employees right join departments on employees.dept_id = departments.dept_id;


-- question 1 to 3
CREATE TABLE departments (dept_id INT,dept_name VARCHAR(50));
CREATE TABLE employee (emp_id INT,emp_name VARCHAR(50),dept_id INT,manager_id INT,salary INT);
INSERT INTO departments VALUES(1, 'IT'),(2, 'HR'),(3, 'Finance'),(4, 'Sales');
INSERT INTO employee VALUES(1, 'Alice', 1, NULL, 80000),(2, 'Bob', 1, 1, 60000),(3, 'Charlie', 2, 1, 50000),
(4, 'David', 3, 2, 70000),(5, 'Eva', NULL, 2, 45000);
select employee.emp_name,departments.dept_name from employee inner join departments on employee.dept_id = departments.dept_id;
select employee.emp_name,departments.dept_name from employee left join departments on employee.dept_id = departments.dept_id;
select employee.emp_name,departments.dept_name from employee right join departments on employee.dept_id = departments.dept_id;

 -- question no 4
CREATE TABLE projects (project_id INT,project_name VARCHAR(50),dept_id INT);
CREATE TABLE emp_projects (emp_id INT,project_id INT);
INSERT INTO projects VALUES(101, 'Website', 1),(102, 'Payroll', 3),(103, 'Recruitment', 2);
INSERT INTO emp_projects VALUES(1, 101),(2, 101),(3, 103),(4, 102),(5,104),(),(6,105);
select  emp_projects.project_id,projects.project_name,emp_projects.emp_id from projects inner join 
emp_projects on projects.project_id = emp_projects.project_id;

-- question no 5
CREATE TABLE emp (emp_id INT,emp_name VARCHAR(50),dept_id INT);
CREATE TABLE proj(project_id INT,emp_id INT);
INSERT INTO emp VALUES(101, 'Website', 1),(102, 'Payroll', 3),(103, 'Recruitment', 2) ,(100, 'payslip',4);
INSERT INTO proj VALUES(1, 101),(2, 101),(3, 103),(4, 102);
select emp.emp_name from emp left join proj on emp.emp_id =proj.emp_id where proj.project_id is null;

-- question 6
CREATE TABLE project1(project_id INT,project_name VARCHAR(50),dept_id INT);
CREATE TABLE department1 (dept_id INT,dept_name VARCHAR(50));
INSERT INTO project1 VALUES(101, 'Website', 1),(102, 'Payroll', 3),(103, 'Recruitment', 2);
INSERT INTO department1 VALUES(1, 'IT'),(2, 'HR'),(3, 'Finance'),(4, 'Sales');
select project1.project_name,department1.dept_name from project1 inner join department1 on project1.dept_id = department1.dept_id; 

-- question no 7;
CREATE TABLE employees1 (emp_id INT,emp_name VARCHAR(50),dept_id INT,manager_id INT,salary INT);
CREATE TABLE departments1 (dept_id INT,dept_name VARCHAR(50),city varchar(40));
INSERT INTO employees1 VALUES(1, 'Alice', 1, NULL, 80000),(2, 'Bob', 1, 1, 60000),(3, 'Charlie', 2, 1, 50000),
(4, 'David', 3, 2, 70000),(5, 'Eva', NULL, 2, 45000);
INSERT INTO departments1 VALUES(1, 'IT','chennai'),(2, 'HR','coimbatore'),(3, 'Finance','trichy'),(4, 'Sales','bengalore');
select employees1.emp_name,departments1.dept_name,departments1.city from employees1 left join departments1 on 
employees1.dept_id = departments1.dept_id 

--question no 8 ;
CREATE TABLE empl (emp_id INT,emp_name VARCHAR(50),dept_id INT,manager_id INT,salary INT);
INSERT INTO empl VALUES(1, 'Alice', 1, NULL, 80000),(2, 'Bob', 1, 1, 60000),(3, 'Charlie', 2, 1, 50000),
(4, 'David', 3, 2, 70000),(5, 'Eva', NULL, 2, 45000);
select * from empl;
select * from empl;
select e1.emp_id,e1.emp_name as employeename, e2.manager_id as Manager from empl e1, empl e2 where e1.emp_id = e2.manager_id;

-- question no 9;
CREATE TABLE projects1 (project_id INT,project_name VARCHAR(50),dept_id INT);
CREATE TABLE department2 (dept_id INT,dept_name VARCHAR(50));
INSERT INTO department2 VALUES(1, 'IT'),(2, 'HR'),(3, 'Finance'),(4, 'Sales');
INSERT INTO projects1 VALUES(101, 'Website', 1),(102, 'Payroll', 3),(103, 'Recruitment', 2);
select projects1.project_id, projects1.project_name, department2.dept_name from department2 left join projects1  
on projects1.dept_id = department2.dept_id;

-- question 10
CREATE TABLE employeee (emp_id INT,emp_name VARCHAR(50),dept_id INT,manager_id INT,salary INT);
INSERT INTO employeee VALUES(1, 'Alice', 1, NULL, 80000),(2, 'Bob', 1, 1, 60000),(3, 'Charlie', 2, 1, 50000),
(4, 'David', 3, 2, 70000),(5, 'Eva', NULL, 2, 45000);
select * from employe;
select * from employe;
select  e3.emp_name as employeeName,e3.salary as employeesalary,e3.manager_id from employeee as e3 
join employeee as e4 on e3.emp_id = e4.manager_id where e3.salary > e4.salary;


-- question no 11;
CREATE TABLE employe2(emp_id INT,emp_name VARCHAR(50),dept_id INT,manager_id INT,salary INT);
INSERT INTO employe2 VALUES(1, 'Alice', 1, NULL, 80000),(2, 'Bob', 1, 1, 60000),(3, 'Charlie', 2, 1, 50000),
(4, 'David', 3, 2, 70000),(5, 'Eva', NULL, 2, 45000);
CREATE TABLE department3 (dept_id INT,dept_name VARCHAR(50));
INSERT INTO department3 VALUES(1, 'IT'),(2, 'HR'),(3, 'Finance'),(4, 'Sales');
SELECT d.dept_id,d.dept_name,COUNT(e.emp_id) AS employee_count FROM departments d
 left JOIN employeee e ON d.dept_id = e.dept_id GROUP BY d.dept_id, d.dept_name;
 
 -- question 12
CREATE TABLE department4 (dept_id INT,dept_name VARCHAR(50));
INSERT INTO department4 VALUES(1, 'IT'),(2, 'HR'),(3, 'Finance'),(4, 'Sales');
CREATE TABLE employe4(emp_id INT,emp_name VARCHAR(50),dept_id INT,manager_id INT,salary INT);
INSERT INTO employe4 VALUES(1, 'Alice', 1, NULL, 80000),(2, 'Bob', 1, 1, 60000),(3, 'Charlie', 2, 1, 50000),
(4, 'David', 3, 2, 70000),(5, 'Eva', NULL, 2, 45000);
select employe4.emp_name,department4.dept_name from employe4 left join department4 on employe4.dept_id = department4.dept_id 
where department4.dept_name is null ;

-- question no 13
CREATE TABLE department5 (dept_id INT,dept_name VARCHAR(50));
INSERT INTO department5 VALUES(1, 'IT'),(2, 'HR'),(3, 'Finance'),(4, 'Sales');
CREATE TABLE project5 (project_id INT,project_name VARCHAR(50),dept_id INT);
INSERT INTO project5 VALUES(101, 'Website', 1),(102, 'Payroll', 3),(103, 'Recruitment', 2),(104,'gemes',1);
select department5.dept_name ,count(project_id) as projectCount from department5 left join project5 on department5.dept_id = project5.dept_id 
group by  department5.dept_id,department5.dept_name;

-- question 14
CREATE TABLE employee6 (emp_id INT,emp_name VARCHAR(50),dept_id INT,manager_id INT,salary INT);
INSERT INTO employee6 VALUES(1, 'Alice', 1, NULL, 80000),(2, 'Bob', 1, 1, 60000),(3, 'Charlie', 2, 1, 50000),
(4, 'David', 3, 2, 70000),(5, 'Eva', NULL, 2, 45000);
CREATE TABLE department6 (dept_id INT,dept_name VARCHAR(50));
INSERT INTO department6 VALUES(1, 'IT'),(2, 'HR'),(3, 'Finance'),(4, 'Sales');
select d.dept_name,e.emp_name from employee6 as e inner join department6 as d on d.dept_id = e.dept_id where d.dept_name ='IT';

-- question no 15;
CREATE TABLE employee7 (emp_id INT,emp_name VARCHAR(50),dept_id INT,manager_id INT,salary INT);
INSERT INTO employee7 VALUES(1, 'Alice', 1, NULL, 80000),(2, 'Bob', 1, 1, 60000),(3, 'Charlie', 2, 1, 50000),
(4, 'David', 3, 2, 70000),(5, 'Eva', NULL, 2, 45000);
CREATE TABLE project7 (project_id INT,project_name VARCHAR(50),dept_id INT);
INSERT INTO project7 VALUES(101, 'Website', 1),(102, 'Payroll', 3),(103, 'Recruitment', 2);
SELECT e.emp_name,p.project_name FROM employee7 e LEFT JOIN project7 p ON e.dept_id = p.dept_id;

-- question 16
CREATE TABLE department7 (dept_id INT,dept_name VARCHAR(50));
INSERT INTO department7 VALUES(1, 'IT'),(2, 'HR'),(3, 'Finance'),(4, 'Sales');
CREATE TABLE locations (location_id INT,dept_id INT,city VARCHAR(50));
INSERT INTO locations VALUES(1, 1, 'New York'),(2, 2, 'London'),(3, 3, 'Tokyo');
select department7.dept_name,locations.city from locations inner join department7 on department7.dept_id = locations.dept_id ;

-- question 17
CREATE TABLE department8 (dept_id INT,dept_name VARCHAR(50));
INSERT INTO department8 VALUES(1, 'IT'),(2, 'HR'),(3, 'Finance'),(4, 'Sales');
CREATE TABLE locations8 (location_id INT,dept_id INT,city VARCHAR(50));
INSERT INTO locations8 VALUES(1, 1, 'New York'),(2, 2, 'London'),(3, 3, 'Tokyo');
select department8.dept_name,locations8.city from locations8 inner join department8 on department8.dept_id = locations8.dept_id
 where  locations8.city = 'Tokyo';
 
  -- question no 18 
  CREATE TABLE project9 (project_id INT,project_name VARCHAR(50),dept_id INT);
INSERT INTO project9 VALUES(101, 'Website', 1),(102, 'Payroll', 3),(103, 'Recruitment', 2);
CREATE TABLE employe10(emp_id INT,emp_name VARCHAR(50),dept_id INT,manager_id INT,salary INT);
INSERT INTO employe10 VALUES(1, 'Alice', 1, NULL, 80000),(2, 'Bob', 1, 1, 60000),(3, 'Charlie', 2, 1, 50000),
(4, 'David', 3, 2, 70000),(5, 'Eva', NULL, 2, 45000);
select p.project_id, p.project_name, count(emp_id) from employe10 as e join project9 as p on e.dept_id = p.dept_id 
group by p.project_name,p.project_id;