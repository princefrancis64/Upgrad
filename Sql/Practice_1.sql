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
