use market_star_schema;

show indexes from cars;

select * from cars;


create index year_make_index
on cars(`year`,make);

alter table cars
drop index year_make_index;

alter table cars
add index new_index(color,model);

alter table cars
drop index new_index;


CREATE table `test`(
 name varchar(20),
 last_name varchar(50),
 emp_id varchar(5) primary key,
 key `last_name_idx` (`last_name`)
);


show indexes from test;


DELIMITER $$
CREATE PROCEDURE procudure_name(param_list)

BEGIN
<SQL STATEMENT>
END $$
DELIMITER ;


CALL procedure_name(argu);


DELIMITER $$
CREATE FUNCTION func_name(paramlist)
RETURNS datatype [characteristic]

BEGIN
<SQL STATEMENTS>
RETURN EXPRESSION;
END;$$
DELIMITER ;

SELECT func_name(argu);


foreign key (depid) references table(depid);

alter table vehicles
add model varchar(20) not null,
add make varchar(10) not null;

alter table vehicles
modify model smallint ,
modify color varchar(20);


alter table vehicles
change column `old` `new` datatype;

alter table vehicles 
drop column columnname;

alter table vehicles
rename to cars;


delete from customers;
truncate table customers;


with cte_name as(
sql statements
)
select *
from cte_name
where condition;


CREATE VIEW view_name AS (
SQL STATEMENTS);



RANK() OVER(PARTITION BY expression ORDER BY expression [ASC|DESC]) AS alias

window w as (order by expression [ASC|DESC]);

DELIMITER $$
CREATE FUNCTION func_name(param_list)
RETURNS datatype [characteristic]

BEGIN
<SQL STATEMENTS>
RETURN expression;

END; $$
DELIMITER ;

SELECT func_name(argu);


DELIMITER $$
CREATE PROCEDURE proc_name(param_list)

BEGIN
<SQL STATEMENTS>
END $$

DELIMITER ;

CALL proc_name(argu);

CREATE INDEX index_name
ON tabel(column1,column2,column3,....);


ALTER TABLE table_name
ADD INDEX(column1,colunm2,...);


show indexes on tablename;

alter table tablename
drop index index_name;


create table table_name(
 column1 datatype,
 column2 datatype,
 KEY `column1_idx` (column1)
 PRIMARY KEY (`column2`)
);


UPDATE tablename
SET column = column+int
WHERE condition;


DELIMITER $$
CREATE PROCEDURE proc_name(param_list)

BEGIN
<SQL STATEMENTS>

END $$
DELIMITER ;




