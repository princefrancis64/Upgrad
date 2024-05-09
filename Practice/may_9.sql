-- Rank Demo
use market_star_schema;

select customer_name,
	ord_id,
    round(sales) as rounded_sales,
    rank() over(order by sales desc) as sales_rank
from market_fact_full as m
inner join cust_dimen as c
on m.cust_id = c.cust_id
where customer_name='RICK WILSON';


-- top 10 sales orders from a customer
with rank_info as(
select customer_name,
	ord_id,
    round(sales) as rounded_sales,
    rank() over(partition by customer_name order by sales desc) as sales_rank
from market_fact_full as m
inner join cust_dimen as c
on m.cust_id = c.cust_id
)select *
from rank_info
where sales_rank<=10;

-- Getting the ranks as per the discount
-- Example for Dense Rank
select customer_name,
	ord_id,
    discount,
    rank() over(order by discount desc) as disc_rank,
    dense_rank() over(order by discount desc) as disc_dense_rank,
    percent_rank() over(order by discount desc) as disc_percent_rank
from market_fact_full as m
inner join cust_dimen as c
on m.cust_id = c.cust_id
where customer_name = 'RICK WILSON';


-- Number of orders each customer has placed
select customer_name,
	count(distinct(ord_id)) as order_count,
    rank() over(order by count(distinct ord_id) desc) as order_rank,
    dense_rank() over(order by count(distinct ord_id) desc) as order_dense_rank,
    row_number() over(order by count(distinct ord_id) desc) as order_row_number
from market_fact_full as m
inner join cust_dimen as c
on m.cust_id = c.cust_id
group by customer_name;


-- Partitioning example
select ship_mode,
	month(ship_date) as shipping_month,
    count(*) as shipments
from shipping_dimen
group by ship_mode,
	shipping_month;
    
    
with shipping_summary as(
select ship_mode,
	month(ship_date) as shipping_month,
    count(*) as shipments
from shipping_dimen
group by ship_mode,
	shipping_month)
select *,
	rank() over(partition by ship_mode order by shipments desc) as shipping_rank,
    dense_rank() over(partition by ship_mode order by shipments desc) as shipping_dense_rank,
    row_number() over(partition by ship_mode order by shipments desc) as shipping_row_number
from shipping_summary;

-- alternate
select ship_mode,
	month(ship_date) as shipping_month,
    count(*) as shipments,
    rank() over(partition by ship_mode order by count(*) desc) as shipping_rank
from shipping_dimen
group by ship_mode,
	shipping_month;

-- Named window example
select ord_id,
	discount, 
    customer_name,
    rank() over w as disc_rank,
    dense_rank() over w as disc_dense_rank,
    row_number() over w as disc_row_number
from market_fact_full as m
inner join cust_dimen as c
on m.cust_id = c.cust_id
where customer_name = 'RICK WILSON'
window w as (order by discount desc); 


SELECT ord_id,
	discount,
    customer_name,
    RANK() over w as disc_rank,
    DENSE_RANK() over w as disc_dense_rank,
    ROW_NUMBER() over w as disc_row_number
from market_fact_full as m
inner join cust_dimen as c
on m.cust_id = c.cust_id
window w as (partition by customer_name order by discount desc);

-- Frames example
with daily_shipping_summary as (select ship_date,
	sum(shipping_cost) as daily_total
from market_fact_full as m
inner join shipping_dimen as s
on m.ship_id = s.ship_id
group by ship_date)
select *,
	sum(daily_total) over w1 as running_total,
    sum(daily_total) over w2 as moving_average
from daily_shipping_summary
window w1 as (order by ship_date ROWS UNBOUNDED PRECEDING),
w2 as (order by ship_date ROWS 6 PRECEDING);


-- Lead and Lag example
with cust_order as (select customer_name,
	m.ord_id,
    o.order_date
from market_fact_full as m
left join orders_dimen as o
on m.ord_id = o.ord_id
left join cust_dimen as c
on m.cust_id = c.cust_id
where customer_name = 'RICK WILSON'
group by c.customer_name,m.ord_id,o.order_date
),
next_date_summary as 
(
select *,
	LAG(order_date,1,'25-01-01') over (order by order_date,ord_id) as prev_order_date
from cust_order
order by customer_name,order_date,ord_id
)
select *,
	DATEDIFF(order_date,prev_order_date) as days_diff
from next_date_summary;



-- 2
with cust_order as(
select customer_name,
    m.ord_id,
    o.order_date
from market_fact_full as m
left join orders_dimen as o
on m.ord_id = o.ord_id
left join cust_dimen as c
on m.cust_id =c.cust_id
where customer_name = 'RICK WILSON'
group by c.customer_name,m.ord_id,o.order_date
), next_date_summary as
(
select *,
	LAG(order_date,1,'25-01-01') OVER (ORDER BY order_date,ord_id) as prev_order_date
from cust_order
order by customer_name,order_date,ord_id
    )
select *,
	DATEDIFF(order_date,prev_order_date) as days_diff
from next_date_summary;


-- CASE STATEMENTS
select market_fact_id,profit
from market_fact_full;


select market_fact_id,profit,
	CASE 
		WHEN profit <-500 THEN "Huge Loss"
        WHEN profit between -500 and 0 THEN "Bearable Loss"
        WHEN profit between 0 and 500 THEN "Decent Profit"
        WHEN profit >500 THEN "Greate Profit"
	END as profit_type
from market_fact_full;


-- Classify customers on the following criteria
-- Top 10% of customers as Gold
-- Top 40% of customers as Silver
-- Rest 50% of customers as Bronze

with cust_summary as(
select m.cust_id,c.customer_name,
	round(sum(m.sales),2) as total_sales,
    percent_rank() over(order by round(sum(m.sales),2)) as perc_rank
from market_fact_full as m
left join cust_dimen as c
on m.cust_id = c.cust_id
group by cust_id
order by total_sales desc
)select *,
	CASE 
		WHEN perc_rank>0.9 THEN "GOLD"
        WHEN perc_rank between 0.5 and 0.9 THEN "Silver" 
		else "Bronze"
	END as customer_category
from cust_summary;


-- UDF example
DELIMITER $$

CREATE FUNCTION profitType(Profit int)
RETURNS VARCHAR(30) deterministic

BEGIN
DECLARE message VARCHAR(30);
IF Profit<-500 THEN
	SET message ="Huge Loss";
ELSEIF Profit between -500 and 0 THEN
	SET message = "Bearable Loss";
ELSEIF Profit between 0 and 500 THEN
	SET message = "Decent Profit";
ELSE 
	SET message="Great Profit";
END IF;

RETURN message;
END; 
$$ DELIMITER ;

select profitType(90) as Function_output;


-- 2
DELIMITER $$

CREATE FUNCTION profitType(Profit int)
RETURNS VARCHAR(30) deterministic

BEGIN
DECLARE message VARCHAR(30);
IF Profit<-500 THEN
	SET message="Huge Loss";
ELSEIF Profit between -500 and 0 THEN
	SET message="Bearable Loss";
ELSEIF Profit between 0 and 500 THEN
	SET message = "Decent Profit";
ELSE
	SET message = "Great Profit";
END IF;

RETURN message;
END;

$$ DELIMITER ;

select profitType(1000) as Profit_Type;


-- 3
DELIMITER $$

CREATE FUNCTION profitType(Profit int)
RETURNS VARCHAR(30) determinisitc;

/*    Func Body    */
BEGIN
DECLARE message VARCHAR(30);
IF Profit<-500 THEN 
	SET message="Huge Loss";
ELSEIF Profit between -500 and 0 THEN
	SET message="Bearable Loss";
ELSEIF Profit between 0 and 500 THEN 
	SET message="Decent Profit";
ELSE
	SET message="Great Profit";
END IF;
RETURN message;
END;
$$ DELIMITER ;


select profitType(1000) as Profit_Type;


-- 4
DELIMITER $$
CREATE FUNCTION profitType(Profit int)
RETURNS VARCHAR(30) deterministic;
BEGIN
DECLARE message VARCHAR(30);
IF Profit<-500 THEN 
	SET message = "Huge Loss";
ELSEIF Profit between -500 and 0 THEN
	SET message= "Bearable Loss";
ELSEIF Profit between 0 and 500 THEN
	SET message = "Decent Profit";
ELSEIF Profit>500 THEN 
	SET message="Great Profit";
END IF;
RETURN message;
END;
$$ DELIMITER ;


select profitType(500) as Profit_Type;

-- Procedure

DELIMITER $$
CREATE PROCEDURE get_sales_customers(sales_input int)
BEGIN
select distinct m.cust_id,
		round(sales) as sales_amount,customer_name
from market_fact_full as m
inner join cust_dimen as c
on m.cust_id = c.cust_id
where round(sales)>sales_input
order by sales_amount;
END $$
DELIMITER ;

CALL get_sales_customers(500);


-- Dropping the procedure
drop procedure get_sales_customers;

-- Index Demo
CREATE TABLE market_fact_temp as 
select *
from market_fact_full;


create index filter_index on market_fact_temp(cust_id,prod_id,ship_id);

alter table market_fact_temp drop index filter_index;

-- ---------------------------------------------------------------------------------
-- Rank Demo
USE market_start_schema;

SELECT customer_name,
	ord_id,
    ROUND(sales) AS rounded_sales,
    RANK() OVER(ORDER BY sales DESC) AS sales_rank
from market_fact_full AS m
inner join cust_dimen AS c
ON m.cust_id = c.cust_id
WHERE customer_name = 'RICK WILSON';


-- Top 10 sales orders from a customer
WITH rank_info as(
SELECT customer_name,
	ord_id,
    ROUND(sales) AS rounded_sales,
    RANK() OVER(ORDER BY sales DESC) AS sales_rank
from market_fact_full AS m
inner join cust_dimen AS c
ON m.cust_id = c.cust_id
WHERE customer_name = 'RICK WILSON'
)SELECT *
FROM rank_info
WHERE sales_rank BETWEEN 5 AND 10;


-- Getting the ranks as per the discount
-- Example for Dense_Rank

SELECT customer_name,
	ord_id,
    discount,
	RANK() OVER(ORDER BY discount DESC) AS disc_rank,
    DENSE_RANK() OVER(ORDER BY discount DESC) AS disc_dense_rank
FROM market_fact_full AS m
INNER JOIN cust_dimen AS c
on m.cust_id = c.cust_id
WHERE customer_name = 'RICK WILSON';


-- Number of orders each customer has placed
SELECT customer_name,
	COUNT(DISTINCT ord_id) AS order_count,
	RANK() OVER(ORDER BY COUNT(DISTINCT ord_id) desc) AS order_rank,
    DENSE_RANK() OVER(ORDER BY COUNT(DISTINCT ord_id) DESC) AS order_dense_rank
FROM market_fact_full as m
INNER JOIN cust_dimen as c
ON m.cust_id = c.cust_id
group by customer_name;


-- Partitioning Example
select ship_mode,
	month(ship_date) as ship_month,
	count(*) as shipments
from shipping_dimen
group by ship_mode,
		ship_month;


with shipping_summary as (
select ship_mode,
	month(ship_date) as ship_month,
	count(*) as shipments
from shipping_dimen
group by ship_mode,
		ship_month)select *,
	rank() over(partition by ship_mode order by shipments desc) as shipping_rank,
    dense_rank() over(partition by ship_mode order by shipments desc) as shipping_dense_rank,
    row_number() over(partition by ship_mode order by shipments desc) as shipping_row_number
from shipping_summary;


-- named window example
select ord_id,
	discount,
	customer_name,
	rank() over w as disc_rank,
    dense_rank() over w as disc_dense_rank,
    row_number() over w as disc_row_number
from market_fact_full as m
inner join cust_dimen as c
on m.cust_id = c.cust_id
where customer_name = 'RICK WILSON'
window w as (order by discount desc);

select ord_id,
	discount,
    customer_name,
    rank() over w as disc_rank,
    dense_rank() over w as disc_dense_rank,
    row_number() over w as disc_row_number
from market_fact_full as m
inner join cust_dimen as c
on m.cust_id = c.cust_id
window w as (partition by customer_name order by discount desc);



-- Frames example
with daily_shipping_summary as (
	select ship_date,
		sum(shipping_cost) as daily_total
from market_fact_full as m
inner join shipping_dimen as s
on m.ship_id = s.ship_id
group by ship_date
	)
select *,
	sum(daily_total) over w1 as running_total,
    sum(daily_total) over w2 as moving_average
from daily_shipping_summary
window w1 as (order by ship_date rows unbounded preceding),
w2 as (order by ship_date rows 6 preceding);



with daily_shipping_summary as(
select ship_date,
	sum(shipping_cost) as daily_total
from market_fact_full as m
inner join shipping_dimen as s
on m.ship_id = s.ship_id
group by ship_date
)
select *,
	sum(daily_total) over w1 as running_total,
    sum(daily_total) over w2 as moving_average
from daily_shipping_summary
window w1 as (order by ship_date rows unbounded preceding),
w2 as (order by ship_date rows 6 preceding);


-- Lead and Lag example
with cust_order as(
select c.customer_name,
	m.ord_id,
	o.order_date
from market_fact_full as m
left join orders_dimen as o
on m.ord_id = o.ord_id
left join cust_dimen as c
on m.cust_id = c.cust_id
where customer_name = 'RICK WILSON'
group by c.customer_name,m.ord_id,o.order_date
    ),
next_date_summary as(
select *,
	LEAD(order_date,1,'2015-01-01')
    over(order by order_date,ord_id) as next_order_date
from cust_order
order by customer_name,order_date,ord_id
    )
select *,
	datediff(next_order_date,order_date) as days_diff
from next_date_summary;



with cust_order as(
select c.customer_name,
	m.ord_id,
    o.order_date
from market_fact_full as m
left join orders_dimen as o
on m.ord_id = o.ord_id
left join cust_dimen as c
on m.cust_id = c.cust_id
where customer_name = 'RICK WILSON'
group by c.customer_name,m.ord_id,o.order_date
),
next_date_summary as
(
select *,
	LAG(order_date,1,'2015-01-01') 
    over(order by order_date,ord_id) as next_order_date
from cust_order
order by customer_name,order_date,ord_id
)
select *,
	datediff(order_date,next_order_date) as days_diff
from next_date_summary;



-- case statments
select market_fact_id,profit
from market_fact_full;


select market_fact_id,profit,
	case
		when profit <-500 then "huge loss"
        when profit between -500 and 0 then "bearable loss"
        when profit between 0 and 500 then "decent profit"
        else "great profit"
	end as profit_type
from market_fact_full;


-- Classify customers on the following criteria
-- Top 10% of customers as Gold
-- Top 40% of customers as Silver
-- Rest 50% of customers as Bronze

with cust_summary as(
select m.cust_id,c.customer_name,
	round(sum(m.sales),2) as total_sales,
    percent_rank() over(order by round(sum(m.sales),2)) as perc_rank
from market_fact_full as m
left join cust_dimen as c
on m.cust_id = c.cust_id
group by cust_id
)
select *,
	case 
		when perc_rank >0.9 then "gold"
        when perc_rank between 0.5 and 0.9 then "silver"
        else "bronze"
	end as customer_segment
from cust_summary
order by total_sales desc;

-- User defined functions example

DELIMITER $$
CREATE FUNCTION profitType(Profit int)
RETURNS varchar(30) deterministic

BEGIN 
DECLARE message varchar(30);
if Profit <-500 then
	SET message="Huge Loss";
elseif Profit between -500 and 0 then
	set message="Bearble loss";
elseif Profit between 0 and 500 then
	set message='Decent Profit';
else	
	set message ="Great Profit";
end if;
return message;
END;
$$ DELIMITER ;

select profitType(1000) as Profit_Type;


-- PROCEDURE
DELIMITER $$
CREATE PROCEDURE get_sales_customers(sales_input int)
BEGIN
select distinct m.cust_id,
	round(sales) as sales_amount, customer_name
from market_fact_full as m
inner join cust_dimen as c
on m.cust_id = c.cust_id
where round(sales)>sales_input
order by sales_amount;
END $$ 
DELIMITER ;


call get_sales_customers(500);

create table market_fact_full_temp as 
select * 
from market_fact_full;
-- Index

create index filter_index on market_fact_full_temp(cust_id,ship_id,prod_id);


alter table market_fact_full_temp drop index filter_index;


