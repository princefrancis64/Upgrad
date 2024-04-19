create database market_star_schema;

use market_star_schema;

-- DDL STATEMENTS
-- 1.  Create a table shipping_mode_dimen having columns with their respective data types
-- (i) Ship_Mode VARCHAR(25)
-- (ii) Vehicle_Company VARCHAR(25)
-- (iii) Toll_Required BOOLEAN
create table shipping_mode_dimen(
	Ship_Mode varchar(25),
    Vehicle_Company varchar(25),
    Toll_Required boolean
);

-- 2. Make 'Ship_Mode' as the primary key in the above table
alter table shipping_mode_dimen
add constraint primary key (Ship_Mode); 

-- -----------------------------------------------------------------------------------------------------------
-- DML Statements
-- 1. Insert two rows in the table created above having the row-wise values:
insert into shipping_mode_dimen
values
	('DELIVERY TRUCK','Ashok Leyland',false),
    ('REGULAR AIR','Air India',false);
    
insert into shipping_mode_dimen(Ship_Mode,Vehicle_Company,Toll_Required)
values
('DELIVERY TRUCK','Ashok Leyland',false),
('REGULAR AIR','Air India',false);


-- 2. The above entry has an error as land vehicles do require tolls to be paid. Update the toll to 
update shipping_mode_dimen
set Toll_Required=True
where Ship_Mode = 'DELIVERY TRUCK';

-- 3. Delete the entry for Air India
delete
from shipping_mode_dimen
where Vehicle_Company = 'AIR INDIA';

-- ------------------------------------------------------------------------------------------------------------
-- Adding and deleting columns
-- 1. Add another column named 'Vehicle_Number' and its data type to the created table.
alter table shipping_mode_dimen
add Vehicle_number varchar(20);

select * from shipping_mode_dimen;
set sql_safe_updates=0;

-- 2. Update its value to 'MH-05-R1234'
update shipping_mode_dimen
set Vehicle_Number = 'MH-05-R1234';

