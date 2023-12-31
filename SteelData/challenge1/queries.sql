-- Challenge found at https://steeldata.org.uk/sql1.html
-- #1 What are the details of all cars purchased in the year 2022?
SELECT cars.*, purchase_date FROM sales
JOIN cars
ON cars.car_id = sales.car_id
WHERE purchase_date LIKE '2022%';


-- #2 What is the total number of cars sold by each salesperson?
SELECT name, count(name) AS num_cars_sold FROM sales
JOIN salespersons
ON sales.salesman_id = salespersons.salesman_id
GROUP BY (name);


-- #3 What is the total revenue generated by each salesperson? 
SELECT name, sum(cost_$) AS TotalSales FROM sales
JOIN salespersons
ON sales.salesman_id = salespersons.salesman_id
JOIN cars
ON cars.car_id = sales.car_id
GROUP BY (name);


-- #4 What are the details of the cars sold by each salesperson?
SELECT name, cars.* FROM cars
JOIN sales
ON sales.car_id = cars.car_id
JOIN salespersons
ON sales.salesman_id = salespersons.salesman_id
ORDER BY name;


-- #5 What is the total revenue generated by each car type?
SELECT type, sum(cost_$) AS revenue FROM cars
JOIN sales
ON sales.car_id = cars.car_id
GROUP BY type
ORDER BY revenue DESC;


-- #6 What are the details of the cars sold in the year 2021 by salesperson 'Emily Wong'?
SELECT name, purchase_date, cars.* FROM cars
JOIN sales
ON sales.car_id = cars.car_id
JOIN salespersons
ON sales.salesman_id = salespersons.salesman_id
WHERE name = 'Emily Wong' AND purchase_date LIKE '2021%';

-- #7 What is the total revenue generated by the sales of hatchback cars?
SELECT style, sum(cost_$) AS revenue FROM cars
JOIN sales
ON sales.car_id = cars.car_id
GROUP BY style;


-- #8 What is the total revenue generated by the sales of SUV cars in the year 2022?
SELECT style, sum(cost_$) AS revenue_2022 FROM cars
JOIN sales
ON cars.car_id = sales.car_id
WHERE style = 'SUV' AND purchase_date LIKE '2022%';

-- #9 What is the name and city of the salesperson who sold the most number of cars in the year 2023?
SELECT name, city, count(sales.salesman_id) AS num_cars_sold_2023 FROM sales
JOIN salespersons
ON salespersons.salesman_id = sales.salesman_id
WHERE purchase_date LIKE '2023%'
GROUP BY name, city
ORDER BY num_cars_sold_2023 DESC;

-- #10 What is the name and age of the salesperson who generated the highest revenue in the year 2022?
SELECT name, age, sum(cost_$) AS revenue_2022 FROM cars
JOIN sales
ON sales.car_id = cars.car_id
JOIN salespersons
ON sales.salesman_id = salespersons.salesman_id
WHERE purchase_date LIKE '2022%'
GROUP BY name, age
ORDER BY revenue_2022 DESC;