create database constraints;
use constraints;
create table emp(eno int, ename varchar(30),degs char(30), salary int);
alter table emp add constraint pk_emp primary key(eno);
insert into emp values
(1, 'Priya','HR',30000),
(2, 'Viswa','Mgr',33000),
(3, 'Kumar','Tl',35000),
(4, 'Jothi','Sprv',40000),
(5, 'meena','PM',45000);
select * from emp;

create table employee(eno int, ename varchar(30),degs char(30), salary int,constraint pk_employee primary key(ename));
alter table employee drop primary key;
alter table employee add constraint pk_employee primary key(eno);
insert into employee values
(6, 'Priya','HR',30000),
(7, 'Viswa','Mgr',33000);

create table employee1(eno int, ename varchar(30),degs char(30), salary int,constraint pk_employee primary key(eno));
select * from employee1;


