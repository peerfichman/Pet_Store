use pet_store;

-- 1

SELECT 
    prod_id AS 'product id',
    prod_name AS 'product name',
    cat_name AS 'catagory',
    prod_desc AS 'description',
    prod_price AS 'price',
    prod_quant AS 'quantity'
FROM
    product
        INNER JOIN
    prod_catagory USING (cat_id);
    
    -- 2
    
    SELECT 
    *
FROM
    orders
WHERE
    ord_time BETWEEN DATE_ADD(NOW(), INTERVAL - 3 WEEK) AND NOW(); -- 3 == x

-- 3

SELECT 
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
LIMIT 1; 

-- 4

SELECT 
    work_fname AS 'first name',
    work_lname AS 'last name',
    CAST(SUM(ord_total_price) AS DECIMAL (10 , 2 )) AS 'total income'
FROM
    orders
        INNER JOIN
    worker USING (worker_id)
GROUP BY worker_id
ORDER BY SUM(ord_total_price) DESC
LIMIT 1; 

-- 5

SELECT 
    order_id AS 'order id',
    cust_fname AS 'customer first name',
    cust_lname AS 'customer last name',
    CAST(ord_total_price AS DECIMAL (10 , 2 )) AS 'price'
FROM
    orders
        INNER JOIN
    customer USING (cust_id)
WHERE
    ord_act = 1;

-- 6

SELECT 
    cust_fname AS 'customer first name',
    cust_lname AS 'customer last name'
FROM
    customer
        LEFT JOIN
    orders USING (cust_id)
WHERE
    order_id IS NULL;


-- 7

SELECT 
	cust_fname AS 'customer first name',
    cust_lname AS 'customer last name'
FROM
    customer
        INNER JOIN
    orders USING (cust_id)
GROUP BY cust_id
HAVING COUNT(*) > 1;

-- 8 

    SELECT 
    CAST(sum(ord_total_price) AS DECIMAL (10 , 2 )) AS 'total income'
FROM
    orders
WHERE
    ord_time BETWEEN DATE_ADD(NOW(), INTERVAL - 3 month) AND NOW();

