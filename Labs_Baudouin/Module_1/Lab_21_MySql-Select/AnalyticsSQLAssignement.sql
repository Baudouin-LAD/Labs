									-- Analytics SQL Assignment

-- PART 1
	-- SETUP
CREATE DATABASE Analytics;
USE Analytics;
CREATE TABLE users(
name VARCHAR(255) NOT NULL,
date_joined DATE NOT NULL);
CREATE TABLE purchases(
user  VARCHAR(255) NOT NULL,
date_purchased DATE NOT NULL,
item VARCHAR(255) NOT NULL,
price DECIMAL(10,2) NOT NULL);

INSERT INTO users (name, date_joined)
VALUES ('John', '2011-01-01'), ('Dave', '2009-04-02'), ('Mary', '2008-03-04');

INSERT INTO purchases (user, date_purchased, item, price)
VALUES ('John', '2011-02-04', 'SK2341', 34.54), ('John', '2012-01-04', 'LS2414', 94.98);
	-- Part 1
		-- 1.
			-- total expenditures by user (all time)
SELECT p.user, sum(p.price) as expenditure
FROM purchases p
GROUP BY p.user;
			-- total expenditure by item
SELECT p.item, sum(p.price) as expenditure
FROM purchases p
GROUP BY p.item;
			-- fraction of the customers who never have made a purchase
SELECT (COUNT(DISTINCT u.name) - COUNT(DISTINCT p.user)) / COUNT(DISTINCT u.name)
FROM users u
LEFT JOIN purchases p
ON u.name = p.user;
		-- 2.
			-- How would we tell if there’s a seasonal pattern for certain items
SELECT d.date_purchased, SUM(p.price) as sales
FROM purchases p
GROUP BY date_purchased
ORDER BY date_purchased;

-- Part 2
	-- SETUP
CREATE TABLE employees(
employee_id  INT NOT NULL,
manager_id INT,
employee_name VARCHAR(255) NOT NULL);
INSERT INTO employees (employee_id, manager_id, employee_name)
VALUES (1, 2, 'Jane'),
       (2, 3, 'Henry'),
       (3, NULL, 'Kate'),
       (4, 2, 'Moe'),
       (5, 2, 'Larry');
       
	-- 1. Write a query that will return a list of all employees and their managers (listing employees and managers by name).  Include employees with no manager in your list.
SELECT e1.employee_name as Employee, e2.employee_name as Manager
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id=e2.employee_id;

	-- 2. 
CREATE TABLE training(
training_id  INT NOT NULL,
employee_id  INT NOT NULL,
date DATE NOT NULL,
feedback INT CHECK(feedback >= 0 AND feedback <= 10) NOT NULL);
INSERT INTO training (training_id, date,feedback,employee_id)
VALUES (5,'2023-01-01',5,1),
       (4,'2023-01-02',7,2),
       (3,'2023-01-03',9,3),
       (2,'2023-01-02',6,2),
       (1,'2023-01-04',3,5);
truncate training;

	-- 3.
SET sql_mode = '';
SELECT e.employee_name, t1.date, t1.training_id, t1.feedback, t2.training_id, t2.feedback
FROM employees e
JOIN training t1 ON e.employee_id=t1.employee_id
JOIN training t2 ON t1.date=t2.date and t1.employee_id=t2.employee_id
GROUP BY t1.date, e.employee_name
HAVING COUNT(DISTINCT t1.training_id) > 1;


with employee_on_multiple_trainings as (
select e.employee_id,e.employee_name, t.date, count(*) as no_of_trainings
from employees e
join training t 
on e.employee_id=t.employee_id
group by 1,2
having count(*)>1)
select m.employee_name, t.date,t.training_id
from employee_on_multiple_trainings m
join training t
on m.employee_id=t.employee_id and m.date=t.date;

