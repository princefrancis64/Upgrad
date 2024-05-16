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
