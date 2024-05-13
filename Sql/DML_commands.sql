SET SQL_SAFE_UPDATES = 0;


-- -----------------------------------------------------------------------------------------------------------------
-- Session: Querying in SQL
-- Basic SQL Queries

-- 1. Print the entire data of all the customers.
select *
from cust_dimen;

-- 2. List the names of all the customers.
select `Customer Name`
from cust_dimen;
-- 3. Print the name of all customers along with their city and state.
select Customer_Name,City,State
from cust_dimen;

select Customer_Name as "Customer Full Name", City "Customer City",State "Customer State"
from cust_dimen;

-- Applying a filter
select Customer_Name as "Customer Full Name", City "Customer City",State "Customer State"
from cust_dimen
where State = 'West Bengal';

select Customer_Name as "Customer Full Name", City "Customer City",State "Customer State"
from cust_dimen
where State = 'West Bengal' and City ='Kolkata';

-- 4. Print the total number of customers.
select count(*) as Total_Customers
from cust_dimen;

-- 5. How many customers are from West Bengal?
select count(*) as Bengal_Customers
from cust_dimen
where State = 'West Bengal';

-- 6. Print the names of all customers who belong to West Bengal.
select Customer_Name 
from cust_dimen
where State='West Bengal';

-- -----------------------------------------------------------------------------------------------------------------
-- Operators

-- 1. Print the names of all customers who are either corporate or belong to Mumbai.
select Customer_Name, City, Customer_Segment
from cust_dimen
where City = 'Mumbai' or Customer_Segment = 'Corporate';

-- 2. Print the names of all corporate customers from Mumbai.
select Customer_Name, City, Customer_Segment
from cust_dimen
where City = 'Mumbai' and  Customer_Segment = 'Corporate';

-- 3. List the details of all the customers from southern India: namely Tamil Nadu, Karnataka, Telangana and Kerala.
select *
from cust_dimen
where State in ('Tamil Nade','Karnataka', 'Kerala','Telengana');

-- 4. Print the details of all non-small-business customers.
select *
from cust_dimen
where Customer_Segment!='Small Business';
-- 5. List the order ids of all those orders which caused losses.
select Ord_id, Profit
from market_fact_full
where Profit<0;

-- 6. List the orders with '_5' in their order ids and shipping costs between 10 and 15.
select Ord_id, Shipping_Cost
from market_fact_full
where Ord_id like '%\_5%' and Shipping_Cost between 10 and 15;

select Ord_id, Shipping_Cost
from market_fact_full
where Ord_id like '%\_5%';

select City
from cust_dimen
where City like 'K%';


-- -----------------------------------------------------------------------------------------------------------------
-- Aggregate Functions

-- 1. Find the total number of sales made.
select count(Sales) as No_of_Sales
from market_fact_full;

select count(*) as No_of_Sales
from market_fact_full;

-- 2. What are the total numbers of customers from each city?
select count(Customer_Name) as City_Wise_Customers,City
from cust_dimen
group by City;

select count(Customer_Name) as City_Wise_Customers,City,Customer_Segment
from cust_dimen
group by City,Customer_Segment;

-- 3. Find the number of orders which have been sold at a loss.
select count(Ord_id) as Loss_Count
from market_fact_full
where Profit<0;

-- 4. Find the total number of customers from Bihar in each segment.
select count(Customer_name) as Segment_Wise_Customers , State, Customer_Segment
from cust_dimen
where State = 'Bihar'
group by Customer_Segment;

-- 5. Find the customers who incurred a shipping cost of more than 50.
select * from market_fact_full;
select count(Cust_id)
from market_fact_full
where Shipping_Cost>50;

-- -----------------------------------------------------------------------------------------------------------------
-- Ordering

-- 1. List the customer names in alphabetical order.
select Customer_Name
from cust_dimen
order by Customer_Name;

select distinct Customer_Name
from cust_dimen
order by Customer_Name desc;

select * from cust_dimen;

select Customer_Name,Customer_Segment,City
from cust_dimen
order by Customer_Segment,City ;

select Customer_Name,Customer_Segment,City
from cust_dimen
order by City,Customer_Segment;

-- 2. Print the three most ordered products.
select Prod_id, sum(Order_Quantity) as Total_Orders
from market_fact_full
group by Prod_id
order by sum(Order_Quantity) desc
limit 3;

select Prod_id, sum(Order_Quantity)
from market_fact_full
group by Prod_id
having sum(Order_Quantity) > 50
order by sum(Order_Quantity) desc;



-- 3. Print the three least ordered products.
select Prod_id, sum(Order_Quantity) as Total_Orders
from market_fact_full
group by Prod_id
order by sum(Order_Quantity)
limit 3; 

-- 4. Find the sales made by the five most profitable products.
select * from market_fact_full;

select Prod_id,sum(Sales)
from market_fact_full
group by Prod_id 
order by sum(Sales) desc
limit 5;

-- 5. Arrange the order ids in the order of their recency.
select * from market_fact_full;
select Ord_id from market_fact_full order by Prod_id;

-- 6. Arrange all consumers from Coimbatore in alphabetical order.
select * from cust_dimen;
select Customer_Name, City
from cust_dimen
where City='Coimbatore';

-- -----------------------------------------------------------------------------------------------------------------
-- String and date-time functions

-- 1. Print the customer names in proper case.
select Customer_Name from cust_dimen;

select substring(Customer_Name,1,1)
from cust_dimen;

select concat(upper(substring(Customer_Name,1,1)), lower(substring(substring_index(Customer_Name,' ',1),2)),' ',
upper(substring(substring_index(Customer_Name,' ',-1),1,1)),lower(substring(substring_index(Customer_Name,' ',-1),2)))
from cust_dimen;



-- 2. Print the product names in the following format: Category_Subcategory.
select Product_Category, Product_Sub_Category,
concat(Product_Category,'_',Product_Sub_Category) as Product_Name
from prod_dimen;


-- 3. In which month were the most orders shipped?
select count(Ship_id) as Ship_Count,month(Ship_Date) as Ship_Month
from shipping_dimen
group by Ship_Month
order by Ship_Count desc
limit 1;


-- 4. Which month and year combination saw the most number of critical orders?
select count(Order_id) as Order_Count,month(Order_Date) as Order_Month,
year(Order_Date) as Order_Year
from orders_dimen
where Order_Priority='Critical'
group by Order_Year,Order_Month
order by Order_Count desc;

select * from orders_dimen;

-- 5. Find the most commonly used mode of shipment in 2011.
select * from shipping_dimen;

select count(Ship_Mode), Ship_Mode
from shipping_dimen
where year(Ship_Date)=2011
group by Ship_Mode;

-- -----------------------------------------------------------------------------------------------------------------
-- Regular Expressions

-- 1. Find the names of all customers having the substring 'car'.
select Customer_Name
from cust_dimen
where Customer_Name regexp 'car';

select Customer_Name
from cust_dimen
where Customer_Name like 'car%';

-- 2. Print customer names starting with A, B, C or D and ending with 'er'.
select Customer_Name
from cust_dimen
where Customer_Name regexp '^[abcd].*er$';
-- ^ starting
-- $ ending of the string

select Customer_Name
from cust_dimen
where Customer_Name regexp '^[pr]';

select Customer_Name
from cust_dimen
where Customer_Name regexp '.*sch.*';
-- -----------------------------------------------------------------------------------------------------------------
-- Nested Queries

-- 1. Print the order number of the most valuable order by sales.
select * from market_fact_full;

select Ord_id, Sales, round(Sales) as Rounded_Sales
from market_fact_full
where Sales=(
	select max(Sales)
    from market_fact_full
);



-- 2. Return the product categories and subcategories of all the products which don’t have details about the product
-- base margin.
select * from market_fact_full;

select Prod_id from market_fact_full where Product_Base_Margin is null;

select *
from prod_dimen
where Prod_id in(
	select Prod_id
    from market_fact_full 
    where Product_Base_Margin is null
	);
-- 3. Print the name of the most frequent customer.
select Customer_Name, Cust_id
from cust_dimen
where Cust_id = (
	select Cust_id
    from market_fact_full
    group by Cust_id
    order by count(Cust_id) desc
    limit 1
    );
    
-- 4. Print the three most common products.
select Product_Category, Product_Sub_Category
from prod_dimen
where Prod_id in (
	select Prod_id
    from market_fact_full
    group by Prod_id
    order by count(Prod_id) desc
)
limit 3;

-- -----------------------------------------------------------------------------------------------------------------
-- CTEs

-- 1. Find the 5 products which resulted in the least losses. Which product had the highest product base
-- margin among these?
select Prod_id, Profit, Product_Base_Margin
from market_fact_full
where Profit<0
order by Profit desc
limit 5;

with least_losses as (
	select Prod_id, Profit, Product_Base_Margin
	from market_fact_full
	where Profit<0
	order by Profit desc
	limit 5)select *
    from least_losses
    where Product_Base_Margin=(
		select max(Product_Base_Margin)
        from least_losses
);

-- 2. Find all low-priority orders made in the month of April. Out of them, how many were made in the first half of
-- the month?
select Order_id, Order_Date, Order_Priority
from orders_dimen
where Order_Priority='low' and month(Order_Date)=4;

with low_priority_orders as(
select Order_id, Order_Date, Order_Priority
from orders_dimen
where Order_Priority='low' and month(Order_Date)=4
)select count(Order_id) as Order_Count
from low_priority_orders
where day(Order_Date) between 1 and 15;



-- -----------------------------------------------------------------------------------------------------------------
-- Views

-- 1. Create a view to display the sales amounts, the number of orders, profits made and the shipping costs of all
-- orders. Query it to return all orders which have a profit of greater than 1000.

create view order_info
as select Ord_id, Sales, Order_Quantity, Profit, Shipping_Cost
from market_fact_full;

select Ord_id,Profit
from order_info
where Profit>1000;



-- 2. Which year generated the highest profit?
select * from market_fact_full;
select * from orders_dimen;
select year(Order_Date), Profit as highest_profit
from orders_dimen o inner join market_fact_full m
on o.Order_id = m.Ord_id
where Profit=(
select max(Profit) from market_fact_full);

-- -----------------------------------------------------------------------------------------------------------------
-- Session: Joins and Set Operations
-- Inner Join

-- 1. Print the product categories and subcategories along with the profits made for each order.
select * from market_fact_full;
select * from prod_dimen;
select Ord_id,Product_Category,Product_Sub_Category,Profit
from prod_dimen p inner join market_fact_full m
on p.Prod_id = m.Prod_id; -- link field or join attribute

-- 2. Find the shipment date, mode and profit made for every single order.

select Ord_id, Profit, Ship_Mode
from market_fact_full m inner join shipping_dimen s
on m.Ship_id = s.Ship_id;

-- 3. Print the shipment mode, profit made and product category for each product.

select m.Prod_id, m.Profit, p.Product_Category,s.Ship_Mode
from market_fact_full m inner join prod_dimen p on m.prod_id = p.prod_id
inner join shipping_dimen s on m.Ship_id = s.Ship_id;

-- 4. Which customer ordered the most number of products?
select * from market_fact_full;
select * from cust_dimen;

select Customer_Name, sum(Order_Quantity)
from market_fact_full m inner join cust_dimen c
on m.Cust_id = c.Cust_id
group by Customer_Name
order by sum(Order_Quantity) desc
limit 1;

-- alternate way
select Customer_Name, sum(Order_Quantity)
from market_fact_full  inner join cust_dimen 
using (Cust_id)
group by Customer_Name
order by sum(Order_Quantity) desc
limit 1;

-- 5. Selling office supplies was more profitable in Mysore as compared to Kolkata. True or false?
select * from market_fact_full;
select * from prod_dimen;
select * from cust_dimen;

select City,sum(Profit), Product_Category
from market_fact_full m inner join prod_dimen p
using (Prod_id)
inner join cust_dimen c
on c.Cust_id = m.Cust_id
where p.Product_Category='Office Supplies' and (c.City ='Mysore' or c.City='Kolkata')
group by City
order by sum(Profit) desc;

-- alternate way
select Product_Category, City, sum(Profit) as City_Wise_Profit
from prod_dimen p
inner join market_fact_full m 
on p.Prod_id = m.Prod_id
inner join cust_dimen c
on m.Cust_id = c.Cust_id
where Product_Category='Office Supplies' and (City ='Mysore' or City='Kolkata')
group by City;

-- 6. Print the name of the customer with the maximum number of orders.
select * from market_fact_full;
select * from cust_dimen;
select count(Order_Quantity), Customer_Name
from market_fact_full inner join cust_dimen
using (Cust_id)
group by Customer_Name
order by count(Order_Quantity)desc;
-- 7. Print the three most common products.
select * from prod_dimen;
select * from market_fact_full;

select Product_Sub_Category, sum(Order_Quantity)
from market_fact_full m inner join prod_dimen p
on m.Prod_id = p.Prod_id
group by Product_Sub_Category
order by sum(Order_Quantity) desc
limit 3;

-- -----------------------------------------------------------------------------------------------------------------
-- Outer Join

-- Display the products sold by all the manufacturers using both inner join and outer join
select * from manu;

select distinct Manu_id from prod_dimen;

select Manu_Name, Prod_id, p.Manu_id
from manu m inner join prod_dimen p on m.Manu_id = p.Manu_id;

select Manu_Name, Prod_id, m.Manu_id
from manu m left join prod_dimen p on m.Manu_id = p.Manu_id;

-- How many Manufacturers are there who are not suppying any products
select count(distinct Manu_Name)
from manu m left join prod_dimen p on m.Manu_id = p.Manu_id
where p.Prod_id is null;


-- Display products sold by each of the manufacturers
select Manu_Name, count(distinct Prod_id)
from manu m left join prod_dimen p on m.Manu_id = p.Manu_id
group by Manu_Name;


-- 1. Return the order ids which are present in the market facts table.
select distinct Ord_id from market_fact_full;

-- Execute the below queries before solving the next question.
create table manu (
	Manu_Id int primary key,
	Manu_Name varchar(30),
	Manu_City varchar(30)
);

insert into manu values
(1, 'Navneet', 'Ahemdabad'),
(2, 'Wipro', 'Hyderabad'),
(3, 'Furlanco', 'Mumbai');

alter table Prod_Dimen
add column Manu_Id int;

update Prod_Dimen
set Manu_Id = 2
where Product_Category = 'technology';


-- 4. Create a view to display the customer names, segments, sales, product categories and
-- subcategories of all orders. Use it to print the names and segments of those customers who ordered more than 20
-- pens and art supplies products.
create view order_details as
(select Customer_Name,Customer_Segment,Sales, Order_Quantity,Product_Category,Product_Sub_Category
from cust_dimen c inner join market_fact_full m on c.Cust_id = m.Cust_id
inner join prod_dimen p
on m.Prod_id = p.Prod_id);

select * from order_details;



-- -----------------------------------------------------------------------------------------------------------------
-- Union, Union all, Intersect and Minus

-- 1. Combine the order numbers for orders and order ids for all shipments in a single column.
select * from shipping_mode_dimen;
(select Order_Number from orders_dimen)
union
(select Order_ID from orders_dimen);


-- 2. Return non-duplicate order numbers from the orders and shipping tables in a single column.


-- 3. Find the shipment details of products with no information on the product base margin.

-- 4. What are the two most and the two least profitable products?
(select Prod_id, sum(Profit)
from market_fact_full
group by Prod_id
order by sum(Profit) desc
limit 2)
union
(select Prod_id, sum(Profit)
from market_fact_full
group by Prod_id
order by sum(Profit)
limit 2);


-- -----------------------------------------------------------------------------------------------------------------
-- Module: Advanced SQL
-- Session: Window Functions	
-- Window Functions in Detail

-- 1. Rank the orders made by Aaron Smayling in the decreasing order of the resulting sales.

-- 2. For the above customer, rank the orders in the increasing order of the discounts provided. Also display the
-- dense ranks.

-- 3. Rank the customers in the decreasing order of the number of orders placed.

-- 4. Create a ranking of the number of orders for each mode of shipment based on the months in which they were
-- shipped. 


-- -----------------------------------------------------------------------------------------------------------------
-- Named Windows

-- 1. Rank the orders in the increasing order of the shipping costs for all orders placed by Aaron Smayling. Also
-- display the row number for each order.


-- -----------------------------------------------------------------------------------------------------------------
-- Frames

-- 1. Calculate the month-wise moving average shipping costs of all orders shipped in the year 2011.


-- -----------------------------------------------------------------------------------------------------------------
-- Session: Programming Constructs in Stored Functions and Procedures
-- IF Statements

-- 1. Classify an order as 'Profitable' or 'Not Profitable'.


-- -----------------------------------------------------------------------------------------------------------------
-- CASE Statements

-- 1. Classify each market fact in the following ways:
--    Profits less than -500: Huge loss
--    Profits between -500 and 0: Bearable loss 
--    Profits between 0 and 500: Decent profit
--    Profits greater than 500: Great profit

-- 2. Classify the customers on the following criteria (TODO)
--    Top 20% of customers: Gold
--    Next 35% of customers: Silver
--    Next 45% of customers: Bronze


-- -----------------------------------------------------------------------------------------------------------------
-- Stored Functions

-- 1. Create and use a stored function to classify each market fact in the following ways:
--    Profits less than -500: Huge loss
--    Profits between -500 and 0: Bearable loss 
--    Profits between 0 and 500: Decent profit
--    Profits greater than 500: Great profit


-- -----------------------------------------------------------------------------------------------------------------
-- Stored Procedures

-- 1. Classify each market fact in the following ways:
--    Profits less than -500: Huge loss
--    Profits between -500 and 0: Bearable loss 
--    Profits between 0 and 500: Decent profit
--    Profits greater than 500: Great profit

-- The market facts with ids '1234', '5678' and '90' belong to which categories of profits?


-- -----------------------------------------------------------------------------------------------------------------
-- Outer Join

-- 1. Return the order ids which are present in the market facts table


-- Execute the below queries before solving the next question.
create table manu(
    Manu_Id int primary key,
    Manu_name varchar(30),
    Manu_city varchar(30),
);

insert into manu values
(1,'Navneet','Ahemdabad'),
(2,'Wipro','Hyderabad'),
(3,'Furlanco','Mumbai');

alter table Prod_Dimen
add column Manu_Id int;

update Prod_dimen
set Manu_Id = 2
where Product_Category = 'technology';

-- 2. Display the products sold by all the manufacturers using both inner and outer joins


-- 3. Display the number of products sold by each manufacturer

-- --------------------------------------------------------------------------------------------------------------------------------
USE market_star_schema;

CREATE TABLE employees(
	`employee_id` VARCHAR(2) NOT NULL,
    `first_name` VARCHAR(30) NOT NULL,
    `last_name` VARCHAR(30) NOT NULL,
    `hourly_pay` DECIMAL(10,2) NOT NULL,
    `job` VARCHAR(30) NOT NULL,
    `hire_date` DATE NOT NULL,
    `supervisor_id` VARCHAR(2) DEFAULT NULL
);


-- Inserting values into the table employees
INSERT INTO `employees` VALUES
('1','Eugene','Krabs',25.50,'Manager','2023-01-02',NULL),
('2','Squidward','Tentacles',15.00,'cashier','2023-01-03','5'),
('3','Spongebob','Squarepants',12.50,'cook','2023-01-04','5'),
('4','Patrick','Star',12.50,'cook','2023-01-05','5'),
('5','Sandy','Cheeks',17.25,'asst. manager','2023-01-06','1'),
('6','Sheldon','Plankton',10.00,'janitor','2023-01-07','5');


SELECT * FROM employees;


-- Adding salary column after the hourly pay
ALTER TABLE employees
ADD COLUMN salary DECIMAL(10,2) AFTER hourly_pay;

-- Updating the salary column
UPDATE employees
SET salary = hourly_pay*2080;


-- So here we will create a trigger so that salary gets updated automatically when hourly_pay is updated
CREATE TRIGGER before_hourly_pay_update
BEFORE UPDATE ON employees
FOR EACH ROW
SET NEW.salary=(NEW.hourly_pay * 2080);


-- to show triggers
SHOW TRIGGERS;

UPDATE employees
SET hourly_pay=50
WHERE employee_id='1';

SELECT * FROM employees;

UPDATE employees
SET hourly_pay=hourly_pay+1;

-- Now we will create a trigger which kicks in when a new hourly_pay is added
DELETE FROM employees
WHERE employee_id='6';

CREATE TRIGGER before_hourly_pay_insert
BEFORE INSERT on employees
FOR EACH ROW
SET NEW.salary = (NEW.hourly_pay*2080);

INSERT INTO employees VALUES
('6','Sheldon','Plankton',10,NULL,'janitor','2023-01-07','5');
SELECT * FROM employees;

-- CREATING A NEW TABLE
CREATE TABLE expenses(
	expense_id INT PRIMARY KEY,
    expense_name VARCHAR(50),
    expense_total DECIMAL(10,2)
    );
    
    
INSERT INTO expenses VALUES
(1,'salaries',0),
(2,'supplies',0),
(3,'taxes',0);

SELECT * FROM expenses;

UPDATE expenses
SET expense_total = (SELECT SUM(salary) FROM employees)
WHERE expense_name ='salaries'; 

CREATE TRIGGER after_salary_delete
AFTER DELETE ON employees
FOR EACH ROW
UPDATE expenses
SET expense_total=expense_total - OLD.salary
WHERE expense_name='salaries';


DELETE FROM employees
WHERE employee_id='6';


-- Create a trigger which updates the salary whenever we add a new employee
DROP TRIGGER after_salary_insert;

CREATE TRIGGER after_salary_insert
AFTER INSERT ON employees
FOR EACH ROW
UPDATE expenses
SET expense_total = expense_total+NEW.salary
WHERE expense_name = 'salaries';

INSERT INTO employees
VALUES('6','Sheldon','Plankton',10,NULL,'janitor','2023-01-07','5');


-- Creating a trigger which will update the expense_total when we update the salary
DROP TRIGGER after_salary_update;

CREATE TRIGGER after_salary_update
AFTER UPDATE ON employees
FOR EACH ROW
UPDATE expenses
SET expense_total=expense_total+(NEW.salary-OLD.salary)
WHERE expense_name = 'salaries';

SELECT * FROM employees;

UPDATE employees
SET hourly_pay=100
WHERE employee_id='1';


SELECT * FROM expenses;