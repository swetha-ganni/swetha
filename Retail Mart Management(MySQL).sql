
alter table sales_datasets 
add (
s_no int,
categories varchar(50)
);


alter table product_datasets modify column stock varchar(50);

alter table customer_datasets rename to customerdetails;

alter table sales_datasets drop column s_no;
alter table sales_datasets drop column categories;

select order_no,c_id,order_date,price,qty from sales_datasets

select* from product_datasets 
where category='Stationary'

select distinct(category) from product_datasets

select* from sales_datasets
where qty>2 and price<500

select* from customerdetails
where c_name like '%a'

select*from product_datasets
order by price


select sales_datasets.order_no, customerdetails.c_name
from sales_datasets
inner join customerdetails on sales_datasets.c_name=customerdetails.c_name