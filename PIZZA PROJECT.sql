 #adding revenue column
alter table sales_table
add column revenue decimal(10,2);
update  sales_table
set revenue = price * quantity;

#Branch with the highest sales revenue
select branch, sum(revenue) as total_sale from sales_table
group by branch
order by sum(revenue) desc
limit 1;  

#Pizza type with the most quantity sold
select pizza_sold,sum(quantity) from sales_table
group by pizza_sold
order by sum(quantity) desc
limit 1;

#Average quantity of pizza sold per transaction for each branch
select  branch,avg(quantity) from sales_table
group by branch
order by avg(quantity);

#Average unit price for each pizza type
select pizza_sold, avg(price) from sales_table
group by pizza_sold
order by avg(price);

#Sales performance of different branches in terms of the total sales and total quantity
select branch,sum(revenue) as total_sales,sum(quantity) as total_quantity from sales_table
group by branch
order by sum(revenue),sum(quantity);

#Sales performance of different pizza types in terms of the total sales and total quantity
select pizza_Sold,sum(revenue) as total_sales,sum(quantity) as total_quantity from sales_table
group by pizza_Sold
order by sum(revenue),sum(quantity);

#Retrieve the Branch and Pizza_sold and the sales revenue excluding transactions with a sales_Price below 10000.
select branch,pizza_sold,sum(revenue) as total_sales from sales_table
group by branch,Pizza_Sold
having total_sales  > 10000
order by sum(revenue);

#Calculate the total sales revenue for each Branch and Pizza_sold, and sort the results in descending order of revenue. Exclude records where the Quantity sold is less than 5.
select branch,pizza_sold,sum(revenue) as total_sales from sales_table
where Quantity  >= 5
group by branch,Pizza_Sold
order by sum(revenue) desc;

#Calculate the total sales revenue for each Branch and Pizza_sold combination, considering only transactions with a Price between 2000 and 3000. Sort the results by revenue in descending order.
select branch,pizza_sold,sum(revenue) as total_sales from sales_table where price between 2000 and 3000
group by branch,pizza_sold
order by total_sales desc;

#Calculate the total sales revenue for each Branch and Pizza_sold combination, and then sort the results by revenue in descending order. For ties in revenue, sort by branch code in ascending order.
select branch,pizza_sold,sum(revenue) as total_sales from sales_table
group by branch,Pizza_Sold
order by sum(revenue) desc;

#retrieve records of the branch,Pizza_Sold, Quantity, sales_price where the price is higher than 3000
select branch,pizza_sold,sum(quantity),sum(price) from sales_table where price > 3000
group by branch,pizza_sold
order by sum(price);

#get all record that the sales_price is greater than the 9000
select * from sales_table where revenue > 9000;

#retrieve records of the branch,Pizza_Sold, Quantity, sales_price where the price is greater than the maimum price.
select branch,pizza_sold,sum(quantity) from sales_table where price > (select min(price) as minimum_price from sales_table)
group by branch, pizza_sold
order by sum(quantity);

#Branch with the highest sales revenue
select branch,sum(revenue) from sales_table
group by branch
order by sum(revenue) 
limit 1;

#Pizza type with the most quantity sold
select pizza_sold,sum(quantity) from sales_table
group by Pizza_Sold
order by sum(quantity)
limit 1;

#Average quantity of pizza sold per transaction for each branch
select branch,pizza_sold,avg(quantity) from sales_table
group by branch,Pizza_Sold
order by avg(quantity); 

#Average unit price for each pizza type
select pizza_sold,avg(quantity) from sales_table
group by Pizza_Sold
order by avg(quantity);

#Sales performance of different branches in terms of the total sales and total quantity
select branch,sum(quantity),sum(revenue) as total_sales from sales_table
group by branch
order by sum(quantity),total_sales;

#Sales performance of different pizza types in terms of the total sales and total quantity
select pizza_sold,sum(quantity),sum(revenue) as total_sales from sales_table
group by pizza_sold
order by sum(Quantity),total_sales;

#Retrieve the Branch and Pizza_sold and the sales revenue excluding transactions with a sales_Price below 10000.
select branch,pizza_sold,sum(revenue) as total_sales from sales_table
group by branch,pizza_sold
having sum(revenue) >= 10000
order by sum(revenue);

#Calculate the total sales revenue for each Branch and Pizza_sold, and sort the results in descending order of revenue. Exclude records where the Quantity sold is less than 5.
select branch,pizza_sold,sum(revenue) as total_sales from sales_table
where quantity >= 5
group by branch,Pizza_Sold
order by sum(revenue) desc;

#Calculate the total sales revenue for each Branch and Pizza_sold combination, considering only transactions with a Price between 2000 and 3000. Sort the results by revenue in descending order.
select branch,pizza_sold,sum(revenue) as total_sales from sales_table
where price between 2000 and 3000
group by branch,pizza_sold
order by sum(revenue) desc;

#Calculate the total sales revenue for each Branch and Pizza_sold combination, and then sort the results by revenue in descending order. For ties in revenue, sort by branch code in ascending order.
select branch,pizza_sold,sum(revenue) as total_sale from sales_table
group by branch,pizza_sold
order by sum(revenue) desc;

#retrieve records of the branch,Pizza_Sold, Quantity, sales_price where the price is higher than 3000
select branch,pizza_sold,sum(quantity),sum(revenue) as total_sales from sales_table
where price > 3000
group by branch,pizza_sold
order by sum(quantity),total_sales;

#get all record that the sales_price is greater than the 9000
select * from sales_table where revenue > 9000;

#retrieve records of the branch,Pizza_Sold, Quantity, sales_price where the price is greater than the maimum price
select branch,pizza_sold,sum(quantity),sum(revenue) as total_sales from sales_table where price > (select min(price) from sales_table)
group by branch,pizza_sold
order by sum(quantity),total_sales;

#show records of the date, branch, pizza_sold, sales_price of the sales table with their respective managers
select a.Date,a.pizza_sold,a.Branch, sum(a.revenue), b.manager from sales_table a join branch_data b on a.branch = b.branch
group by a.Date,a.pizza_sold,a.branch, b.manager
order by sum(a.revenue); 

#show all records of the sales_table with their repective managers
select a.*,b.* from sales_table a join branch_data b on a.branch=b.branch;

# get the average sales price for each manager and branch
select b.manager,a.branch,avg(a.revenue) from sales_table a join branch_data b on a.branch=b.branch
group by b.manager,a.branch
order by avg(a.revenue);

 #get the sales revenue price for each manager and branch
select b.manager,a.branch,sum(a.revenue) from sales_table a join branch_data b on a.branch=b.branch
group by b.manager,a.branch
order by sum(a.revenue);

#retrieve records of the branch,Pizza_Sold, Quantity, sales_price where the price is higher than 2000
select a.branch,a.pizza_sold,sum(a.quantity) from sales_table a join branch_data b on a.branch=b.branch
where price > 2000
group by a.branch,a.pizza_sold
order by sum(a.quantity);

#get record of the pizz_sold and the average sales_price where the average sales_prce is greater than the 9474
select a.pizza_sold,avg(a.revenue) from sales_table a join branch_data b on a.Branch=b.branch
group by a.Pizza_Sold
having avg(a.revenue) >9474
order by avg(a.revenue); 

#What is the total sales amount for each branch?
select sum(a.revenue),b.branch from sales_table a join branch_data b on a.branch=b.branch
group by b.branch
order by sum(a.revenue);

#How many pizzas were sold on a specific date?
select a.day,sum(b.quantity) from daily_sales_target a join sales_table b on a.day=b.date
group by a.day
order by sum(b.Quantity);

#What is the total quantity of pizzas sold on a specific date range?
select Pizza_Sold,sum(quantity),Time_Range from sales_table
group by Pizza_Sold,Time_Range
order by sum(quantity);

#Did any branch exceed its sales target for a specific day?
select a.branch,sum(a.revenue),b.target,b.day, (sum(a.revenue)-b.target) as difference from sales_table a join daily_sales_target b on a.date=b.day
group by a.branch,b.day,b.target
order by sum(a.revenue) desc;

#What is the average price of pizzas sold
select pizza_sold,avg(revenue) from sales_table
group by Pizza_Sold
order by avg(revenue);

#Which branch has the highest sales target?
select a.branch,b.Sales_Target from sales_table a join sales_target b on a.Pizza_Sold=b.pizza
group by a.branch,b.Sales_Target
order by b.Sales_Target desc
limit 1;

#How many days in the month have achieved the daily sales target?
select a.day,a.target,sum(b.revenue) from daily_sales_target a join sales_table b on a.day=b.date
group by a.day,a.target
order by sum(b.revenue);

#What is the average daily sales target for all branches?
select a.branch,b.target,avg(a.revenue) from sales_table a join daily_sales_target b on a.date=b.day
group by a.branch,b.target
order by avg(revenue);

#Which branch is located furthest east based on longitude?
select branch,longitude from branch_data
group by  branch,longitude
order by longitude desc;

#Compare actual daily sales to the daily sales target for a specific branch.
select a.branch,sum(a.revenue),b.target from sales_table a join daily_sales_target b on a.date=b.day
group by a.branch,b.target
order by sum(a.revenue);

#Analyze the relationship between the quantity of pizzas sold and the total sales amount.
select Pizza_Sold,price, sum(quantity),sum(revenue) from sales_table
group by Pizza_Sold,price,quantity
order by sum(revenue) desc;

#What is the average price per pizza for each branch?
select a.branch,b.pizza_sold,avg(b.revenue) from branch_data a join sales_table b on a.branch=b.branch
group by a.branch,b.Pizza_Sold
order by avg(b.revenue);

#Are there any correlations between the quantity sold and the time of day?
select pizza_sold,sum(quantity),time,time_range from sales_table
group by 1,3,4
order by 2 desc;

#get total sale of pizza execpt extravaganza
select pizza_sold,sum(revenue) from sales_table where Pizza_Sold !='Extravaganza'
group by 1
order by 2;

#get total sale made from BBQ Chicken, Hot Veggie,'Chicken Feast
select pizza_sold,sum(revenue) from sales_table where pizza_sold in ( 'BBQ Chicken', 'Hot Veggie','Chicken Feast')
group by 1
order by 2;

#get the detail of the branch,pizza_sold,price and manager from each branch 
select a.branch,a.pizza_sold,avg(a.price),b.manager from sales_table a join branch_data b on a.branch=b.branch
group by a.branch,a.pizza_sold,b.manager
order by avg(a.price);

#get all the revenue generated each day along side the daily target that needs to be made
select a.date,sum(a.revenue),b.target from sales_table a join daily_sales_target b on a.date=b.day
group by b.target,a.date
order by sum(a.revenue);

#GET THE BOTTOM 3 BRANCH AND PIZZA_SOLD COMBINATION IN TERM OF REVENUE
SELECT branch,pizza_sold,sum(revenue) from sales_table
group by branch,pizza_sold
order by sum(revenue) 
limit 3;

#get the total revenue generated for each pizza and the target for each type of pizza that was made
select a.pizza_sold,sum(a.revenue),b.Sales_Target from sales_table a join sales_target b on a.Pizza_Sold=b.pizza
group by a.pizza_sold,b.Sales_Target
order by sum(a.revenue);
 
#Retrieve the top 3 pizzas (Pizza_Sold) based on the total revenue generated, Include the pizza name, total revenue, and the sales target.
SELECT A.PIZZA_SOLD,SUM(A.REVENUE),B.SALES_TARGET FROM sales_table A JOIN sales_target B ON A.Pizza_Sold=B.PIZZA
GROUP BY A.Pizza_Sold,B.Sales_Target
ORDER BY SUM(A.REVENUE) DESC
LIMIT 3;

#Compare the total revenue generated for each type of pizza (Pizza_Sold) across all branches. Display the pizza name, total revenue, and the average revenue for each pizza.
select a.pizza_sold,sum(a.revenue),avg(a.revenue) from sales_table a join branch_data b on a.branch=b.branch
group by a.Pizza_Sold
order by sum(a.revenue);

#Identify pizzas (Pizza_Sold) that are below the average sales target and have generated revenue less than the overall average revenue.
select a.Pizza_Sold,sum(a.revenue),b.sales_target from sales_table a join sales_target b on a.Pizza_Sold=b.pizza
group by a.pizza_sold,b.Sales_Target
having sum(a.revenue) < (select avg(revenue) from sales_table) and b.sales_target < (select avg(Sales_Target) from sales_target)
order by sum(a.revenue);

#Find pizzas (Pizza_Sold) that have a price higher than the overall average price and a sales target greater than the overall average target. 
#Exclude the 'Ikoyi' branch.
select  a.pizza_sold,a.price,b.sales_target from sales_table a join sales_target b on a.pizza_sold=b.pizza
where a.price > (select avg(price) from sales_table where branch <> 'Ikoyi') and b.Sales_Target > (select avg(sales_target) from sales_target where branch <> 'Ikoyi') and branch <> 'ikoyi'
group by a.Pizza_Sold,a.price,b.Sales_Target
order by (b.Sales_Target);

#Determine the top-performing pizza (Pizza_Sold) in each branch based on total revenue. Display the branch, pizza name, and total revenue for each top performer.
with pizzaranking as (select a.Branch,a.Pizza_Sold,sum(a.revenue) as total_revenue,row_number()over(partition by a.Branch order by sum(a.revenue)desc)ranking
from sales_table a 
group by a.Branch,a.Pizza_Sold) 
select branch,Pizza_Sold,total_revenue from pizzaranking
where ranking = 1;

#Retrieve the daily revenue, the daily sales target, and the variance between the revenue and target for each day. Include the date and the calculated variance.
select a.date,sum(a.revenue),b.target, (sum(a.revenue)-b.target) as variance from sales_table a join daily_sales_target b on a.date=b.day
group by a.date,b.target
order by a.date;

#Find the days where the total revenue exceeds the daily sales target. Include the date, total revenue, and daily sales target for each exceeding day.
select a.date,sum(a.revenue),b.target from sales_table a join daily_sales_target b on a.date=b.day 
group by a.date,b.target
having sum(revenue) > b.target
order by a.date;

#Display the date, total revenue, and daily sales target for each above-average day
select a.date,b.target,sum(a.revenue),avg(revenue) from sales_table a join daily_sales_target b on a.date=b.day
group by a.date,b.target
having sum(a.revenue) > (select avg(total_revenue) from (select sum(REVENUE) as total_revenue
from sales_table 
group by sales_table.date) as avg_revenue);

#List the days where the total revenue falls below the daily sales target. Include the date, total revenue, and daily sales target for each day below the target.
select a.date,sum(a.revenue),b.target from sales_table a join daily_sales_target b on a.date=b.day 
group by a.date,b.target
having sum(revenue) < b.target
order by a.date; 

with pizzaranking as (select a.Branch,a.Pizza_Sold,sum(a.revenue) as total_revenue,row_number()over(partition by a.Branch order by sum(a.revenue)desc) as ranking
from sales_table a
group by a.Branch,a.Pizza_Sold)
select branch,Pizza_Sold, total_revenue from pizzaranking
where ranking = 1;

