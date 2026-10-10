-- Work Requirement 2: SELECT Queries
-- Travel Planner Database

-- Query 1: Find trips starting in 2027.
-- This query retrieves trips scheduled to begin
-- between 1 January and 31 December 2027.

SELECT
    trip_id,
    trip_name,
    start_date,
    end_date
FROM trips
WHERE start_date >= '2027-01-01'
  AND start_date < '2028-01-01'
ORDER BY start_date;

-- Query 2: Display trips with their owners.
-- This query joins users and trips using user_id
-- to show which traveller planned each trip.

SELECT
    u.name AS traveller_name,
    t.trip_name,
    t.start_date,
    t.end_date
FROM users AS u
JOIN trips AS t
    ON u.user_id = t.user_id
ORDER BY u.name, t.start_date;

-- Query 3: Display destinations for each trip.
-- This query joins four tables to show which cities
-- and countries each traveller plans to visit.

SELECT
    u.name AS traveller_name,
    t.trip_name,
    d.city,
    d.country
FROM users AS u
JOIN trips AS t
    ON u.user_id = t.user_id
JOIN trip_destinations AS td
    ON t.trip_id = td.trip_id
JOIN destinations AS d
    ON td.destination_id = d.destination_id
ORDER BY t.trip_name, d.city;

-- Query 4: Count the number of trips per traveller.
-- This query groups trips by traveller and uses COUNT()
-- to calculate how many trips each person has planned.

SELECT
    u.name AS traveller_name,
    COUNT(t.trip_id) AS total_trips
FROM users AS u
JOIN trips AS t
    ON u.user_id = t.user_id
GROUP BY u.user_id, u.name
ORDER BY total_trips DESC, u.name;

-- Query 5: Find travellers with more than one trip.
-- This query groups trips by traveller and uses HAVING
-- to show only travellers who planned multiple trips.

SELECT
    u.name AS traveller_name,
    COUNT(t.trip_id) AS total_trips
FROM users AS u
JOIN trips AS t
    ON u.user_id = t.user_id
GROUP BY u.user_id, u.name
HAVING COUNT(t.trip_id) > 1
ORDER BY total_trips DESC, u.name;

-- Query 6: Count destinations for each trip.
-- This query joins trips with trip_destinations
-- and counts how many cities are included in each trip.

SELECT
    t.trip_name,
    COUNT(td.destination_id) AS total_destinations
FROM trips AS t
JOIN trip_destinations AS td
    ON t.trip_id = td.trip_id
GROUP BY t.trip_id, t.trip_name
ORDER BY total_destinations DESC, t.trip_name;

-- Query 7: Calculate the duration of each trip.
-- This query subtracts the start date from the end date
-- and adds one to include both travel dates.

SELECT
    trip_name,
    start_date,
    end_date,
    (end_date - start_date + 1) AS duration_days
FROM trips
ORDER BY duration_days DESC, trip_name;

-- Query 8: Calculate the average trip duration.
-- This query uses AVG() to calculate the average
-- number of calendar days across all planned trips.

SELECT
    ROUND(AVG(end_date - start_date + 1), 2)
        AS average_trip_duration_days
FROM trips;

-- Query 9: Find trips longer than the average duration.
-- The subquery calculates the average trip duration.
-- The main query displays trips that exceed this average.

SELECT
    trip_name,
    start_date,
    end_date,
    (end_date - start_date + 1) AS duration_days
FROM trips
WHERE (end_date - start_date + 1) > (
    SELECT AVG(end_date - start_date + 1)
    FROM trips
)
ORDER BY duration_days DESC, trip_name;

-- Query 10: Display planned activities with trip destinations.
-- This query joins four tables to show each activity,
-- the trip it belongs to, and its city and country.
-- Activities are sorted chronologically.

SELECT
    t.trip_name,
    d.city,
    d.country,
    a.activity_name,
    a.activity_date
FROM activities AS a
JOIN trip_destinations AS td
    ON a.trip_destination_id = td.trip_destination_id
JOIN trips AS t
    ON td.trip_id = t.trip_id
JOIN destinations AS d
    ON td.destination_id = d.destination_id
ORDER BY a.activity_date, t.trip_name;