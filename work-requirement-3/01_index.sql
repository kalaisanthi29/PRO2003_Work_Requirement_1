-- Check query performance before adding the index
EXPLAIN ANALYZE
SELECT *
FROM trips
WHERE start_date >= '2027-01-01'
AND start_date < '2028-01-01';

-- Create index on start_date
CREATE INDEX idx_trips_start_date
ON trips(start_date);

-- Check query performance after adding the index
EXPLAIN ANALYZE
SELECT *
FROM trips
WHERE start_date >= '2027-01-01'
AND start_date < '2028-01-01';