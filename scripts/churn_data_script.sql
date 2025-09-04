CREATE DATABASE Churn_data;
USE Churn_data;

CREATE TABLE TeleData (
    customerid VARCHAR(20),
    Tenure INT,
    PhoneService CHAR(10),
    Contract VARCHAR(20),
    PaperlessBilling CHAR(20),
    PaymentMethod CHAR(50),
    MonthlyCharges DECIMAL(10 , 2 ),
    TotalCharges DECIMAL(10 , 2 ),
    Churn CHAR(10),
    Gender CHAR(20),
    SeniorCitizen CHAR(10),
    Partner CHAR(20),
    Dependents CHAR(20),
    Day INT,
    year INT,
    Month INT,
    MultipleLines CHAR(20),
    InternetService CHAR(20),
    OnlineSecurity CHAR(20),
    OnlineBackup CHAR(20),
    DeviceProtection CHAR(20),
    TechSupport CHAR(20),
    StreamingTV CHAR(20),
    StreamingMovies CHAR(20)
);
select * from churn_data.teledata;

-- 1.	Calculate the overall churn rate from the main customer data.
SELECT 
    churn_customer / (SELECT 
            COUNT(customerid)
        FROM
            churn_data.teledata) * 100 AS churn_rate
FROM
    (SELECT 
        COUNT(customerid) AS churn_customer
    FROM
        churn_data.teledata
    WHERE
        churn = 'Yes') AS temp;
 
SELECT 
    COUNT(customerid) / (SELECT 
            COUNT(customerid)
        FROM
            churn_data.teledata) * 100 AS churn_rate
FROM
    churn_data.teledata
WHERE
    churn = 'yes';
 

DELIMITER $$
CREATE PROCEDURE question1()
BEGIN
SELECT 
    churn_customer / (SELECT 
            COUNT(customerid)
        FROM
            churn_data.teledata) * 100 AS churn_rate
FROM
    (SELECT 
        COUNT(customerid) AS churn_customer
    FROM
        churn_data.teledata
    WHERE
        churn = 'Yes') AS temp;
END $$


-- 2.	Find the average monthly charges for churned vs non-churned customers.
SELECT DISTINCTROW
    (SELECT 
            AVG(monthlycharges)
        FROM
            churn_data.teledata
        WHERE
            churn = 'Yes') AS avg_monthly_charges_per_churned_customer,
    (SELECT 
            AVG(monthlycharges)
        FROM
            churn_data.teledata
        WHERE
            churn = 'No') AS avg_monthly_charges_per_nonchurned_customer
FROM
    churn_data.teledata;
    
    DELIMITER $$
CREATE PROCEDURE question2()
BEGIN
    SELECT DISTINCTROW
    (SELECT 
            AVG(monthlycharges)
        FROM
            churn_data.teledata
        WHERE
            churn = 'Yes') AS avg_monthly_charges_per_churned_customer,
    (SELECT 
            AVG(monthlycharges)
        FROM
            churn_data.teledata
        WHERE
            churn = 'No') AS avg_monthly_charges_per_nonchurned_customer
FROM
    churn_data.teledata;
END $$


-- 3.	List the top 5 payment methods with the highest churn rates. 

 SELECT 
    total.paymentmethod,
    total.total_customer,
    churn.churn_customer,
    (churn.churn_customer / total.total_customer) * 100 AS churn_rate_per_payment_method
FROM
    (SELECT 
        paymentmethod, COUNT(customerid) AS total_customer
    FROM
        churn_data.teledata
    GROUP BY paymentmethod) AS total
        JOIN
    (SELECT 
        paymentmethod, COUNT(customerid) AS churn_customer
    FROM
        churn_data.teledata
    WHERE
        churn = 'yes'
    GROUP BY paymentmethod) AS churn ON total.paymentmethod = churn.paymentmethod
ORDER BY churn_rate_per_payment_method DESC
LIMIT 5;
 
    DELIMITER $$
CREATE PROCEDURE question3()
BEGIN
select total.paymentmethod,total.total_customer,churn.churn_customer,
 (churn.churn_customer/total.total_customer) * 100 as churn_rate_per_payment_method from 
 (select paymentmethod,count(customerid) as total_customer 
 from churn_data.teledata group by paymentmethod) as total 
 join 
 (select paymentmethod,count(customerid) as churn_customer
 from churn_data.teledata where churn = "yes" group by paymentmethod) as churn
 on total.paymentmethod = churn.paymentmethod 
 order by churn_rate_per_payment_method desc 
 limit 5 ;
 end$$
 
 
 
 select paymentmethod,count(customerid)/(select count(customerid) from churn_data.teledata group by paymentmethod) * 100 as churn_rate,
 count(customerid) as customer_churn from churn_data.teledata where churn = "yes"  
  group by paymentmethod order by customer_churn desc; 
  
  
-- 4.	Display the number of customers on each contract type who have churned.

SELECT 
    Contract, COUNT(customerid) AS customer_churn
FROM
    churn_data.teledata
WHERE
    churn = 'yes'
GROUP BY Contract
ORDER BY customer_churn DESC;


DELIMITER $$
CREATE PROCEDURE question4()
BEGIN
  SELECT 
    total.contract,
    total.total_customer,
    churn.churn_customer,
    (churn.churn_customer / total.total_customer) * 100 AS churn_rate_per_contract
FROM
    (SELECT 
        contract, COUNT(customerid) AS total_customer
    FROM
        churn_data.teledata
    GROUP BY contract) AS total
        JOIN
    (SELECT 
        contract, COUNT(customerid) AS churn_customer
    FROM
        churn_data.teledata
    WHERE
        churn = 'yes'
    GROUP BY contract) AS churn ON total.contract = churn.contract
ORDER BY churn_rate_per_contract DESC
LIMIT 5;
END$$


-- 5.	Count how many customers have tenure less than 12 months and have churned.
DELIMITER $$
CREATE PROCEDURE question5()
BEGIN
SELECT 
    COUNT(DISTINCT customerid) AS customer_churn
FROM
    churn_data.teledata
WHERE
    tenure < 12 AND churn = 'Yes';
END $$

-- 6.	Identify how many customers have paperless billing and are paying through electronic check.

DELIMITER $$
CREATE PROCEDURE question6()
BEGIN
SELECT 
    COUNT(customerid) AS no_of_customer
FROM
    churn_data.teledata
WHERE
    PaymentMethod = 'electronic check'
        AND PaperlessBilling = 'Yes';
END $$

-- 7.	Calculate the total revenue generated from non-churned customers only.
DELIMITER $$
CREATE PROCEDURE question7()
BEGIN
SELECT 
    SUM(tenure * monthlycharges) AS non_churned_revenue
FROM
    churn_data.teledata
WHERE
    churn = 'No';
END $$

call question7;
--  8.	List customers who have never used phone service or internet service.


DELIMITER $$
CREATE PROCEDURE question8()
BEGIN
SELECT 
    COUNT(customerid) AS no_of_customer
FROM
    churn_data.teledata
WHERE
    PhoneService = 'No'
        OR InternetService = 'No';
END $$


--  9.	Find the number of customers with ‘Month-to-month’ contracts and no online security.

DELIMITER $$
CREATE PROCEDURE question9()
BEGIN
SELECT 
    COUNT(customerid) AS no_of_customer
FROM
    churn_data.teledata
WHERE
    Contract = 'month-to-month'
        AND OnlineSecurity = 'No';
END $$


-- 10.	Show the churn rate grouped by senior citizen status.


DELIMITER $$
CREATE PROCEDURE question10()
BEGIN
select seniorcitizen,(SELECT 
            COUNT(customerid)
        FROM
            churn_data.teledata) * 100 AS churn_rate
FROM
    churn_data.teledata
group by seniorcitizen;
END $$

-- 11.	Determine the average customer age for churned vs non-churned customers.

SELECT 
    customerid, (YEAR(NOW()) - year) AS age
FROM
    churn_data.data;
    
  DELIMITER $$
CREATE PROCEDURE question11()
BEGIN
SELECT DISTINCTROW
    (SELECT 
            AVG((YEAR(NOW()) - year))
        FROM
            churn_data.teledata
        WHERE
            churn = 'Yes') AS avg_age_churned_customer,
    (SELECT 
            AVG((YEAR(NOW()) - year))
        FROM
            churn_data.teledata
        WHERE
            churn = 'No') AS avg_age_non_churned_customer
FROM
    churn_data.teledata; 
END $$


SELECT 
    Churn, AVG(YEAR(CURRENT_DATE()) - Year) AS Avg_Age
FROM
    teledata
GROUP BY Churn;


-- 12.	List customers with Fiber optic internet who are using 
--        all entertainment services (StreamingTV and StreamingMovies).

DELIMITER $$
CREATE PROCEDURE question12()
BEGIN
SELECT 
    COUNT(customerid) AS no_of_customer
FROM
    churn_data.teledata
WHERE
    internetservice = 'Fiber optic internet'
        AND streamingmovies = 'yes'
        AND streamingtv = 'Yes';
END $$

-- 13.	Identify the top 5 customers who have paid the highest total charges but still churned.

DELIMITER $$
CREATE PROCEDURE question13()
BEGIN
SELECT 
    customerid,
    (tenure * monthlycharges) AS total_charges,
    churn
FROM
    churn_data.teledata
WHERE
    churn = 'yes'
ORDER BY total_charges DESC
LIMIT 5;
END$$


-- 14.	Find customers who are not senior citizens now, but will turn 65 within the next 2 years.


DELIMITER $$
CREATE PROCEDURE question14()
BEGIN
SELECT 
    customerid, (YEAR(NOW()) - year) AS age
FROM
    churn_data.teledata
WHERE
    65 - age = 2 AND SeniorCitizen = 0;
END$$


-- 15.	Get a list of customers who are using all possible services 
-- (phone, internet, backup, security, streaming, tech support).

DELIMITER $$
CREATE PROCEDURE question15()
BEGIN
SELECT 
    customerid
FROM
    churn_data.teledata
WHERE
    DeviceProtection = 'yes'
        AND OnlineBackup = 'yes'
        AND OnlineSecurity = 'yes'
        AND StreamingMovies = 'Yes'
        AND StreamingTV = 'yes'
        AND TechSupport = 'yes'
        AND InternetService <> 'no'; 
END$$

-- 16.	Calculate the churn rate by age group: <30, 30–50, 51–64, 65+.
select "age_group <30" as "age_group",count(customerid) 
as churn_rate from churn_data.teledata
where churn = "Yes" and (year(current_date())-year) < 30 union all
select "age_group 30-50",count(customerid) as churn_rate
from churn_data.teledata
where churn = "Yes" and (year(now())-year) between 30 and 51;

DELIMITER $$
CREATE PROCEDURE question16()
BEGIN
SELECT 
  CASE
    WHEN YEAR(CURRENT_DATE()) - Year < 30 THEN '<30'
    WHEN YEAR(CURRENT_DATE()) - Year BETWEEN 30 AND 50 THEN '30–50'
    WHEN YEAR(CURRENT_DATE()) - Year BETWEEN 51 AND 64 THEN '51–64'
    ELSE '65+'
  END AS Age_group, 
  SUM(Churn = 'Yes') * 100 / COUNT(*) AS Churn_Rate
FROM teledata
GROUP BY Age_group
;
END$$

-- 17.	Using a subquery, find customers whose total charges are above the average of all churned customers.

DELIMITER $$
CREATE PROCEDURE question17()
BEGIN
SELECT 
    customerid,
    (tenure * monthlycharges) AS total_charges,
    (SELECT 
            AVG(tenure * monthlycharges)
        FROM
            churn_data.teledata
        WHERE
            churn = 'Yes') AS avg_revenue_per_churned_customer
FROM
    churn_data.teledata
WHERE
    (tenure * MonthlyCharges) > (SELECT 
            AVG(tenure * monthlycharges)
        FROM
            churn_data.teledata
        WHERE
            churn = 'Yes'); 
END$$

SELECT 
    CustomerID, TotalCharges,avg(totalcharges)
FROM
    teledata
WHERE
    TotalCharges > (SELECT 
            AVG(TotalCharges)
        FROM
            teledata
        WHERE
            Churn = 'Yes')
;
-- 18.	Determine the correlation between long tenure (>= 24 months) and churn. Do loyal customers churn less?

DELIMITER $$
CREATE PROCEDURE question18()
BEGIN
SELECT 
    (AVG(tenure * (churn = 'yes')) - AVG(tenure) * AVG(churn = 'yes')) / (STDDEV_POP(tenure) * STDDEV_POP(churn = 'yes')) AS correlation
FROM
    churn_data.teledata
WHERE
    tenure >= 24;
END$$
-- longer tenure less likely to churn

select ( avg(monthlycharges * (churn = "yes")) - avg(monthlycharges) * avg(churn = "yes") ) / 
(stddev_pop(monthlycharges) * stddev_pop(churn = "yes")) as correlation 
from churn_data.teledata;



-- 19.	Create a report showing monthly churn trend — how many customers churned each month.

DELIMITER $$
CREATE PROCEDURE question19()
BEGIN
 SELECT 
    total.tenure AS month_,
    total.total_customer,
    churn.churn_customer,
    (churn.churn_customer / total.total_customer) * 100 AS churn_rate_per_month
FROM
    (SELECT 
        tenure, COUNT(customerid) AS total_customer
    FROM
        churn_data.teledata
    GROUP BY tenure) AS total
        JOIN
    (SELECT 
        tenure, COUNT(customerid) AS churn_customer
    FROM
        churn_data.teledata
    WHERE
        churn = 'yes'
    GROUP BY tenure) AS churn ON total.tenure = churn.tenure
ORDER BY month_ ASC;
END $$

--  20.	Rank customers by revenue (total charges) within each contract type using window functions.

DELIMITER $$
CREATE PROCEDURE question20()
BEGIN
select customerid,(monthlycharges *tenure) as total_charges,
row_number() over(partition by contract order by (tenure * monthlycharges) desc) as ranking, contract
from churn_data.teledata; 
END $$

-- 21.	Using a CTE, 
-- list customers who have either no protection services (OnlineSecurity, Backup, DeviceProtection) and have churned.

DELIMITER $$
CREATE PROCEDURE question21()
BEGIN
with churned_customer_with_no_protection_services as (select customerid from churn_data.teledata 
where churn = "yes" and OnlineBackup ="no" and OnlineSecurity = "no" and DeviceProtection = "no")
select * from churned_customer_with_no_protection_services;
end $$


-- 22.	I want a to check how many days, month and year is left for each and every employee 
-- to reach the Senior Citizen

DELIMITER $$
CREATE PROCEDURE question22()
BEGIN
SELECT 
    customerid,
    YEAR(CURDATE()) - Year AS current_age,
    65 - (YEAR(CURDATE()) - Year) AS years_left,
    (65 - (YEAR(CURDATE()) - Year)) * 12 AS months_left
FROM 
    churn_data.teledata
WHERE 
    YEAR(CURDATE()) - Year < 65;
end $$


call question22;