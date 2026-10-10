-- Work Requirement 2: Update and Delete Data
-- This script demonstrates how existing records
-- can be modified and removed using SQL.

-- 1. UPDATE
-- Change the notes for the Colosseum activity.

UPDATE activities
SET notes = 'Guided tour of the Colosseum and Roman Forum'
WHERE activity_name = 'Visit the Colosseum';

-- Verify that the activity was updated.
SELECT *
FROM activities
WHERE activity_name = 'Visit the Colosseum';


-- 2. DELETE
-- Remove the Santorini Sunset Tour activity.
-- Only this specific activity should be deleted.

DELETE FROM activities
WHERE activity_name = 'Santorini Sunset Tour';

-- Verify that the activity was deleted.
SELECT *
FROM activities
WHERE activity_name = 'Santorini Sunset Tour';