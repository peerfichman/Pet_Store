<?php

function getWorkerNamebyId($worker_id)
{
    include "config.php";
    $querySellerName = "SELECT 
        work_fname, work_lname
    FROM
        worker
    WHERE
        worker_id = " . $worker_id . ";";
    $resWorkerName = mysqli_query($connection, $querySellerName);
    $workerName = mysqli_fetch_assoc($resWorkerName);
    mysqli_close($connection);
    if (isset($resSellerName))
        mysqli_free_result($resSellerName);

    return $workerName["work_fname"] . "_" . $workerName["work_lname"];
}

function concatFuncCall1($worker_id, $year, $month)
{
    $sellerName = getWorkerNamebyId($worker_id);
    $name = explode("_", $sellerName);
    return "SELECT  monthly_income( '" . $name[0] . "' , '" . $name[1] . "' ," . $month . "," . $year . ") AS 'MonthlyIncome';";
}
