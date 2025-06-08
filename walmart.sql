use Walmart;
select * from walmart_clean_data;
select payment_method,count(*) from walmart_clean_data group by payment_method;
select count(distinct(Branch)) from walmart_clean_data;
select max(quantity) from walmart_clean_data;

-- Business problams
-- Q1. Find different payment method and number of  transactions, number of qtr sold.
select * from walmart_clean_data;
select  payment_method,count(*) as No_payments,sum(quantity)no_quntity from walmart_clean_data group by payment_method order by payment_method asc;

-- Q2. Identity the highest-rated category in each branch, displaying the branch, catagory 
-- avg RATING
select avg(rating),category,Branch from walmart_clean_data group by category,Branch order by avg(rating) desc limit 5;

-- Q3.Identify the busiest day for each branch based on the number of transaction.
select Branch,date_time,count(*) from walmart_clean_data group by Branch,date_time order by Branch,date_time desc;
select date from walmart_clean_data;
alter table walmart_clean_data rename column date to date_time;


-- Q5. Determine the average, mimimum, maximum rating of category for each city.
-- List the city, average_rating,min_rating, and max_rating.


select category,City,round(avg(rating),3) as Avg_rating,min(rating),max(rating) from walmart_clean_data group by category,City ;

-- calculate the total profit for each category by considering total_profit as(unit_price*quantity*profit_margin).list category and total_profit,ordered from highest to lowest profit.
select * from walmart_clean_data;
select category,sum(Total*profit_margin)as profit,sum(Total)as Total from walmart_clean_data group by category order by sum(Total) desc;


-- Q7. Determine the most commen paymant method for each Branch.
-- Display Branch and the preferred_payment_method.

select Branch,payment_method,count(*) from walmart_clean_data group by Branch,payment_method order by count(*) desc limit 5 ;



-- Q8. Identify 5 branches wide hight decreses ratioin 
-- Revevenue compare to last year(current year 2023 and last year 2022)

select Branch,date_time,sum(Total) from walmart_clean_data where date_time between 2023 and  2022 group by Branch,date_time ;










