select colum1,column2
from table1 as alias1
inner join table2 as alias2
on alias1.common_col = alias2.common_col
WHERE condition;

USE market_star_schema;
SELECT * FROM employees;

SHOW INDEXES FROM employees;


CREATE UNIQUE INDEX first_name_idx
ON employees(first_name);


ALTER TABLE employees
ADD UNIQUE INDEX `first_name_idx`(first_name);

ALTER TABLE employees
DROP INDEX first_name_idx;



create table students(
roll_no int,
name varchar(30),
age int,
PRIMARY KEY(roll_no)
);

insert into students(roll_no,name,age)
values(46,'rohit',26),
(45,'prince',27),
(44,'pearl',27);


select * from students;

alter table students
drop primary key;

show indexes from students;

alter table students
add index f_name_idx (name) INVISIBLE;


select 1,2,3,4,5,6,7,8,9,10;

DROP PROCEDURE PrintNumber;

DELIMITER $$

CREATE PROCEDURE PrintNumber(IN Num INT)
BEGIN
    IF Num IS NULL THEN
        SET Num = 1;
    END IF;
    
    WHILE Num <= 10 DO
        SELECT Num;
        SET Num = Num + 1;
    END WHILE;
END$$

DELIMITER ;

CALL PrintNumber(10);


DELIMITER $$
CREATE PROCEDURE PrintNumber(IN Num INT)
BEGIN
	SET Num=1;
	WHILE Num<=10 DO
		SELECT Num;
        SET Num=Num+1;
	END WHILE;
END $$
DELIMITER ;3

CALL PrintNumber(10);


WITH RECURSIVE cte_count (n) 
AS (
      SELECT 1
      UNION ALL
      SELECT n + 1 
      FROM cte_count 
      WHERE n < 3
    )
SELECT n 
FROM cte_count;

WITH RECURSIVE print_number(n) AS(
	SELECT 1
    UNION
    SELECT n+1
    FROM print_number
    WHERE n<10
)SELECT n
FROM print_number;


WITH RECURSIVE print_number(n) AS (
	SELECT 1
    UNION
    SELECT n+1
    FROM print_number
    WHERE n<10
    )SELECT n
    FROM print_number;



SELECT ISNULL(1);


SELECT ISNULL(NULL);

SELECT ISNULL(1+NULL);

SELECT ISNULL(1/0);


select * from t1;
select * from t2;

select t2.id
from t1 right join t2 on t1.id = t2.id;


with RECURSIVE print_number(n) AS(
	SELECT 1
    UNION
    SELECT n+1
    from print_number
    where n<10
)select *
from print_number;


select * from employees;
alter table employees
drop column email;

ALTER TABLE employees
ADD email varchar(30) after last_name;



update employees
set email = concat(first_name,last_name);

update employees
set email=concat(email,'@gmail.com');


DELIMITER $$

CREATE PROCEDURE create_email_list (
	INOUT email_list TEXT
)
BEGIN
	DECLARE done BOOL DEFAULT false;
	DECLARE email_address VARCHAR(100) DEFAULT "";
    
	-- declare cursor for employee email
	DECLARE cur CURSOR FOR SELECT email FROM employees;

	-- declare NOT FOUND handler
	DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET done = true;
	
    -- open the cursor
	OPEN cur;
	
    SET email_list = '';
	
    process_email: LOOP
		
        FETCH cur INTO email_address;
        
		IF done = true THEN 
			LEAVE process_email;
		END IF;
		
        -- concatenate the email into the emailList
		SET email_list = CONCAT(email_address,";",email_list);
	END LOOP;
    
    -- close the cursor
	CLOSE cur;

END$$

DELIMITER ;


call create_email_list(@emaillist);

select @emaillist;


-- declare a cursor

DECLARE cursor_name CURSOR FOR
SELECT column1,column2
FROM your_table
WHERE your_condition;

-- open the cursor
OPEN cursor_name;


FETCH cursor_name INTO variable1, variabel2;

-- process the data

-- close the cursor
CLOSE cursor_name;

DECLARE cursor_name CURSOR FOR 
SELECT column1,column2
FROM your_table
WHERE your_condition;

-- open the cursor
OPEN cursor_name;

FETCH cursor_name INTO variable1,variable2;


CLOSE cursor_name;

DECLARE cursor_name CURSOR FOR 
SELECT column1,column2
FROM your_table
WHERE your_condition;

OPEN cursor_name;

FETCH cursor_name INTO variable1,variable2;
CLOSE cursor_name;



DECLARE cursor_name CURSOR FOR 
SELECT column1,column2
FROM your_table
WHERE your_condition;
OPEN cursor_name;
FETCH cursor_name INTO variabel1,variable2;
CLOSE cursor_name;


-- declare a cursor
DECLARE cursor_name CURSOR FOR
SELECT column1,column2
FROM your_table
WHERE your_condition;
-- open the cursor
OPEN cursor_name;
-- fetch the cursor
FETCH cursor_name INTO variable1,variable2;
-- close the cursor
CLOSE cursor_name;

DECLARE cursor_name CURSOR FOR
SELECT column1,column2
FROM your_table
WHERE your_condition;

OPEN cursor_name;
FETCH cursor_name INTO variable1,variable2;
CLOSE cursor_name;


DECLARE cursor_name CURSOR FOR 
SELECT column1,column2
FROM your_table
WHERE your_condition;
OPEN cursor_name;
FETCH cursor_name INTO variable1,variable2;
CLOSE cursor_name;

DECLARE cursor_name CURSOR FOR
SELECT column1,column2
FROM your_table
WHERE your_condition;
OPEN cursor_name;
FETCH cursor_name INTO variable1,variable2;
CLOSE cursor_name;

DECLARE CONTINUE HANDLE FOR NOT FOUND SET finished=1;


DECLARE cursor_name CURSOR FOR
SELECT column1,column2
FROM your_table
WHERE your_condition;
OPEN cursor_name;
FETCH cursor_name INTO variable1,variable2;
CLOSE cursor_name;

SELECT ISNULL(NULL);

with recursive print_number(n) as(
	SELECT 1
    union
    select n+1
    from print_number
    where n<10
)select n
from print_number;


with recursive print_number (n) as (
	select 1
    union
    select n+1
    from print_number
    where n<10
)select n
from print_number;


create schema dbs;



drop schema dbs;


with recursive print_number(n) as(
	select 1
    union
    select n+1
    from print_number
    where n<10
)select n
from print_number;


with recursive print_number(n) as(
	select 1
    union
    select n+1
    from print_number
    where n<10
)select n
from print_number;


DECLARE cursor_name CURSOR FOR 
SELECT column1,column2
FROM your_table
WHERE your_condition;
OPEN cursor_name;
FETCH cursor_name INTO variable1,variable2;
CLOSE cursor_name;


-- UDF
DELIMITER $$

CREATE FUNCTION func_name(paramlist)
RETURNS datatype [characteristic]

BEGIN
	<SQL STATEMENTS>
    RETURN expression;
END;$$

DELIMITER ;


-- PROCEDURE
DELIMITER $$
CREATE PROCEDURE procedure_name(param_list)
BEGIN
	<SQL STATEMENTS>
END $$
DELIMITER ;


DECLARE cursor_name CURSOR FOR
SELECT column1,column2
FROM your_table
WHERE your_condition;
OPEN cursor_name;
FETCH cursor_name INTO variable1,variabel2;
CLOSE cursor_name;


ALTER TABLE table_name
ADD columnname DATATYPE NOT NULL;

ALTER TABLE vehicles
ADD color VARCHAR(50),
ADD note VARCHAR(255);


ALTER TABLE vehicles
MODIFY note VARCHAR(100) NOT NULL;


ALTER TABLE vehicles
MODIFY year SMALLINT NOT NULL,
MODIFY color VARCHAR(20) NULL AFTER make;	

ALTER TABLE vehicles
CHANGE COLUMN note VehicleCondition VARCHAR(100) NOT NULL;


ALTER TABLE vehicles
DROP COLUMN vehicleCondition;


ALTER TABLE vehicles
RENAME TO cars;


DELETE FROM CUSTOMERS
WHERE Country='Norway';


DELETE FROM customers;

DROP TABLE table_name;

TRUNCATE TABLE vehicles;
DELETE FROM vehicles;

DECLARE cursor_name CURSOR FOR
SELECT column1,column2
FROM your_table
WHERE your_condition;

OPEN cursor_name;
FETCH cursor_name INTO variable1,variable2;
CLOSE cursor_name;



CREATE INDEX index_name
ON table(column1,column2,column3);

ALTER TABLE table_name
ADD INDEX indexname(column1,column2);


ALTER TABLE table_name
DROP INDEX index_name;

CREATE TRIGGER trigger_name
{BEFORE|AFTER}{INSERT|UPDATE|DELETE}
ON table_name
FOR EACH ROW
BEGIN
	-- Trigger Body(Sql statements)
END;

CREATE TRIGGER trigger_name
{BEFORE|AFTER}{INSERT|UPDATE|DELETE}
ON table_name
FOR EACH ROW
BEGIN
  -- Trigger body(SQL statements)
END;


CREATE TRIGGER trigger_name
{BEFORE|AFTER}{INSERT|UPDATE|DELETE}
ON table_name
FOR EACH ROW
BEGIN
	-- Trigge body(sql statements)
END;

CREATE TRIGGER trigger_name
{BEFORE|UPDATE}{INERT|UPDATE|DELETE}
ON table_name
FOR EACH ROW
BEGIN
	<SQL STATEMENTS>
END;


DECLARE cursor_name CURSOR FOR
SELECT column1,column2
FROM your_table
WHERE your_condition;
OPEN cursor_name;
FETCH cursor_name INTO variable1,variable2;
CLOSE cursor_name;

DECLARE CONTINUE HANDLER 
FOR NOT FOUND SET finished=1;


DELIMITER $$
CREATE PROCEDURE procedure_name(<Paramlist>)
BEGIN
 <SQL STATEMENTS>
END $$
DELIMITER ;
CALL procedure_name(argu);

DELIMITER $$
CREATE FUNCTION func_nmae(<paramlist>)
RETURNS datatype [characteristic]

BEGIN
	<SQL STATEMENTS>
    RETURN expression;
END; $$
DELIMITER ;


SELECT 
	CASE 
		WHEN condition1 THEN result
        WHEN conditon2 THEN result2
        ELSE result3
	END AS alias;


CREATE TABLE Deparment(
	DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);


CREATE TABLE Employee(
	EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);


select * from employees;
describe employees;

ALTER TABLE employees
MODIFY COLUMN employee_id INT;

DELETE FROM Customers;
TRUNCATE TABLE Customers;
DROP TABLE Customers;

FOREIGN KEY (column) tablename(column);

ALTER TABLE vehicles
ADD model VARCHAR(100) NOT NULL;

ALTER TABLE vehicles
ADD color VARCHAR(50),
ADD note VARCHAR(55);

ALTER TABLE vehicles
MODIFY note VARCHAR(100) NOT NULL;

ALTER TABLE vehicles
MODIFY year SMALLINT NOT NULL,
MODIFY color VARCHAR(20) NULL AFTER make;

ALTER TABLE vehicles
CHANGE COLUMN note vehicleCondition VARCHAR(100) NOT NULL;

ALTER TABLE vehicles
DROP COLUMN vehicleCondition;

ALTER TABLE vehicles
RENAME TO cars;

DELETE FROM Customers;
DELETE FROM Customers
WHERE Country='Norway';

DELIMITER $$

CREATE FUNCTION func_name(param_list)
RETURNS datatype [characteristic]

BEGIN
	<SQL STATEMENTS>
    RETURN expression;
END; $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE procedure_name(param_list)
BEGIN
	<SQL STATEMENTS>
END $$
DELIMITER ;

CALL procedure_name(argu);


DECLARE cursor_name CURSOR FOR
SELECT column1,column2
FROM your_table
WHERE your_condition;
OPEN cursor_name;
FETCH cursor_name INTO variable1,variable2;
CLOSE cursor_name;

DECLARE CONTINUE HANDLER
FOR NOT FOUND SET variable=1;


CREATE INDEX index_name
ON TABLE (column1,column2);


ALTER TABLE table_name
ADD INDEX index_name(column1,column2);


ALTER TABLE table_name
DROP INDEX index_name;

CREATE INDEX last_name_first_name_idx
ON employees(last_name,firsT_name);

SHOW INDEXES FROM table_name;

CREATE UNIQUE INDEX index_name
ON table(column1,column2);

ALTER TABLE tablename
ADD INDEX index_name(column1,column2);

CREATE TABLE tablename(
	column1 data_type PRIMARY KEY,
    column2 datatype,
    UNIQUE INDEX `index_name`(column2),
    PRIMARY KEY(column1)
);

CREATE TRIGGER trigger_name
{BEGIN|AFTER} {INSERT|UPDATE|DELETE}
ON table_name
FOR EACH ROW
BEGIN
	-- trigger body sql statements
END;

CREATE TRIGGER trigger_name
{BEGIN|AFTER}{INSERT|UDPATE|DELETE}
ON table_name
FOR EACH ROW
BEGIN
	-- SQL STATEMENTS
END;



CREATE TRIGGER trigger_name
{BEGIN|AFTER}{INSERT|UDPATE|DELETE}
ON table_name
FOR EACH ROW
BEGIN
	-- SQL STATEMENTS 
END;



CREATE TRIGGER trigger_name
{BEGIN|AFTER}{INSERT|UPDATE|DELETE}
ON table_name
FOR EACH ROW
BEGIN
	-- SQL STATEMENTS
END;

WITH RECURSIVE print_number(n) AS(
	SELECT 1
    UNION
    SELECT n+1
    FROM print_number
    WHERE n<10
)SELECT n
FROM print_number;


select Customer_Name as "Customer Full Name", City "Customer City",State "Customer State"
from cust_dimen;


select Customer_Name as "Customer Full Name", City as "Customer_City" , State "Customer_State"
FROM cust_dimen;

DELIMITER $$
CREATE FUNCTION profitType2(Profit INT)
RETURNS VARCHAR(30) DETERMINISTIC
BEGIN
	DECLARE message VARCHAR(30);
    IF Profit<-500 THEN 
		SET message='Huge Loss';
	ELSEIF Profit BETWEEN -500 AND 0 THEN
		SET message='bearable Loss';
	ELSEIF Profit BETWEEN 0 AND 500 THEN 
		SET message='Decent Profit';
	ELSE SET message='Huge Profit';
	END IF;
	RETURN message;
END;$$
DELIMITER ;


SELECT profitType2(-600);


DELIMITER $$
CREATE PROCEDURE get_sales_customers2(IN sales_input INT)
BEGIN
	SELECT DISTINCT m.Cust_id,ROUND(Sales) AS sales_amount,Customer_Name
    FROM market_fact_full AS m INNER JOIN cust_dimen AS c
    ON m.Cust_id = c.Cust_id
    WHERE ROUND(Sales)>sales_input;
END $$
DELIMITER ;


CALL get_sales_customers2(500);

SELECT Customer_Name,City,Customer_Segment
FROM cust_dimen
WHERE City='Mumbai' AND Customer_Segment='Corporate';


select *
from cust_dimen
where State in ('Tamil Nade','Karnataka', 'Kerala','Telengana');


SELECT *
FROM cust_dimen
WHERE State in ('Tamil Nadu','Karnatak','Kerala','Telengana');

SELECT *
FROM cust_dimen
WHERE Customer_Segment!='Small Business';

SELECT Ord_id, Shipping_Cost
FROM market_fact_full
WHERE Ord_id like '%\_5%' AND Shipping_Cost BETWEEN 10 and 15;

SELECT Ord_id,Shipping_Cost
FROM market_fact_full
WHERE Ord_id LIKE '%\_5%';

SELECT City
FROM cust_dimen
WHERE City LIKE 'K%';

select count(Customer_Name) as City_Wise_Customers,City
from cust_dimen
group by City;


SELECT COUNT(Customer_Name) AS City_Wise_Customers,City
FROM cust_dimen
GROUP BY City;


SELECT COUNT(Customer_Name) AS City_Wise_Customers,City
FROM cust_dimen
GROUP BY City
ORDER BY City_Wise_Customers;


SELECT substring('Prince',1,3);

SELECT SUBSTRING_INDEX('Prince','n',-1);

DESCRIBE shipping_dimen;

INSERT INTO shipping_dimen(Ship_id,`Ship_Date`) VALUES('100','2024-05-17');

SELECT Customer_name
FROM cust_dimen
WHERE Customer_Name REGEXP 'car';


SELECT Customer_Name
FROM cust_dimen
WHERE Customer_Name REGEXP '^[abcd].*er$';

SELECT Customer_Name
FROM cust_dimen
WHERE Customer_Name REGEXP '^[pr]';


SELECT Customer_Name
FROM cust_dimen
WHERE Customer_Name REGEXP '.*sch.*';


SELECT Ord_id,Sales,ROUND(Sales) AS Rounded_Sales
FROM market_fact_full
WHERE Sales=(SELECT MAX(Sales)
FROM market_fact_full);



WITH least_losses AS (
	SELECT Prod_id, Profit,Product_Base_Margin
    FROM market_fact_full
    WHERE Profit<0
    ORDER by Profit DESC
    limit 5)SELECT *
    FROM least_losses;



WITH RECURSIVE print_number(n) AS (
	SELECT 1
    UNION 
    SELECT n+1
    FROM print_number
    WHERE n<10
	
)SELECT n
FROM print_number;

CREATE VIEW order_info AS
(SELECT Ord_id,Sales,Order_Quantity,Profit,Shipping_Cost
FROM market_fact_full);

select Customer_Name,
		Ord_id,
		discount,
        Rank() over(order by discount desc) as disc_rank,
        Dense_Rank() over(order by discount desc) as disc_dense_rank,
        Percent_Rank() over(order by discount desc) as disc_percent_rank
from market_fact_full m
inner join cust_dimen c
on m.Cust_id = c.Cust_id
where Customer_Name = 'RICK WILSON';


with cust AS(SELECT Customer_Name,
	Ord_id,
    discount,
    RANK() OVER(ORDER BY discount DESC) AS disc_rank,
    DENSE_RANK() OVER(ORDER BY discount DESC) AS disc_dense_rank,
    PERCENT_RANK() OVER(ORDER BY discount ) AS disc_percent_rank
FROM market_fact_full INNER join cust_dimen 
USING(Cust_id)
where Customer_Name='RICK WILSON')
SELECT *,
	CASE
		WHEN disc_percent_rank >0.9 THEN "Gold"
        WHEN disc_percent_rank BETWEEN 0.5 AND 0.9 THEN "Silver"
        ELSE "Bronze"
	END AS Cust_Type
FROM cust;


with shipping_summary as (
select Ship_Mode,
		Month(Ship_Date) as shipping_month,
        count(*) as shipments
from shipping_dimen
group by Ship_Mode,
		shipping_month
)



CREATE TRIGGER trigger_name
{BEFOER|AFTER}{INSERT|UPDATE|DELETE}
ON table_name
FOR EACH ROW
BEGIN
	<SQL STATEMENT>
END;

CREATE TRIGGER trigger_name
{BEFORE|AFTER}{INSERT|UDPATE|DELETE}
ON table_name
FOR EACH ROW
BEGIN
	<SQL STATEMENTS>
END;


CREATE TRIGGER trigger_name
{BEFORE|AFTER}{INSERT|UPDATE|DELETE}
ON table_name
FOR EACH ROW
BEGIN
	<SQL STATEMENTS>
END;

CREATE TRIGGER trigger_name
{BEFORE|AFTER}{INSERT|UPDATE|DELETE}
ON table_name
FOR EACH ROW
BEGIN
	<SQL STATEMENTS>
END;


DECLARE cursor_name CURSOR FOR
SELECT column1,column2
FROM table
WHERE your_condition;
OPEN cursor_name;
FETCH cursor_name INTO variable1,variable2;
CLOSE cursor_name;


DECLARE CONTINUE HANDLER
FOR NOT FOUND SET variable=1;


DELIMITER $$
CREATE PROCEDURE procedure_name(param_list)
BEGIN
	<SQL STATEMENTS>
END $$
DELIMITER ;


CALL procedure_name(arg);



DELIMITER $$
CREATE FUNCTION fun_name(paramlist)
RETURNS data_type [CHARACTERISTIC]
BEGIN
 <SQL STATEMENTS>
 RETURN expression;
END ;$$
DELIMITER ;

SELECT fun_name(argu)

CREATE INDEX index_name
ON table(column1,column2,column3);


ALTER TABLE tablename
ADD INDEX index_name(column1,column2);


CREATE TABLE tablename(
	column1 data 	type PRIMARY KEY,
    column2 datatype,
    column2 datatype
    KEY|INDEX `index_name`(column2,column3)
);


WITH RECURSIVE print_number(n) AS(
	SELECT 1
    UNION
    SELECT n+1
    FROM print_number
    WHERE n<10
)SELECT n
FROM print_number;


FOREIGN KEY (column) REFERENCES table(column);
FOREIGN KEY (column) REFERENCES table(column);
FOREIGN KEY(column) REFERENCES table(column);
FOREIGN KEY(column) REFERENCES table(column);

ALTER table vehicles
ADD column_name data_type not null;

ALTER TABLE vehicles
ADD column_name datatype,
ADD column_name datatype;


ALTER TABLE vehicles
MODIFY column_name data_type;

ALTER TABLE table_name
MODIFY column_name datatype,
MODIFY column_name datatype;

ALTER TABLE table_name
CHANGE COLUMN old new_co_name datatype;

ALTER TABLE table_name
DROP COLUMN columnname;

ALTER TABLE table_name
RENAME TO table_name2;

DELETE FROM table_name;
DELETE FROM table_name WHERE condition;

TRUNCATE TABLE table_name;

SELECT 
FROM 
JOIN 
WHERE 
GROUP BY 
HAVING
WINDOW
ORDER BY
LIMIT
;


with daily_shipping_summary as (select Ship_Date,
	sum(Shipping_Cost) as daily_total
from market_fact_full as m
inner join shipping_dimen as s
on m.Ship_id = s.Ship_id
group by Ship_Date)
select *,
	sum(daily_total) over w1 as running_total,
    avg(daily_total) over w2 as moving_average
from daily_shipping_summary
window w1 as (order by Ship_Date ROWS UNBOUNDED PRECEDING),
w2 as (order by Ship_Date ROWS 6 PRECEDING);


WITH daily_shipping_summary AS (
SELECT Ship_Date,SUM(Shipping_Cost) AS daily_total
FROM market_fact_full AS m
INNER join shipping_dimen AS s
ON m.Ship_id = s.Ship_id
GROUP BY Ship_Date)
SELECT *,
	SUM(daily_total) OVER w1 AS running_total,
    SUM(daily_total) OVER w2 AS moving_average
FROM daily_shipping_summary
WINDOW w1 AS (ORDER BY Ship_Date ROWS UNBOUNDED PRECEDING),
w2 AS (ORDER BY Ship_Date ROWS 6 PRECEDING);


CREATE VIEW days_of_week(`day`) AS
	SELECT "Mon"
    UNION
    SELECT "Tue"
    UNION
    SELECT "Wed"
    UNION
    SELECT "Thurs"
    UNION
    SELECT "Fri"
    UNION
    SELECT "Sat"
    UNION
    SELECT "Sun";


SELECT *
FROM days_of_week;


CREATE VIEW days_of_week(`DAYS`) AS
	SELECT "Mon"
    UNION
    SELECT "Tue"
    UNION
    SELECT "Wed"
    UNION
    SELECT "Thurs"
    UNION
    SELECT "Fri"
    UNION
    SELECT "Sat"
    UNION
    SELECT "Sun";
    
SELECT `DAYS`
FROM days_of_week;



WITH cust_order AS (SELECT c.Customer_Name,
	m.Ord_id,
    o.Order_Date
FROM market_fact_full AS m
LEFT JOIN orders_dimen o
ON m.Ord_id = o.Ord_id
LEFT JOIN cust_dime AS c
ON m.Cust_id = c.Cust_id
WHERE Customer_name = 'RICK WILSON'
GROUP BY c.Customer_Name,m.Ord_id,o.Order_Date),
next_date_summary AS (
	SELECT *, LEAD(Order_Date,1,'2015-01-01') OVER (ORDER BY Order_Date) AS next_date
    FROM cust_order
    ORDER BY Customer_name,Order_Date,Ord_id
)SELECT *,DATEDIFF(next_date,Order_Date) AS days_difference
FROM next_date_summary;




CREATE TRIGGER trigger_name
{BEFORE|AFTER} {INSERT|UPDATE|DELETE}
ON table_name
FOR EACH ROW
BEGIN
	<SQL STATEMENTS>
END;


CREATE TRIGGER trigger_name
{BEFORE|AFTER}{INSERT|UPDATE|DELETE}
ON table_name
FOR EACH ROW
BEGIN
	<SQL STATEMENTS>
END;


DECLARE cursor_name CURSOR FOR
SELECT column1,column2
FROM table_name
WHERE your_condition;
OPEN cursor_name;
FETCH cursor_name INTO variable1,variale2;
CLOSE cursor_name;

DELIMITER $$
CREATE PROCEDURE procedure_name(paramlist)
BEGIN
	<SQL STATEMENTS>
END $$
DELIMITER ;

CALL procedure_name(arg);


DELIMITER $$
CREATE PROCEDURE proced_name(param_list)
BEGIN
	<SQL STATEMENT>
END $$
DELIMITER ;



DELIMITER $$
CREATE FUNCTION func_name(paramlist)
RETURNS datatype [characteristic]
BEGIN
	<SQL STATEMENTS>
    RETURN expression;
END ; $$
DELIMITER ;

DECLARE cursor_name CURSOR FOR
SELECT column1,column2
FROM your_table
WHERE your_condition;
OPEN cursor_name;
FETCH cursor_name INTO variable1,variable2;
CLOSE cursor_name;

DECLARE CONTINUE HANDLER 
FOR NOT FOUND SET variable=1;


CREATE TRIGGER trigger_name
{BEFORE|AFTER}{INSERT|UPDATE|DELETE}
ON table_name
FOR EACH ROW
BEGIN
	<SQL STATEMENTS>
END;


USE market_star_schema;


CREATE TRIGGER trigger_name
{BEFORE|AFTER}{INSERT|UPDATE|DELETE}
ON table_name
FOR EACH ROW
BEGIN
	<SQL STATEMENT>
END;

ALTER TABLE table_name
ADD INDEX index_name(column1,column2);

CREATE INDEX index_name
ON table(column1,column2);


CREATE UNIQUE INDEX index_name
ON table(column1,column2);




WITH cust_order AS (SELECT c.Customer_Name,
	m.Ord_id,
    o.Order_Date
FROM market_fact_full AS m
LEFT JOIN orders_dimen AS o
ON m.Ord_id = o.Ord_id
LEFT JOIN cust_dimen AS c
ON m.Cust_id = c.Cust_id
WHERE Customer_Name='RICK WILSON'
GROUP BY c.Customer_Name,m.Ord_id,o.Order_Date)
,next_date_summary AS(
	SELECT *,
    LEAD(Order_Date,1,'2015-01-01') OVER (ORDER BY Order_Date) AS next_order_date	
    FROM cust_order
)SELECT *, DATEDIFF(next_order_date,Order_Date) AS DIFF
FROM next_date_summary;

