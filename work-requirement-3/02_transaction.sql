BEGIN;

-- Update the trip name
UPDATE trips
SET trip_name = 'Japan Adventure'
WHERE trip_id = 4;

-- Extend the trip by five days
UPDATE trips
SET end_date = '2027-03-20'
WHERE trip_id = 4;

COMMIT;

-- Check the updated trip
SELECT trip_id, trip_name, start_date, end_date
FROM trips
WHERE trip_id = 4;