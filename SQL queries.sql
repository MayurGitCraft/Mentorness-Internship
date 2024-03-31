-- 1. What is the total number of reservations in the dataset? 
select 
 COUNT(*) AS Total_Reservations
 FROM hrap;

-- 2. Which meal plan is the most popular among guests?
 
SELECT type_of_meal_plan, 
       COUNT(*) AS total_bookings
FROM hrap
GROUP BY type_of_meal_plan
ORDER BY total_bookings DESC
LIMIT 1;


-- 3. What is the average price per room for reservations involving children?
 
SELECT 
ROUND(AVG(avg_price_per_room),2) as Average_Price_Per_Room
FROM hrap
Where no_of_children>0;

-- 4. How many reservations were made for the year 20XX (replace XX with the desired year)? 
SELECT COUNT(*) AS total_reservations
FROM hrap
WHERE EXTRACT(YEAR FROM arrival_date) = 2017;


-- 5.What is the most commonly booked room type?

SELECT room_type_reserved, COUNT(*) AS num_bookings
FROM hrap
GROUP BY room_type_reserved
ORDER BY num_bookings DESC
LIMIT 1;


-- 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)? 
SELECT COUNT(*) AS num_weekend_reservations
FROM hrap
WHERE no_of_weekend_nights > 0;

-- 7. What is the highest and lowest lead time for reservations? 
SELECT 
    MAX(lead_time) AS highest_lead_time,
    MIN(lead_time) AS lowest_lead_time
FROM 
    hrap;


-- 8. What is the most common market segment type for reservations?
SELECT market_segment_type, COUNT(*) AS num_reservations
FROM hrap
GROUP BY market_segment_type
ORDER BY num_reservations DESC;
 
-- 9. How many reservations have a booking status of "Confirmed"? 
SELECT COUNT(*) AS num_confirmed_reservations
FROM hrap
WHERE booking_status = 'Not_Canceled';


-- 10. What is the total number of adults and children across all reservations? 
SELECT
SUM(no_of_adults) AS total_adults,
SUM(no_of_children) AS total_children
from hrap;

-- 11. What is the average number of weekend nights for reservations involving children?
SELECT AVG(no_of_weekend_nights) AS avg_weekend_nights
FROM hrap
WHERE no_of_children > 0;


-- 12. How many reservations were made in each month of the year? 
SELECT EXTRACT(MONTH FROM arrival_date) AS month,
       COUNT(*) AS num_reservations
FROM hrap
GROUP BY EXTRACT(MONTH FROM arrival_date)
ORDER BY month;

-- 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
select room_type_reserved,
ROUND(AVG(no_of_weekend_nights + no_of_week_nights),2) AS avg_nights
FROM hrap
GROUP BY room_type_reserved;

-- 14. For reservations involving children, what is the most common room type, and what is the average price for that room type? 
SELECT room_type_reserved AS most_common_room_type,
ROUND(AVG(avg_price_per_room),2) AS average_price
FROM hrap
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY average_price DESC;


-- 15. Find the market segment type that generates the highest average price per room.
select market_segment_type,
ROUND(AVG(avg_price_per_room),2) AS average_price
FROM hrap
GROUP BY market_segment_type
ORDER BY average_price DESC;