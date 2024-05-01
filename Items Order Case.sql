/*Creating Database*/
create database items_order;

/*Making the database default*/
use items_order;

/*Adding column OrderDate to the orders table*/
alter table orders
add column OrderDate date;

/*Disabling the safe update mode to update orders table and extract the values from a text column to the date column
(and dropping the text column thereafter)*/
SET SQL_SAFE_UPDATES = 0;

update orders
set OrderDate = str_to_date(order_date, "%d-%m-%Y");

alter table orders
drop column order_date;

/*Task 1 (Comparison Operators)
1. From the orders table, select a list of all items purchased for customerid 10449. 
Display the customerid, item, and price for this customer.*/
select item
from orders
where customerid = 10449;

/*2. Select all columns from the orders table for the customers who purchased a Tent.*/
select *
from orders
where item = "Tent";

/*3. Select the customerid, OrderDate, and item values from the orders table 
for items in the item column that start with the letter "S".*/
select customerid, OrderDate, item
from orders
where item like "S%";

/*4. Select the distinct items in the orders table. 
In other words, display a listing of each of the unique items from the orders table.*/
select DISTINCT item
from orders;

/*Task 2 (Aggregate Functions)
1. Select the maximum price of any item ordered in the orders table.*/
select max(price)
from orders;

/*2. Select the average price of all of the items ordered that were purchased in the month of December.*/
select avg(price)
from orders
where month(OrderDate) = 12;

/*3. What is the total number of rows in the orders table?*/
select count(customerid)
from orders;

/*4. For all of the tents that were ordered in the orders table, what is the price of the lowest-priced tent?*/
select min(price)
from orders
where item = "Tent";

/*Task 3 (Group By clause)
1. How many people are in each unique state in the customers table? 
Select the state and display the number of people in each.*/
select state, count(customerid)
from customers
group by state;

/*2. From the orders table, select the item, maximum price, and minimum price for each specific item in the table.*/
select item, max(price), min(price)
from orders
group by item;

/*3. How many orders did each customer make?
Select the customerid, number of orders they made, and the sum of their orders.*/
select customerid, count(item) as number_of_orders, sum(quantity) as sum_of_orders
from orders
group by customerid;

/*Task 4 (HAVING clause)
1. How many people are there in each unique state in the customers table that have more than one person in the state? 
Select the state and display the number of people in each, if it is greater than 1.*/
select state, count(customerid) as number_of_people
from customers
group by state
having count(customerid) > 1;

/*2. From the orders table, select the item, maximum price, and minimum price for each specific item in the table.
Only display the results if the maximum price for one of the items is greater than 190.00.*/
select item, max(price), min(price)
from orders
group by item
having max(price) > 190;

/*3. How many orders did each customer make?
Select the customerid, number of orders they made, and the sum of their orders if they purchased more than 1 item.*/
select customerid, count(item) as number_of_orders, sum(quantity) as sum_of_orders
from orders
group by customerid
having count(item) > 1;

/*Task 5 (Order By clause)
1. Select the lastname, firstname, and city for all customers in the customers table. 
-Display the results in Ascending Order based on the lastname.
-Display the results in Descending Order based on the lastname.*/
select lastname, firstname, city
from customers
ORDER BY lastname ASC;

select lastname, firstname, city
from customers
ORDER BY 1 DESC;

/*2. Select the item and price for all of the items in the orders table where the price is greater than 10.00. 
Display the results in Ascending Order based on the price.*/
select item, price
from orders
where price > 10
ORDER BY price ASC;

/*Task 6 (Combining Conditions & Boolean Operators)
1. Select the customerid, OrderDate, and item from the orders table for all items unless they are 'Snow Shoes' or 'Ear Muffs'. 
Display the rows as long as they are not either of these two items.*/
select customerid, OrderDate, item
from orders
where item NOT IN ("Snow Shoes", "Ear Muffs");

/*2. Select the item and price of all items that start with the letters 'S', 'P', or 'F'.*/
select item, price
from orders
where item like "S%" or item like "P%" or item like "F%";

/*Task 7 (IN & Between)
1. Select the date, item, and price from the orders table for all of the rows that have a price value ranging from 10.00 to 80.00.*/
select OrderDate, item, price
from orders
where price BETWEEN 10 and 80;

/*2. Select the firstname, city, and state from the customers table for all of the rows 
where the state value is either: Arizona, Washington, Oklahoma, Colorado, or Hawaii.*/
select firstname, city, state
from customers
where state IN ("Arizona", "Washington", "Oklahoma", "Colorado", "Hawaii");

/*Task 8 (Mathematical Functions)
1. Select the item and per unit price for each item in the orders table.*/
select item, ROUND(price/quantity, 2) as per_unit_price
from orders
group by item;

/*Task 9 (Table Joins)
1. Write a query using a join to determine which items were ordered by each of the customers in the customers table. 
Select the customerid, firstname, lastname, state OrderDate, item, and price for everything each customer purchased in the orders table.
Display the results sorted by state in descending order.*/
select customers.customerid, firstname, lastname, state, OrderDate, item, price
from customers INNER JOIN orders
ON customers.customerid = orders.customerid
ORDER BY state DESC;