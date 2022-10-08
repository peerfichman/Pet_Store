
use pet_store;


-- 1


DELIMITER $$

CREATE PROCEDURE pet_store.update_delivery (in in_order int ,in_worker int)
begin
update delivery set delivery_sent = 1 where order_id = in_order and worker_id = in_worker;
end

 $$
DELIMITER ; 



-- 2

DELIMITER $$

CREATE PROCEDURE pet_store.most_sold_products (in in_num_products int ,in_x_days int)
begin

SELECT 
    prod_name AS 'product name',
    prod_desc AS 'description',
    prod_price AS 'price',
    SUM(prod_ord_quant) AS 'quantity sold'
FROM
    orders_products
        INNER JOIN
    product USING (prod_id)
        INNER JOIN
    orders USING (order_id)
WHERE
    ord_time BETWEEN DATE_ADD(NOW(), INTERVAL - in_x_days DAY) AND NOW()
GROUP BY prod_id
ORDER BY SUM(prod_ord_quant) DESC
LIMIT in_num_products;

end

 $$
DELIMITER ; 




-- 3

DELIMITER $$

CREATE PROCEDURE pet_store.discount (in in_percents int, in_order int)
begin

declare old_total_price float default(0);

IF ( in_percents <= 100)
THEN

SELECT 
    ord_total_price
INTO old_total_price FROM
    orders
WHERE
    order_id = in_order;
    
UPDATE orders 
SET 
    ord_total_price = ord_total_price * (1 - (in_percents / 100))
WHERE
    order_id = in_order;

SELECT 
    order_id AS 'order id',
    cust_fname AS 'customer first name',
    cust_lname AS 'customer last name',
     CAST(old_total_price AS DECIMAL (10 , 2 )) AS 'price before discount',
    in_percents AS 'discount in percents',
     CAST(ord_total_price AS DECIMAL (10 , 2 )) AS 'price after discount'
    
FROM
    orders
        INNER JOIN
    customer USING (cust_id)
WHERE
    order_id = in_order;

END IF;
END;

 $$
DELIMITER ; 





