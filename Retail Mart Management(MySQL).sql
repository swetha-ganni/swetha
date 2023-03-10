------Write a query to add two new columns such as S_no and categories to tha sales table-----
alter table sales_datasets 
add (
s_no int,
categories varchar(50)
);

-------Write a query to change the column type of stock in the product table to varchar-----
alter table product_datasets modify column stock varchar(50);

-----Write a query to change the table name from customer to customer details------
alter table customer_datasets rename to customerdetails;

-------Write a query to drop the columns S_no and categories from the sales table-------
alter table sales_datasets drop column s_no;
alter table sales_datasets drop column categories;

-----Write a query to display order id, customer id, order date, price and quantity from the sales table---
select order_no,c_id,order_date,price,qty from sales_datasets

-----Write a query to dislay all the details in the product table if the category is sationary---
select* from product_datasets 
where category='Stationary'

--------Write a query to display a unique category from the product table-----
select distinct(category) from product_datasets

-----Write aquery to display the sale details if quantity is greater than 2 and price is less than 500 from the sales table---
select* from sales_datasets
where qty>2 and price<500

------Write a query to display the customer's name if the name ends with a------
select* from customerdetails
where c_name like '%a'

------Write a query to display the product details in descending order of the price------
select*from product_datasets
order by price desc

------Write a query to display the order number and the customer name to combine the results of the order and the customer tables oncluding duplicate rows---
select sales_datasets.order_no, customerdetails.c_name
from sales_datasets
inner join customerdetails on sales_datasets.c_name=customerdetails.c_name
