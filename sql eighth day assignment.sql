use sqlassigment;
-- 1. Prevent Negative Stock Question: Create a trigger to prevent the stock_quantity from being updated to a value less than 0.
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    stock_quantity INT
);
INSERT INTO Products (product_id, product_name, stock_quantity)
VALUES
(1, 'Laptop', 20),
(2, 'Keyboard', 10),
(3, 'Mouse', 15),
(4, 'Monitor', 8),
(5, 'Printer', 5);

DELIMITER //
CREATE TRIGGER preventStock 
before update on products for each row
begin
 if NEW.stock_quantity < 0 then 
 SIGNAL sqlstate '45000'
 SET message_text = 'stock Quantity cannot be nagative';
 end if;
end //
delimiter ;

update products set stock_quantity = -1 where product_id = 3;


-- 2. Audit Price Changes   Question: Log whenever a product price is updated into the Inventory_Audit table.

CREATE TABLE Inventory_Audit (audit_id INT PRIMARY KEY AUTO_INCREMENT,product_id INT,action_type VARCHAR(50),
old_price VARCHAR(100),new_price VARCHAR(100),changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE Inventory (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(10,2)
);
INSERT INTO Inventory (product_name, quantity, price)
VALUES
('Laptop', 10, 50000),
('Mobile', 20, 15000),
('Keyboard', 15, 1000);
INSERT INTO Inventory (product_name, quantity, price) VALUES ('MOBILE',20,40000);

delimiter //
create trigger Upd_invetrory
after update on Inventory for each row
begin
if OLD.price <> NEW.price then 
insert into Inventory_Audit (product_id,action_type,old_price,new_price,changed_at) values (New.product_id,'priceupdated',old_price,new_price,now());
end if;
end //
delimiter ;
SELECT * FROM INVENTORY;
SELECT * FROM Inventory_Audit;
update inventory set price=65000 where product_name = 'laptop';

set SQL_SAFE_UPDATES = 0;


-- 3. Auto-Update Status to 'Out of Stock' Question: If stock reaches 0, automatically change the status to 'Out of Stock'.
CREATE TABLE Inventory (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(10,2)
);
INSERT INTO Inventory (product_name, quantity, price)
VALUES
('Laptop', 10, 50000),
('Mobile', 20, 15000),
('Keyboard', 15, 1000);


delimiter //
create trigger auto_update_STOCK
before update on inventory for each row
begin
if NEW.quantity <= 0 then 
 SIGNAL sqlstate '45000'
 SET MESSAGE_TEXT = 'OUT OF STOCK';
 END IF;
 END //
 DELIMITER ;
 
 UPDATE INVENTORY SET QUANTITY = 0 WHERE product_id = 1;
SELECT * FROM INVENTORY ;

-- 4. Enforce Uppercase Product Names Question: Ensure all product names are stored in uppercase upon insertion.

CREATE TABLE Inventory (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(10,2)
);
 select * from inventory;
INSERT INTO Inventory (product_name, quantity, price)
VALUES
('Laptop', 10, 50000),
('Mobile', 20, 15000),
('Keyboard', 15, 1000);
 
 DELIMITER //
 CREATE TRIGGER AUTO_CORRECT
 before insert on inventory for each row
 begin
 set NEW.product_name = upper(NEW.product_name);
 end //
 delimiter ;


-- 5. Log New Product Additions Question: Record a log entry whenever a new product is added to the system.

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(10,2)
);

 select * from products;
 select * from product_log;
INSERT INTO products (product_name, quantity, price)
VALUES
('Laptop', 10, 50000),
('Mobile', 20, 15000),
('Keyboard', 15, 1000);

CREATE TABLE product_log (audit_id INT PRIMARY KEY AUTO_INCREMENT,product_id INT,action_type VARCHAR(50),changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

delimiter //
create trigger upd_products_name
after insert on products for each row
begin
insert into product_log(product_id,action_type,changed_at) values (New.product_id,'product added',now());
end //
delimiter ;


CREATE TABLE employees (id INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(50),salary DECIMAL(10,2),created_at DATETIME);

INSERT INTO employees(name, salary)VALUES ('John123', 50000);
INSERT INTO employees(name, salary)VALUES ('Johnson12', 30000);
INSERT INTO employees(name, salary)VALUES ('Joe', 30000);
insert into employees (name, salary)values('peter',30000);

delimiter //
create trigger before_insert_employees
before insert on employees for each row
begin
 set new.created_at = now();
 end //
 delimiter ;
 
 select * from employees;
 CREATE TABLE employee_audit (audit_id INT AUTO_INCREMENT PRIMARY KEY,employee_id INT,action VARCHAR(50),action_time DATETIME);
 select * from employee_audit
 
 delimiter //
 create trigger after_insert_employees
 after insert on employees for each row
 begin
 insert into employee_audit (employee_id, action,action_time) values (NEW.id, 'insert',now());
 end //
 delimiter ;
 
 delimiter //
 create trigger before_update_salary
 before update on employees for each row
 begin
 set NEW.created_at = now();
 end //
 delimiter ;
 
 update employees set salary = 45000 where id = 1;
  SELECT * FROM EMPLOYEES;
  CREATE TABLE salary_log(log_id INT PRIMARY KEY AUTO_INCREMENT,emp_id INT,old_salary DECIMAL(10,2),new_salary DECIMAL(10,2),change_date DATETIME);
  
  delimiter //
  create trigger before_update_salary1
  before update on employees for each row
  begin
  if NEW.salary < OLD.salary then 
  SIGNAL SQLSTATE '45000'
  SET message_text = 'salary cannot be dereased';
  end if;
  end //
  delimiter ;
  select * from employees;
 update employees set salary = 20000 where id =3;
update employees set salary = 60000 where id =3;

delimiter //
create trigger after_update_salary
after update on employees for each row
begin
if New.salary <> old.salary then
INSERT INTO SALARY_LOG(EMP_ID, OLD_SALARY,NEW_SALARY,CHANGE_DATE) VALUES (OLD_ID,OLD_SALARY,NEW_SALARY,NOW());
END IF;
END //
DELIMITER ;
SELECT * FROM EMPLOYEES;
UPDATE EMPLOYEES SET SALARY = 50000 WHERE ID = 1;
UPDATE EMPLOYEES SET SALARY = 60000 WHERE ID = 2;



