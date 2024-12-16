-- SYNTAX :-
select agg_function (col_name(s))
From tb-name
where condition
Group by col-name(s)



1. Exercises on using Having and Group By Clauses:


a. Print the description and total qty sold for each product.

==>


select description,so.order_status,pm.qty_on_hand  from product_master pm
inner join sales_order_details sod on sod.product_no = pm.product_no
inner join sales_order so on sod.order_no = so.order_no
inner join client_master cm on cm.client_no= so.client_no
where order_status = "fulfilled" ;
--  Group by order_status
--  having sum(qty_on_hand);

error..............








b. Find the value of each product sold.

==>




c. Calculate the average qty sold for each client that has a maximum order value of 15000.00.
d. Find out the total of all the billed orders for the month of June.