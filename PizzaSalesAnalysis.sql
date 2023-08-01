

----------------------------/*PIZZA SALES SQL QUERIES*/----------------------------------------------------------------------------------

select * from pizza_sales;

-----------------------------Total Revenue-----------------------------------------------------------------------------------------------

select concat('$ ', SUM(total_price)) Total_Revenue
from pizza_sales;

-----------------------------Average Order Value------------------------------------------------------------------------------------------

select COUNT(distinct order_id) TotalPizzasSold
from pizza_sales;

select SUM(total_price)/count(distinct order_id) AverageOrderValue
from pizza_sales;

-------------------------------Total Pizzas Sold-----------------------------------------------------------------------------------------------

select sum(quantity) TotalPizzasSold
from pizza_sales;

------------------------------Average Pizzas Per Order----------------------------------------------------------------------------------------

select cast(cast(sum(quantity)as decimal(10,2))/cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) AvgpizzasPerOrder
from pizza_sales;


-------------------------------Daily Trend for Total Orders-----------------------------------------------------------------------------------

select * from pizza_sales;

select datename(DW,order_date) Dayy, count(order_id) orders
from pizza_sales
group by datename(DW,order_date);

--------------------------------Monthly Trend for Orders--------------------------------------------------------------------------------------

select datename(MONTH,order_date) Monthh, count(order_id) orders
from pizza_sales
group by datename(month,order_date);

--------------------------------% of Sales by Pizza Category----------------------------------------------------------------------------------

select pizza_category,round(sum(total_price),2) Total_Revenue,
round(sum(total_price)/(select sum(total_price) from pizza_sales)*100,2) Pct
from pizza_sales
group by pizza_category;

---------------------------------% of Sales by Pizza Category----------------------------------------------------------------------------------

select pizza_name,round(sum(total_price),2) Total_Revenue,
round(sum(total_price)/(select sum(total_price) from pizza_sales)*100,2) Pct
from pizza_sales
group by pizza_name
order by 2 desc;

select pizza_size,round(sum(total_price),2) Total_Revenue,
round(sum(total_price)/(select sum(total_price) from pizza_sales)*100,2) Pct
from pizza_sales
group by pizza_size;

--------------------------------Total Pizzas Sold by Pizza Category-------------------------------------------------------------------------------

select * from pizza_sales;

select pizza_category,sum(quantity)
from pizza_sales
where MONTH(order_date)=2
group by pizza_category;

--------------------------------Total Pizzas Sold by Pizza Category------------------------------------------------------------------------------

select top 5 pizza_name, sum(total_price) TotalRevenue
from pizza_sales
group by pizza_name
order by 2 desc;

---------------------------------Bottom 5 Pizzas by Revenue--------------------------------------------------------------------------------------

select top 5 pizza_name, sum(total_price) TotalRevenue
from pizza_sales
group by pizza_name
order by 2 asc;

---------------------------------Top 5 Pizzas by Quantity----------------------------------------------------------------------------------------

select top 5 pizza_name,sum(quantity)
from pizza_sales
group by pizza_name
order by 2 desc;

---------------------------------Bottom 5 Pizzas by Quantity------------------------------------------------------------------------------------

select top 5 pizza_name,sum(quantity)
from pizza_sales
group by pizza_name
order by 2 asc;

--------------------------------Bottom 5 Pizzas by Quantity--------------------------------------------------------------------------------------

select top 5 pizza_name,count(distinct order_id)
from pizza_sales
group by pizza_name
order by 2 desc;

---------------------------------Borrom 5 Pizzas by Total Orders----------------------------------------------------------------------------------

select top 5 pizza_name,count(distinct order_id)
from pizza_sales
group by pizza_name
order by 2 asc;










