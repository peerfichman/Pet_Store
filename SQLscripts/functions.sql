
use pet_store;

set global log_bin_trust_function_creators = 1;

DELIMITER $$

CREATE function pet_store.monthly_income (seller_fname varchar(55), seller_lname varchar(55), in_month varchar(2), in_year varchar(4)) returns float
begin
declare income float default 0;
declare s_date varchar(10);
SELECT CONCAT(in_year, '-', in_month, '-01') INTO s_date;

SELECT 
    SUM(ord_total_price) As "MonthlyIncome"
INTO income FROM
    orders
        INNER JOIN
    worker USING (worker_id)
WHERE
    work_fname = seller_fname
        AND work_lname = seller_lname
        AND ord_time BETWEEN CAST(s_date AS DATE) AND DATE_ADD(CAST(s_date AS DATE),
        INTERVAL 1 MONTH)
GROUP BY worker_id;
return income;

end

 $$
DELIMITER ; 

-- drop function monthly_income;
-- select * from orders inner join worker using (worker_id);
-- SELECT 
--     work_fname, work_lname
-- FROM
--     worker
-- WHERE
--     worker_id = 2;
-- select monthly_income( "fatima" , "abusalim", "07" , "2022")  as "MonthlyIncome";
-- drop function monthly_income;

