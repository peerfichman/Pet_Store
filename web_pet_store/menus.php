<?php
include "config.php";

$queryAllOrdersId = "SELECT 
order_id
FROM
orders
    INNER JOIN
delivery USING (order_id)
WHERE
delivery_sent = 0
ORDER BY order_id ASC;";

$resAllordersId = mysqli_query($connection, $queryAllOrdersId);

$queryAllDelivers = "SELECT 
worker_id, work_fname, work_lname
FROM
worker
WHERE
role_id = 3;";

$resAllDelivers = mysqli_query($connection, $queryAllDelivers);


$queryAllOrders = "SELECT 
order_id
FROM
orders
ORDER BY order_id ASC;";

$resAllOrders = mysqli_query($connection, $queryAllOrders);


$queryAllSellers = "SELECT 
worker_id, work_fname, work_lname
FROM
worker
WHERE
role_id = 1;";

$resAllSellers = mysqli_query($connection, $queryAllSellers);


mysqli_close($connection);
