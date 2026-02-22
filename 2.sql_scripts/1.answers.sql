--Lesson 10 – Aggregations (COUNT, SUM, AVG, GROUP BY)
--Table [Property24].[dbo].[1770794941712_property24]

--SECTION 1 – COUNT Aggregations (10 Questions)
--1. How many total properties are in the database?

SELECT *
FROM [Property24].[dbo].[1770794941712_property24]

--2. How many properties are listed in each province?

SELECT PROVINCE , count(PROVINCE) AS Num_of_property
FROM [Property24].[dbo].[1770794941712_property24]
Group by PROVINCE;

--3. How many properties are listed in each city?

SELECT CITY , Count(City) as Num_of_property
FROM [Property24].[dbo].[1770794941712_property24]
Group by CITY
;

--4. How many properties have more than 2 bedrooms?

SELECT Count (*) AS Prop_with_2_or_more_bedrooms
FROM [Property24].[dbo].[1770794941712_property24]
WHERE BEDROOMS > 2
;

--5. How many properties have 2 or more bathrooms?

SELECT Count (*) AS Prop_with_2_or_more_bathrooms
FROM [Property24].[dbo].[1770794941712_property24]
WHERE BATHROOMS >= 2
;

--6. How many properties have parking for at least 2 cars?

SELECT Count (*) AS parking_for_at_least_2_cars
FROM [Property24].[dbo].[1770794941712_property24]
WHERE PARKING >= 2
;

--7. How many properties are priced above R3,000,000?

SELECT Count (*) AS price_above_R3000000
FROM [Property24].[dbo].[1770794941712_property24]
WHERE PROPERTY_PRICE > 3000000
;

--8. How many properties are in Gauteng?

SELECT *
FROM [Property24].[dbo].[1770794941712_property24]

SELECT PROVINCE , count(PROPERTY_ID) AS num_of_property_in_gauteng
FROM [Property24].[dbo].[1770794941712_property24]
where PROVINCE = 'gauteng'
Group by PROVINCE
;

--9. How many properties per province have floor size greater than 200?

SELECT PROVINCE ,
count(PROPERTY_ID) AS num_of_property_with_floor_size_greater_than_200
FROM [Property24].[dbo].[1770794941712_property24]
where FLOOR_SIZE > 200
Group by PROVINCE
;

--10. How many distinct provinces are in the table?

SELECT COUNT(DISTINCT PROVINCE) AS num_of_distinct_provinces
FROM [Property24].[dbo].[1770794941712_property24]
;

--SECTION 2 – SUM Aggregations (10 Questions)

--11. What is the total value of all properties combined?

SELECT SUM(CAST(PROPERTY_PRICE AS BIGINT))  AS property_value_combined
FROM [Property24].[dbo].[1770794941712_property24]
;

--12. What is the total property value per province?

SELECT Province , SUM(CAST(PROPERTY_PRICE AS BIGINT))  AS property_value_combined
FROM [Property24].[dbo].[1770794941712_property24]
group by PROVINCE
;

--13. What is the total property value per city?

SELECT CITY,
SUM(CAST(PROPERTY_PRICE AS BIGINT))  AS property_value_combined
FROM [Property24].[dbo].[1770794941712_property24]
GROUP BY CITY
;

--14. What is the total monthly repayment for all properties?

SELECT 
SUM(CAST(Monthly_Repayment AS BIGINT))  AS total_monthly_repayment_for_all_props
FROM [Property24].[dbo].[1770794941712_property24]
;

--15. What is the total monthly repayment per province?

SELECT Province ,
SUM(CAST(Monthly_Repayment AS BIGINT))  AS total_monthly_repayment_per_province
FROM [Property24].[dbo].[1770794941712_property24]
GROUP BY PROVINCE
;

--16. What is the total once-off cost for all properties?

SELECT
SUM(CAST(Total_Once_off_Costs AS BIGINT))  AS total_once_off_cost_for_all_properties
FROM [Property24].[dbo].[1770794941712_property24]
;

--17. What is the total once-off cost per province?

SELECT PROVINCE , 
SUM(CAST(Total_Once_off_Costs AS BIGINT))  AS total_once_off_cost_per_province
FROM [Property24].[dbo].[1770794941712_property24]
GROUP BY PROVINCE
;

--18. What is the total property value for Gauteng?

SELECT PROVINCE,
SUM(CAST(PROPERTY_PRICE AS BIGINT)) AS total_property_value_for_Gauteng
FROM Property24.dbo.[1770794941712_property24]
WHERE PROVINCE = 'Gauteng'
GROUP BY PROVINCE
;

--19. What is the total property value for properties priced above R4,000,000?

SELECT SUM(CAST (Property_price AS BIGINT)) AS total_property_value
FROM Property24.dbo.[1770794941712_property24]
WHERE PROPERTY_PRICE > 4000000
;

--20. What is the total minimum gross monthly income required per province?

SELECT PROVINCE,
SUM(CAST(Min_gross_monthly_income AS BIGINT)) AS total_min_gross_monthly_income
FROM Property24.dbo.[1770794941712_property24]
GROUP BY PROVINCE
;

--SECTION 3 – AVG Aggregations (10 Questions)

--21. What is the average property price overall?

SELECT AVG(CAST(PROPERTY_PRICE AS DECIMAL(18,2))) AS avg_property_price
FROM Property24.dbo.[1770794941712_property24]
;

--22. What is the average property price per province?

SELECT PROVINCE,
AVG(CAST(PROPERTY_PRICE AS DECIMAL(18,2))) AS avg_property_price_per_province
FROM Property24.dbo.[1770794941712_property24]
GROUP BY PROVINCE
;

--23. What is the average property price per city?

SELECT CITY,
AVG(CAST(PROPERTY_PRICE AS DECIMAL(18,2))) AS avg_property_price_per_city
FROM Property24.dbo.[1770794941712_property24]
GROUP BY CITY
;

--24. What is the average number of bedrooms per province?

SELECT PROVINCE,
AVG(CAST(BEDROOMS AS BIGINT)) AS avg_num_of_bedrooms
FROM Property24.dbo.[1770794941712_property24]
GROUP BY PROVINCE
;

--25. What is the average number of bathrooms per province?

SELECT PROVINCE,
AVG(CAST(BATHROOMS AS BIGINT)) AS avg_num_of_bathrooms_per_province
FROM Property24.dbo.[1770794941712_property24]
GROUP BY PROVINCE
;

--26. What is the average floor size per province?

SELECT PROVINCE,
AVG(CAST(FLOOR_SIZE AS BIGINT)) AS avg_floor_size_per_province
FROM Property24.dbo.[1770794941712_property24]
GROUP BY PROVINCE
;

--27. What is the average monthly repayment per province?

SELECT PROVINCE,
AVG(CAST(Monthly_Repayment AS BIGINT)) AS avg_monthly_repayment_per_province
FROM Property24.dbo.[1770794941712_property24]
GROUP BY PROVINCE
;

--28. What is the average once-off cost per province?

SELECT PROVINCE,
AVG(CAST(Total_Once_off_Costs AS BIGINT)) AS avg_once_off_cost_per_province
FROM Property24.dbo.[1770794941712_property24]
GROUP BY PROVINCE
;

--29. What is the average minimum gross monthly income per province?

SELECT PROVINCE,
AVG(CAST(Min_Gross_Monthly_Income AS BIGINT)) AS avg_min_gross_monthly_income_per_province
FROM Property24.dbo.[1770794941712_property24]
GROUP BY PROVINCE
;

--30. What is the average property price for properties above R3,000,000?

SELECT 
AVG(CAST(PROPERTY_PRICE AS BIGINT)) AS avg_property_price
FROM Property24.dbo.[1770794941712_property24]
WHERE PROPERTY_PRICE > 3000000
;

--SECTION 4 – GROUP BY + Filtering (10 Questions)
--31. Which province has the highest average property price?
--32. Which province has the lowest average property price?
--33. Which city has the highest total property value?
--34. Which city has the lowest average property price?
--35. How many properties per province are priced above R2,000,000?
--36. What is the average floor size per province for properties above R3,000,000?
--37. What is the total property value per province for properties with 3 or more bedrooms?
--38. What is the average monthly repayment per province for properties above R4,000,000?
--39. How many properties per city have parking for 2 or more cars?
--40. What is the average minimum gross monthly income per province for properties above R5,000,000?
