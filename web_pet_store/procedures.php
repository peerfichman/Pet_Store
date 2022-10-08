<?php


function concatProcCall1($order_id, $worker_id)
{
    return 'call update_delivery(' . $order_id . ',' . $worker_id . ');';
}

function queryProc1Res($order_id, $worker_id)
{

    return "SELECT 
     order_id AS 'order id',
    work_fname AS 'deliver first name',
    work_lname AS 'deliver last name',
    delivery_sent AS 'delivery sent'
FROM
    orders
        INNER JOIN
    delivery d USING (order_id)
        INNER JOIN
    worker w ON d.worker_id = w.worker_id
WHERE
    order_id = " . $order_id . " AND d.worker_id = " . $worker_id . ";";
}

function concatProcCall2($num_products, $num_days)
{
    return 'call most_sold_products(' . $num_products . ',' . $num_days . ');';
}
function concatProcCall3($disc_perc, $order_id)
{
    return 'call discount(' . $disc_perc  . ',' . $order_id  . ');';
}
