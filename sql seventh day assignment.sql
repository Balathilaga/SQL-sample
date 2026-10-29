
use sqlassigment;
-- Question 1: Create a stored procedure to add a new customer.
create table customer(cid int, cname varchar (30));
insert into customer values (1,'Viswa');
select * from customer;

DELIMITER //
 create procedure insertProduct (_cid int,_cname varchar (30))
 begin
 insert into customer values (_cid,_cname);
 end //
DELIMITER ;

 call insertProduct(2,'Yugan')

 -- Question 2: Create a stored procedure to retrieve customer details by CustomerID.
 delimiter //
 create procedure retri_data (in _cid int)
 begin
 select * from customer where cid = _cid;
 end //
 delimiter ;
 call retri_data(1);
 
 -- Question 3: Create a stored procedure to update a customer's email and phone number
create table customer(cid int, cname varchar (30),cemail varchar(40),mobilenumber bigint);
insert into customer values (1,'Viswa','viswa2@gmail.com', 9677575147);
 delimiter //
 create procedure upddProduct(in _cemail varchar(40),_mobilenumber bigint)
 begin
   update customer set cemail=_cemail, mobilenumber = _mobilenumber;
  end //
  delimiter ;
  call upddProduct('yugan11@gmail.com',9647382900);
select * from customer;
SET SQL_SAFE_UPDATES = 0;

-- Question 4: Create a stored procedure to get all customers from a specific city.

create table customer(cid int, cname varchar (30),city varchar(40));
insert into customer values (1,'Viswa','chennai'); 
insert into customer values (2,'bala','coimbatore'); 
insert into customer values (3,'yugan','chennai'); 
insert into customer values (4,'kumar','namakkal'); 
insert into customer values (5,'amir','karur'); 
insert into customer values (6,'vignesh','chennai'); 
  delimiter //
  create procedure insertProduct1(in _city varchar(50))
  begin
  select * from customer where city = _city;
  end //
  delimiter ;
  call insertProduct1('CHENNAI');
  
 -- Question 5: Create a stored procedure to delete a customer by CustomerI
 DELIMITER //
 CREATE PROCEDURE delcus(in _cid int)
 begin
   delete from customer where cid = _cid;
 end //
 delimiter ;
 call delcus (1);
 
 -- Question 6: Create a stored procedure to list customers registered within a given date range.
 CREATE TABLE customer (cid INT,cname VARCHAR(30),city VARCHAR(40),reg_date DATE);

INSERT INTO customer VALUES
(1, 'Viswa', 'Chennai', '2025-01-10'),
(2, 'Bala', 'Coimbatore', '2025-02-15'),
(3, 'Yugan', 'Chennai', '2025-03-20'),
(4, 'Kumar', 'Namakkal', '2025-04-05'),
(5, 'Amir', 'Karur', '2025-05-12');

delimiter //
create procedure data_range(in _startdate date , in _enddate date)
begin
select * from customer where reg_date between _startdate and _enddate;
end //
delimiter ;
call data_range('2025-02-2','2022-04-10');

-- Question 7: Create a stored procedure to search for customers by partial FirstName or LastName.
CREATE TABLE customer (cid INT,FirstName VARCHAR(30),LastName VARCHAR(30));

INSERT INTO customer VALUES
(1, 'Viswa', 'Kumar'),
(2, 'Bala', 'Krishnan'),
(3, 'Yugan', 'Raj'),
(4, 'Kumar', 'Vel'),
(5, 'Amir', 'Khan');
 delimiter //
 create procedure find_name(in searchname varchar (50))
 begin 
  select * from customer where firstName like concat('%',searchname ,'%') or
  lastName like concat('%',searchname ,'%');
 end //
 delimiter ;
  call find_name ('kris');
   call find_name ('vis');
   
   -- Question 8: Create a stored procedure to update a customer's entire address.
   
 create table customer(cid int, cname varchar (30), address varchar(100));
insert into customer values (1,'Viswa','2, weststreet, dindigul');
select * from customer;
drop table customer
delimiter //
create procedure updcustomer(in _address varchar (100))
begin
update customer set address = _address;
end //
delimiter ;
call updcustomer ('3,north street, gopalpatti, thirupur');

-- Question 9: Create a stored procedure that returns the total number of customers
create table customer(cid int, cname varchar (30));

insert into customer values (1,'Viswa');
insert into customer values (2,'bala');
insert into customer values (3,'arun');
insert into customer values (4,'mozhi');
insert into customer values (5,'yuva');
insert into customer values (6,'kumar');
insert into customer values (7,'sanjai');
insert into customer values (8,'mukesh');
insert into customer values (9,'siva');

select * from customer;
delimiter //
create procedure totalcount()
begin 
select count(cname) from customer;
end //
delimiter ;
call totalcount();

-- Question 10: Create a stored procedure to retrieve customers who have not provided an email address.
create table customer(cid int, cname varchar (30),cemail varchar(40));
insert into customer values (1,'Viswa','viswa2@gmail.com');
insert into customer values (2,'bala','viswa2@gmail.com');
insert into customer values (3,'Viswa',null);
insert into customer values (4,'krishna','viswa2@gmail.com');
insert into customer values (5,'rafi',null);

DELIMITER //

CREATE PROCEDURE RetrieveCustomers()
BEGIN
    SELECT *
    FROM customer
    WHERE cemail IS NULL;
END //

DELIMITER ;
CALL RetrieveCustomers();