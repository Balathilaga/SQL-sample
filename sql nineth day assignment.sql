use sqlassigment;
-- -- 1. Assign a unique row number to students in each class based on highest marks.
CREATE TABLE students (id INT,class VARCHAR(10),std_name VARCHAR(50),marks INT);
INSERT INTO students VALUES (1, 'A', 'John', 85),(2, 'A', 'Sara', 92),(3, 'A', 'Mike', 78),(4, 'B', 'Anna', 88),(5, 'B', 'Tom', 90) ,(6,'B', 'micheal',88),(7,'A','Arun',92);
select class, std_name,marks, row_number() over (partition by class order by marks desc) as Highest_mark from students ;

-- -- 2.Rank students in each class based on marks (with gaps).
select class, std_name, marks,rank() over (partition by class order by marks desc) as gap_rank from students;

--  3. Rank students in each class based on marks (without gaps).
select class, std_name, marks,dense_rank() over (partition by class order by marks desc) as gap_rank from students;

-- - 4. Display average marks of each class along with every student.
select class,std_name, marks,avg(marks) over (partition by class )  as Avg_mark from students;

-- - 5. Show the highest marks scored in each class for every student.
select class,std_name,marks from(select class,std_name,marks, max(marks) over (partition by class)As highest_mark from students)as result where marks = highest_mark;

-- -- 6. Assign row numbers to students per subject based on score.
CREATE TABLE exam(student VARCHAR(50),subject VARCHAR(20),score INT);
INSERT INTO exam VALUES('Alice', 'Math', 90),('Bob', 'Math', 90),('Charlie', 'Math', 85),('David', 'Science', 88),('Eva', 'Science', 88);
select subject, student,  score, row_number () over(partition by subject order by score desc)As row_number_forexam from exam;

-- -- 7. Rank students per subject (with gaps).
select subject, student,  score, rank () over(partition by subject order by score desc)As rank_number_forexam from exam;

-- -- 8. Rank students per subject (without gaps).
select subject, student,  score, dense_rank () over(partition by subject order by score desc)As rank_number_forexam from exam;

-- -- 9. Show total number of students appearing in each subject.
select subject, student,  score,  count(student) over(partition by subject)As total_student from exam;

-- 10. Display the minimum score for each subject.
select subject, student, score from (select subject, student,  score,  min(score) over(partition by subject )As minimum_score from exam) as final_result where score = minimum_score;
 
 -- 11. Assign row numbers to employees per department by salary.
 CREATE TABLE employees (emp_name VARCHAR(50),department VARCHAR(20),salary INT);
INSERT INTO employees VALUES('Alex', 'IT', 7000),('Brian', 'IT', 7000),('Chris', 'IT', 6500),('Diana', 'HR', 6000),('Eva', 'HR', 5800);
select emp_name, department, salary, row_number() over(partition by department )As rows_number from employees;

-- 12. Rank employees per department based on salary.
select emp_name, department, salary, rank() over(partition by department order by salary desc )As rank_number from employees;

-- 13. Rank employees per department without gaps.
select emp_name, department, salary, dense_rank() over(partition by department order by salary desc )As rank_number from employees;

-- 14. Show total salary paid in each department.
select emp_name, department, salary, sum(salary) over(partition by department )As total_salary from employees;

-- 15. Display average salary of each department.
select distinct emp_name, department, salary, avg(salary) over(partition by department )As total_salary from employeesx	;

-- 16. Assign row numbers based on order date.
CREATE TABLE orderss (order_id INT,order_date DATE, amount INT);
INSERT INTO orderss VALUES(1, '2024-01-01', 100),(2, '2024-01-02', 200),(3, '2024-01-03', 150),(4, '2024-01-04', 300);
select order_id,order_date,amount, row_number() over (order by order_date asc ) as date_order from orderss;

-- 17. Calculate running total of order amounts.
select order_id,order_date,amount, sum(amount) over ( order by order_date asc ) as runningamount_order from orderss;

-- 18. Calculate moving average of last 2 orders.
select order_id,order_date,amount, avg(amount) over ( order by order_date ROWS BETWEEN 1 PRECEDING AND CURRENT ROW ) as moving_avg from orderss;

-- 19. Show maximum order amount till current row.
select order_id,order_date,amount, max(amount) over ( order by order_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) as last_currentavg from orderss;

-- 20. Display total number of orders.
select order_id,order_date,amount, count(order_id) over() as Total_order from orderss;

-- 21. Assign row numbers based on month.
CREATE TABLE monthly_sales (month VARCHAR(10), sales INT);
INSERT INTO monthly_sales VALUES('Jan', 5000),('Feb', 6000),('Mar', 5500),('Apr', 7000);
select month,sales, row_number() over(partition by month)as row_order from monthly_sales;

-- 22. Show previous month’s sales.
select month,sales, lag(sales) over(order by month)as previous_date from monthly_sales;

-- 23. Show next month’s sales.
select month,sales, lead(sales) over(order by month)as next_date from monthly_sales;

-- 24. Calculate difference from previous month’s sales.
SELECT month, sales,sales- LAG(sales) OVER (ORDER BY month) AS sales_differenc FROM monthly_sales;

-- 25. Calculate cumulative sales.
SELECT month,sales,SUM(sales) OVER (ORDER BY month ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_sales FROM monthly_sales;
