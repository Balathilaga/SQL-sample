show databases;
create database secondday;
use secondday;
create table employee(empid int, empname varchar(50), degn varchar(40), salary int);
show tables;

select * from employee;
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

--'Arithemetic Operators:'
select * from employee  where salary = 50000;
select * from employee where degn <> 'Tl';
select * from employee where empid != 2;
select * from employee where salary < 40000;
select * from employee where salary > 50000;
select * from employee where salary <= 50000;

--'range operators'
select * from employee where salary between 50000 and 60000;
select * from employee where salary  not between 50000 and 60000;

--'list operators'
select * from employee where empname in ('kumar','bala','viswa');
select * from employee where empname not in ('kumar','bala','viswa');

 -- 'logical operators'
 select * from employee where salary >=30000 and degn='HR';
  select * from employee where salary >30000 or degn='Mgr';
   select * from employee where not salary >=30000 and degn='HR';
   
   --'String operators'
   select * from employee where empname like 'B___';
   select * from employee where empname like 'k%';
   select * from employee where empname not like 'k%';
   select * from employee where empname like 'm__%';
   select * from employee where empname like 'k%_%_';
   select * from employee where empname like '_a%';
   
   create table Students (stdId int,stdname varchar(70), mark int);
   select * from Students;
   insert into students values
   (101, 'Arun', 75),
   (102, 'Kumar',80),
   (103, 'Viswa', 99),
   (104, 'Yuga', 100),
   (105, 'Anu', 88)
   
   
   --operators
   select stdid, stdname,mark, mark - 35 AS '+Internal mark' from students;
   select * from students where mark <> 100;
   select * from students where mark < 60;
   select * from students where mark != 100;
   select * from students where mark between 80 and 100;
   select * from students where mark not between 80 and 100;
   select * from students where stdname in ('viswa','anu');
   select * from students where mark not in (99,88);
   select * from students where stdname like 'y___';
   select * from students where Stdname like '%_';
   select * from students where Stdname like 'y_%';
   select * from students where Stdname like '%%';
   
  
create table customer (
customer_id int,
customer_Name varchar(100),
customer_Address varchar(100),
city varchar(30),
state varchar(20),
Zip_code int
);

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

   select * from customer where city <> 'newyork';
   select * from customer where State ='sandego';
   select * from customer where State != 'NT';
   select * from customer where customer_name in ('John joe','mary smith');
   select * from customer where customer_name not in ('John joe','mary smith');
   select * from customer where customer_name like 'j_______';
   select * from customer where customer_name like '%_';
   select * from customer where customer_name like 'M_%';
   select * from customer where customer_name like 'R__%';
   
create table product( ID int,Productname varchar(50), Brand varchar(30), pricr int, quantity int);
insert into Product value
(1,'Labtop','innova',50000,10),
(2,'Labtop','HP',50000,54),
(3,'Labtop','DELL',140000,30),
(4,'Labtop','Asus',70000,14),
(5,'Labtop','Acer',60000,20);

select * from Product;
   select ID, Productname,Brand, pricr,  Quantity,Quantity + 10 AS '+More Quantity' from product;
   select * from Product where brand <> 'Dell';
   select * from Product where pricr < 70000;
   select * from Product where brand != 'innova';
   select * from Product where pricr between 50000 and 80000;
   select * from Product where pricr not between 60000 and 70000;
   select * from Product where productname  in ('labtop');
   select * from Product where pricr not in (50000,60000);
   select * from Product where brand like 'h_';
   select * from Product where brand like '%_';
   select * from Product where brand like 'd_%';
   select * from Product where brand like '%%';
   

   
   
