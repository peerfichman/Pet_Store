<?php

# QUERIES

#1
$query1 = "SELECT 
prod_id AS 'product id',
prod_name AS 'product name',
cat_name AS 'catagory',
prod_desc AS 'description',
prod_price AS 'price',
prod_quant AS 'quantity'
FROM
product
    INNER JOIN
prod_catagory USING (cat_id);";

#2
function concatQuery2($x)
{

    $query2_1 =    "SELECT 
order_id AS 'order id',
cust_fname AS 'customer first name',
cust_lname AS 'customer last name',
ord_total_price AS 'order total price',
ord_time AS 'order time',
ord_act AS 'active'
FROM
orders
INNER JOIN
customer
USING (cust_id)
WHERE
ord_time BETWEEN DATE_ADD(NOW(), INTERVAL -";

    $query2_2 = " WEEK) AND NOW();";

    return $query2_1 . $x . $query2_2;
}

#3

$query3 = "SELECT 
work_fname AS 'first name',
work_lname AS 'last name',
SUM(prod_ord_quant) AS 'products sold'
FROM
orders
    INNER JOIN
worker USING (worker_id)
    INNER JOIN
orders_products USING (order_id)
GROUP BY worker_id
ORDER BY SUM(prod_ord_quant) DESC
LIMIT 1;";

#4 

$query4 = "SELECT 
work_fname AS 'first name',
work_lname AS 'last name',
CAST(SUM(ord_total_price) AS DECIMAL (10 , 2 )) AS 'total income'
FROM
orders
    INNER JOIN
worker USING (worker_id)
GROUP BY worker_id
ORDER BY SUM(ord_total_price) DESC
LIMIT 1;";

#5

$query5 = "SELECT 
order_id AS 'order id',
cust_fname AS 'customer first name',
cust_lname AS 'customer last name',
CAST(ord_total_price AS DECIMAL (10 , 2 )) AS 'price'
FROM
orders
    INNER JOIN
customer USING (cust_id)
WHERE
ord_act = 1;";


#6
$query6 = "SELECT 
cust_fname AS 'customer first name',
cust_lname AS 'customer last name'
FROM
customer
    LEFT JOIN
orders USING (cust_id)
WHERE
order_id IS NULL;";

#7
$query7 = "SELECT 
cust_fname AS 'customer first name',
cust_lname AS 'customer last name'
FROM
customer
    INNER JOIN
orders USING (cust_id)
GROUP BY cust_id
HAVING COUNT(*) > 1;";

#8

function concatQuery8($x)
{
    $query8_1 = "SELECT 
    CAST(sum(ord_total_price) AS DECIMAL (10 , 2 )) AS 'total income'
FROM
    orders
WHERE
    ord_time BETWEEN DATE_ADD(NOW(), INTERVAL -";

    $query8_2 = " month) AND NOW();";

    return $query8_1 . $x . $query8_2;
}
