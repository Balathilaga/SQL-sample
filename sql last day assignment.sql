use sqlassigment;
-- 1. Find Employees with Salary Greater Than Average

CREATE TABLE employees(emp_id INT PRIMARY KEY,emp_name VARCHAR(50),manager_id INT,department VARCHAR(50),salary DECIMAL(10,2));
INSERT INTO employees VALUES(1,'CEO',NULL,'Management',150000),(2,'Manager1',1,'IT',90000),(3,'Manager2',1,'HR',85000),(4,'Dev1',2,'IT',60000),
(5,'Dev2',2,'IT',65000),(6,'HR1',3,'HR',50000);
with avg_salary as
(select avg(salary) as avg_salary from employees)
select e.emp_name,e.salary from employees e, avg_salary a where e.salary > a.avg_salary; 

-- 2.Calculate Department-Wise Average Salary
CREATE TABLE employees1(emp_id INT PRIMARY KEY,emp_name VARCHAR(50),manager_id INT,department VARCHAR(50),salary DECIMAL(10,2));
INSERT INTO employees1 VALUES(1,'CEO',NULL,'Management',150000),(2,'Manager1',1,'IT',90000),(3,'Manager2',1,'HR',85000),(4,'Dev1',2,'IT',60000),
(5,'Dev2',2,'IT',65000),(6,'HR1',3,'HR',50000);

with avgsalary as (
select department, avg(salary) over (partition by department)as avgsalary_1 from employees1)
 select distinct department, avgsalary_1 from avgsalary;
 
 -- 3. Find Students Who Scored Above Average Then display students whose marks are greater than the average mark.
 create table student (id int, std_name varchar(70),course varchar(80), mark int);
 insert  into student values (1,'bala','Fullstack',88),(2,'yugan','trainer',90),(3,'raja','dataanalyst',75),(4,'arul','ds',88),(5,'mozhi','tester',98);
 with std_avgmark as(
 select avg(mark)as std_avgmark from student) select s.id, s.std_name,s.mark from student s, std_avgmark a  where s.mark > a.std_avgmark;
 
 -- 4. Find High-Priced Products Then display products whose price is greater than ₹20,000.
create table products (id int, p_name varchar(50),category varchar(50),price int);
insert into products values (1,'soap','grocery',18000),(2,'mobile','electronic',30000),(3,'laptop','electronic',75000),(4,'bucket','plastic',7500);
with higher_price as(
select price as higher_price from products) select p.p_name,p.price from products p join higher_price h on p.price = h.higher_price where higher_price > 20000; 

-- 5. Calculate Employee Bonus Then display the employee name, salary, bonus, and total salary.
with employee_bonus as(
select emp_id,emp_name,salary,salary * 0.10 as bonus from employees) select emp_name, salary+bonus as total_salary from employee_bonus;

 
 -- class work
 with recursive emp_tree As (
 select emp_id,emp_name,manager_id, 0 As level from employees where manager_id is null
 union all
 select e.emp_id,e.emp_name,e.manager_id, et.level + 1 from employees e  join emp_tree et  on e.manager_id = et.emp_id)
 select * from emp_tree;
 
 with high_salary as 
 (select emp_id, emp_name,salary from employees where salary > 70000),
 it_dpt As (select emp_id, emp_name,salary from employees where department = 'it')
 select * from high_salary h join it_dpt i on h.emp_id = i.emp_id;
 
 with recursive numbers as (
 select 1 as n
 union all
 select  n + 1  from numbers where n <=10)
 select * from numbers;
 
 

