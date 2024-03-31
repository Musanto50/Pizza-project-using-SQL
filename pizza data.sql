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
select min(price) as minimum_price from sales_table;
select branch,pizza_sold,sum(quantity) from sales_table where price > (select min(price) as minimum_price from sales_table)
group by branch, pizza_sold
order by sum(quantity);

