use pet_store;


DELIMITER $$
-- DONT LET INSERT TO ORDERS MADE BY NON SELLER WORKER
-- ----------------------------------------------------
CREATE TRIGGER pet_store.trig_preventInsertOrderNonSeller
BEFORE INSERT
ON pet_store.Orders
FOR EACH ROW 
BEGIN
IF( (SELECT role_id FROM worker where worker_id = new.worker_id) <> 1)
THEN
signal sqlstate '45000';
END IF;

END;
 $$
DELIMITER ; 

DELIMITER $$

CREATE TRIGGER pet_store.trig_updateStorageUpdateTotalPrice
AFTER INSERT
ON pet_store.Orders_products
FOR EACH ROW 
BEGIN



-- INSERT ORDER INTO STORAGE LOG
-- ----------------------------
INSERT INTO Storage_log (order_id, prod_id, old_quant, new_quant, update_time)
	values 		(new.order_id,
				 new.prod_id,
				(SELECT prod_quant FROM Product WHERE prod_id = new.prod_id),
				((SELECT prod_quant FROM Product WHERE prod_id = new.prod_id)  -  new.prod_ord_quant), 
				(SELECT ord_time FROM Orders where order_id = new.order_id));


-- UPDATE PRODUCT QUANTITY
-- ----------------------------
UPDATE pet_store.Product 
SET 
    prod_quant = prod_quant - new.prod_ord_quant
WHERE
    prod_id = new.prod_id;


-- UPDATE ORDER TOTAL PRICE
-- ----------------------------
UPDATE Orders 
SET 
    ord_total_price = ord_total_price + ((SELECT 
            prod_price
        FROM
            Product
        WHERE
            prod_id = new.prod_id) * new.prod_ord_quant)
WHERE
    order_id = new.order_id;

-- SET DELIVERY PRICE TO ZERO ON ORDER GREATER THEN 180
-- ----------------------------------------------------

IF ( (SELECT ord_total_price FROM Orders where order_id =new.order_id) >= 180)
THEN
UPDATE Delivery
SET
	delivery_price = 0
    WHERE
    order_id = new.order_id;
END IF; 

END;

 $$
DELIMITER ; 


DELIMITER $$


-- INSERT INTO DELIVERY ON INSERT TO ORDER
-- -------------------------------------------------

CREATE TRIGGER pet_store.createDelivery
AFTER INSERT
ON pet_store.Orders
FOR EACH ROW
BEGIN
	INSERT INTO Delivery (order_id, worker_id, delivery_date)
	values 	((new.order_id),
			(select worker_id from worker where role_id = 3 order by rand() limit 1),
            DATE_ADD((new.ord_time), interval 3 day)
		);
			
END;

 $$
DELIMITER ; 


DELIMITER $$


-- update order activity on delivery
-- -------------------------------------------------

CREATE TRIGGER pet_store.update_order_Delivery
AFTER update
ON pet_store.delivery
FOR EACH ROW
BEGIN
	if (new.delivery_sent = 1)
    then update orders set ord_act = 0 where order_id = new.order_id;
    end if;
			
END;

 $$
DELIMITER ; 


