-- Create a limited database role
CREATE ROLE travel_viewer
WITH LOGIN PASSWORD 'YourPasswordHere';

-- Allow access to the database
GRANT CONNECT ON DATABASE travel_planner_test TO travel_viewer;

-- Allow access to the schema
GRANT USAGE ON SCHEMA public TO travel_viewer;

-- Allow the role to read data
GRANT SELECT ON ALL TABLES IN SCHEMA public TO travel_viewer;

-- Check permissions
SELECT
    has_table_privilege('travel_viewer', 'public.trips', 'SELECT') AS can_read,
    has_table_privilege('travel_viewer', 'public.trips', 'INSERT') AS can_insert,
    has_table_privilege('travel_viewer', 'public.trips', 'UPDATE') AS can_update,
    has_table_privilege('travel_viewer', 'public.trips', 'DELETE') AS can_delete;