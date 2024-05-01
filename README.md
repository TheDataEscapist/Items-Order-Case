# Items-Order-Case
The database in this case consists of 2 tables - orders and customers. The table 'orders' comprises of customerid int, item text, quantity int, price int, order_date text, whereas, the table 'customers' comprises of customerid int, firstname text, lastname text, city text, state text. This project aims to accomplish the following tasks by utilizing a variety of functions, operators, and clauses. But first, we treat the order_date text column in the orders table and convert it to OrderDate date column.<br>
### <br>Task 1 (Comparison Operators)
1. From the orders table, select a list of all items purchased for customerid 10449. Display the customerid, item, and price for this customer.
2. Select all columns from the orders table for the customers who purchased a Tent.
3. Select the customerid, OrderDate, and item values from the orders table for items in the item column that start with the letter "S".
4. Select the distinct items in the orders table. In other words, display a listing of each of the unique items from the orders table.<br>
### <br>Task 2 (Aggregate Functions)
1. Select the maximum price of any item ordered in the orders table.
2. Select the average price of all of the items ordered that were purchased in the month of December.
3. What is the total number of rows in the orders table?
4. For all of the tents that were ordered in the orders table, what is the price of the lowest-priced tent?<br>
### <br>Task 3 (Group By clause)
1. How many people are in each unique state in the customers table?
2. From the orders table, select the item, maximum price, and minimum price for each specific item in the table.
3. How many orders did each customer make? Select the customerid, number of orders they made, and the sum of their orders.<br>
### <br>Task 4 (HAVING clause)
1. How many people are there in each unique state in the customers table that have more than one person in the state? Select the state and display the number of people in each, if it is greater than 1.
2. From the orders table, select the item, maximum price, and minimum price for each specific item in the table. Only display the results if the maximum price for one of the items is greater than 190.00.
3. How many orders did each customer make? Select the customerid, number of orders they made, and the sum of their orders if they purchased more than 1 item.<br>
### <br>Task 5 (Order By clause)
1. Select the lastname, firstname, and city for all customers in the customers table. Display the results in both Ascending and Descending Order based on the lastname.
2. Select the item and price for all of the items in the orders table where the price is greater than 10.00. Display the results in Ascending Order based on the price.<br>
### <br>Task 6 (Combining Conditions & Boolean Operators)
1. Select the customerid, OrderDate, and item from the orders table for all items unless they are 'Snow Shoes' or 'Ear Muffs'. Display the rows as long as they are not either of these two items.
2. Select the item and price of all items that start with the letters 'S', 'P', or 'F'.<br>
### <br>Task 7 (IN & Between)
1. Select the date, item, and price from the orders table for all of the rows that have a price value ranging from 10.00 to 80.00.
2. Select the firstname, city, and state from the customers table for all of the rows where the state value is either: Arizona, Washington, Oklahoma, Colorado, or Hawaii.<br>
### <br>Task 8 (Mathematical Functions)
1. Select the item and per unit price for each item in the orders table.<br>
### <br>Task 9 (Table Joins)
1. Write a query using a join to determine which items were ordered by each of the customers in the customers table. Select the customerid, firstname, lastname, state, OrderDate, item, and price for everything each customer purchased in the orders table. Display the results sorted by state in descending order.
