
 
 -- 1. Выведите данные о билетах разной ценовой категории. 
-- SELECT 
-- id,
-- service_class,
-- price
-- FROM tickets
-- WHERE 
-- (service_class = "Economy" AND price BETWEEN 10000 AND 11000)
-- OR (service_class = "PremiumEconomy" AND price BETWEEN 20000 AND 30000)
-- OR (service_class = "'Business'" AND price > 100000);

SELECT 
id,
service_class,
price ,
CASE 
	WHEN service_class = "Economy" AND price BETWEEN 10000 AND 11000
		THEN "Ecomomy"
	WHEN service_class = "PremiumEconomy" AND price BETWEEN 20000 AND 30000
		THEN "PremiumEconomy"
	WHEN service_class = "'Business'" AND price > 100000
		THEN "Business"
END AS category
FROM tickets;

-- 2.Разделите самолеты на три класса по возрасту.

SELECT * FROM airliners;

SELECT 
side_number,
CASE 
	WHEN production_year < 2000 
		THEN "Old"
	WHEN production_year BETWEEN 2000 AND 2010
		THEN "Mid"
	ELSE "New"
END AS age 
FROM airliners
	WHERE 
    `range` <= 10000
ORDER BY 
age ASC;

-- 3.Руководство авиакомпании снизило цены на билеты 

SELECT * FROM tickets;

SELECT
id,
trip_id,
CASE 
	WHEN trip_id = "LL4S1G8PQW"
		THEN price * 0.85 -- 15%
	WHEN trip_id = "0SE4S0HRRU"
		THEN price * 0.9 -- 10%
	WHEN trip_id = "JQF04Q8I9G"
		THEN price * 0.8 -- 20%
END AS newprice 
FROM tickets 
	WHERE trip_id IN ("LL4S1G8PQW","0SE4S0HRRU","JQF04Q8I9G");

