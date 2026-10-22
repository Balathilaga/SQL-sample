create database thirdday;
use thirdday;
create table employee ( emp_id int, emp_name varchar(30), dept char(30), salary int);
insert into employee values
(1, 'Priya','HR',30000),
(2, 'Viswa','Mgr',33000),
(3, 'Kumar','Tl',35000),
(4, 'Jothi','Sprv',40000),
(5, 'meena','PM',45000),
(6, 'Bala','SM',50000),
(7, 'Selvi','SO',20000),
(8, 'Kani','SM',640000),
(9, 'MOzhi','PM',29000);

 select * from employee;
 select count(salary) as counting from employee;
select max(salary) as maximum from employee;
select min(salary) as minimum from employee;
select avg(salary) as average from employee;
select emp_name from employee group by emp_name;
select dept,salary from employee group by dept,salary;

select * from Students;
create table Students (stdId int,stdname varchar(70), mark int, homedown varchar(100));

insert into students values
   (101, 'Arun', 75, 'chennai'),
   (102, 'Kumar',80,'dindigul'),
   (103, 'Viswa', 99, 'madurai'),
   (104, 'Yuga', 100,'theni'),
   (105, 'Anu', 88,'namakkal'),
   (106, 'Kani', 36, 'Trichy'),
   (107, 'Mozhi',81,'Karaikal'),
   (108, 'Santhiya', 59, 'ooty'),
   (109, 'Sathya', 80,'kodaikanal'),
   (110, 'Dhanush', 48,'tharmapuri');
   
   select count(Mark) from students;
   select count(mark) as 'count', max(mark) as 'maximum mark', min(mark) as 'minimimum mark', avg(mark) as 'average mark' from students;
   select stdid,stdname, count(mark) as 'count', max(mark) as 'maximum mark', min(mark) as 'minimimum mark',
   avg(mark) as 'average mark' from students group by stdid,stdname;
   select * from students order by mark desc;
   
select * from customer;

create table customer (
customer_id int,
customer_Name varchar(100),
customer_Address varchar(100),
city varchar(30),
state varchar(20),
Zip_code int);


insert into customer values(1,'John Joe','362 sunset blvd','newyork','NT',100059);
insert into customer values(2,'Mary Smith','6900 Main St','San Francisko','CA',94032);
insert into customer values(3,'Richard newman','2040 Riverside RD','sandeogo','CA',9010);
insert into customer values(1,'John Joe','362 sunset blvd','newyork','NT',100059);

select count(*) from customer;
select customer_name,city from customer group by  customer_name,city;
select * from customer order by customer_name,city,zip_code desc;

create table product( ID int,Productname varchar(50), Brand varchar(30), pricr int, quantity int);
insert into Product value
(1,'Labtop','innova',50000,10),
(2,'Labtop','HP',50000,54),
(3,'Labtop','DELL',140000,30),
(4,'Labtop','Asus',70000,14),
(5,'Labtop','Acer',60000,20),
(6,'Labtop','Mac',50000,10),
(7,'Mobile','realme',27000,54),
(8,'mobile','Apple',140000,30),
(9,'mobile','sumsung',70000,14),
(10,'mobile','oppo',3800,20);
select * from product;
select count(quantity) from product;
alter table product change pricr price int;
select sum(price) as 'newprice', min(price), max(price) from product;
select sum(price)as 'total price' from product;
select * from product order by price;

CREATE TABLE staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    department VARCHAR(50),
    designation VARCHAR(50),
    salary int,
    phone VARCHAR(15)
  );
   INSERT INTO staff
(first_name, age, gender, department,
 designation, salary, phone)
VALUES
('Arun', 25, 'Male', 'IT',
 'Software Developer', 35000.00, '9876543210'),

('Priya',  28, 'Female', 'HR',
 'HR Manager', 45000.00, '9876543211'),

('Rahul', 30, 'Male', 'Finance',
 'Accountant', 40000.00, '9876543212'),

('Sneha', 26, 'Female', 'Marketing',
 'Marketing Executive', 32000.00, '9876543213'),

('Vijay', 35, 'Male', 'IT',
 'Team Lead', 60000.00, '9876543214');
select * from staff;

select count(salary) from staff;
select * from staff order by first_name desc;
select staff_id, age from staff group by staff_id,age;
select sum(salary) as 'toatal salary' from staff;

create table event (id int, event_name varchar(50),event_date int);
insert into event values
(1,'Birth day', 02-06-2000),
(2,'Indpendence day', 15-08-2000),
(3,'yuga birthday', 21-11-2017),
(4,'diwali', 05-11-2026);
select * from event;

create table events (Date varchar(50));
drop table events;
insert into events values
('02-6-1999'),
('28-03-1990'),
('21-11-2017');

SELECT NOW();
SELECT CURDATE();
SELECT CURDATE();
SELECT
    event_name,
    event_date,
    YEAR(event_date) AS event_year,
    MONTH(event_date) AS event_month
FROM event;
SELECT CONCAT(event_name, ' - ', event_date) AS event_details
FROM event;