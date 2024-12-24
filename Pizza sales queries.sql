create database Pizza_dB;
use pizza_db;
select count(*) from pizza_Sales;
select * from pizza_Sales;

-- Duplicate check 
select pizza_id,count(pizza_id) from
pizza_sales
group by pizza_id
having count(pizza_id ) > 1;

-- EDA

select concat(round(sum(total_price/1000),2),'K')      -- Total sales
Total_sales from pizza_sales; 

select count(distinct order_id) 					   -- Total orders
Total_order from pizza_sales;                        

select sum(quantity) Total_pizza_sold     			-- Total pizza solds 
from pizza_sales;                           

select pizza_category,round(sum(total_price),2)  	-- Sales by categotry
Total_sales, concat(round(sum(total_price)*100/                                  
(select sum(total_price) from pizza_sales),2),'%') 
Total_Sales_percentage
from pizza_sales
group by pizza_category
order by total_sales desc;

select pizza_size,round(sum(total_price),2) 
Total_sales , concat(round(sum(total_price)*100/         -- size wise pizza sales
(select sum(total_price) from pizza_sales),2),'%') 
Total_Sales_percentage 
from pizza_sales
group by pizza_size
order by total_sales desc;


select dayname(order_date) Days, 
round(sum(total_price),0) Total_sales               -- Days wise total sales
from pizza_sales
group by Days
order by total_sales desc;

select monthname(order_date) Months, 				-- Month wise total sales
round(sum(total_price),0) Total_sales                             
from pizza_sales
group by months
order by total_sales desc;

select quarter(order_date) Quarters, round(sum(total_price),0) Total_sales  -- Qtr wise total sales
from pizza_sales
group by quarters
order by total_sales desc;

select order_time, sum(total_price) Total_sales   -- Top selling time
from pizza_sales
group by order_time
order by total_sales desc
limit 1;


select pizza_name, round(sum(total_price),0) 	-- Top 5 pizza sales
Total_sales                                                   
from pizza_sales
group by pizza_name
order by total_sales desc
limit 5;

select pizza_name, round(sum(total_price),0) 	-- Bottom 5 pizza sales
Total_sales                                                 
from pizza_sales
group by pizza_name
order by total_sales
limit 5;

select * from pizza_sales;




