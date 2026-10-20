show databases;
create database Emp;
use Emp;
create table Emp(EmpId int, empName varchar(30), Department varchar(20), Salary int)
desc Emp;
insert into Emp value(1, 'Bala', 'hr', 25000);
insert into Emp value(2,'viswa','manager', 30000);
insert into Emp value (3,'yugan', 'Team leader',50000);
insert into Emp value(4, 'thilaga','CEO',80000);
select * from Emp;  

alter table Emp modify Department char(30);
update Emp set empname ='varsha', Department ='assmng',Salary= 55000 where EmpId = 3;
SET SQL_SAFE_UPDATES = 0; 
delete from Emp where salary > 50000;
show tables;

create table Students (StdId Int, stdName varchar(50), Dept varchar(30), Age int);
insert into Students value
(1, 'priya', 'fullstack', 26),
(2,'Thamarai','DataAnalyst',25),
(3, 'Kumari','DataSceince',30),
(4,'Meena','Tester',26);

select * from Students;
update Students set age = 30 where stdId= 4;
delete from Students where stdId=3;

create table staff (sID int, sName varchar(40), Dept char(16), salary int);
insert into staff value
(101, 'kanmani', 'acc', 30000),
(102, 'priya', 'hr', 35000),
(103, 'Kokila', 'assdr', 40000),
(104, 'Anu', 'Drc', 60000),
(105, 'Bala', 'CEO', 120000);

select * from Staff;
select sid, sName from staff;
update staff set salary= 40000 where sID=101;
delete from staff where salary > 100000;

create table product( ID int,Productname varchar(50), Brand varchar(30), pricr int, quantity int);
insert into Product value
(1,'Labtop','innova',50000,10),
(2,'Labtop','HP',50000,54),
(3,'Labtop','DELL',140000,30),
(4,'Labtop','Asus',70000,14),
(5,'Labtop','Acer',60000,20);

select * from product;
update product set Brand = 'macbook' where productname ='laptop' and Brand ='Asus';
desc product;
delete from product where pricr < 60000;




 