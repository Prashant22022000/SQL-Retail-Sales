--- SQl Retail Sales project

--- Creating database 

create database Project_1;

--- Create table
drop table if exists retail_sales;
Create table retail_sales(
	transactions_id	int primary key,
	sale_date date,
	sale_time time,
	customer_id  int,
	gender varchar(15),
	age	int,
	category varchar(15),
	quantiy int,
	price_per_unit float,
	cogs float,
	total_sale float
);
-----Exploratory Analysis:
select
*
from retail_sales
order by transactions_id asc

select count(*) from retail_sales




select * from retail_sales
 where 
 	transactions_id is null
	 or
	sale_date is null
	or
	sale_time is null
	or 
	customer_id is null
	or 
	gender is null
	or
	age is null
	or
	category is null
	or
	quantiy is null
	or 
	price_per_unit is null
	or
	cogs is null
	or 
	total_sale is null

--- data cleaning
select 
avg(age)
from retail_sales


update retail_sales
	set age = 41
	where age is null


delete from retail_sales
	 where 
 	transactions_id is null
	 or
	sale_date is null
	or
	sale_time is null
	or 
	customer_id is null
	or 
	gender is null
	or
	age is null
	or
	category is null
	or
	quantiy is null
	or 
	price_per_unit is null
	or
	cogs is null
	or 
	total_sale is null;

------Business Questions Answered:


---- 1 How many sales we have?
select
	count(*) as total_sales
from retail_sales;

----2  How many unique customer_id we have ?
select
	count(distinct customer_id) as customer_id
from retail_sales;

-----3 Unique category name?

select
	distinct(category)
from retail_sales;


------data analysis and business problem

------ Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

select
	*
from retail_sales
where sale_date = '2022-11-05';

---- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022?
select*
from retail_sales
	where 
	category = 'Clothing'
	and
	quantiy >= 4
	and
	to_char(sale_date,'yyyy-mm') = '2022-11';

----- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

select 
	category,
	sum(total_sale) as total_sales,
	count(*) as total_orders
from retail_sales
group by 1


---- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

select 
	round(avg(age),2) as average_age
from retail_sales
where category = 'Beauty'

---- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select*
from retail_sales
where total_sale > 1000;

---- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select
	category,
	gender,
	count(transactions_id)
from retail_sales
group by 1,2
order by 1


---- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

with Avg_sales as (
select
	extract(year from sale_date) as years,
	extract(month from sale_date) as months,
	avg(total_sale) as avg_total_sale,
	rank()over(partition by extract(year from sale_date) order by avg(total_sale) desc)  
	from retail_sales
	group by 1,2
	)
select
	*
from avg_sales
where rank = 1

------- alternative method

select
	years,
	months,
	avg_total_sales
from
(select
	extract(year from sale_date)as years,
	extract(month from sale_date)as months,
	avg(total_sale) as avg_total_sales,
	rank()over(partition by extract(year from sale_date) order by avg(total_sale) desc) as rank
from retail_sales
group by 1,2
)
where rank = 1

-----Write a SQL query to find the top 5 customers based on the highest total sales 
select
	customer_id,
	sum(total_sale)
from retail_sales
group by 1
order by 2 desc
limit 5

-------Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
select
	category,
	count(distinct customer_id)
from retail_sales
group by 1


------Q.10 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)


with shifts as (
select
	case
		when extract(hour from sale_time) < 12 then 'Morning'
		when extract(hour from sale_time) between 12 and 17 then 'afternoon'
		else 'Evening'
		end as Shift
from retail_sales
)
select
	shift,
	count(*) as total_shift
from shifts
group by 1


