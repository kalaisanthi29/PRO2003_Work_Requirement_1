-- Work Requirement 2: Insert test data
-- Add five example users to the Travel Planner database.

INSERT INTO users (name, email)
VALUES
    ('Emma Johnson', 'emma.johnson@example.com'),
    ('Oliver Smith', 'oliver.smith@example.com'),
    ('Sophia Brown', 'sophia.brown@example.com'),
    ('Noah Wilson', 'noah.wilson@example.com'),
    ('Mia Davis', 'mia.davis@example.com');

-- Check that the users were inserted successfully.
SELECT * FROM users;

SELECT * FROM public.users;

-- Add sample trips for the five users.
-- Each trip is connected to a user through user_id.

INSERT INTO trips (user_id, trip_name, start_date, end_date)
VALUES
    (1, 'Summer in Italy', '2026-06-10', '2026-06-20'),
    (1, 'Weekend in Paris', '2026-09-12', '2026-09-15'),
    (2, 'Thailand Adventure', '2026-11-05', '2026-11-20'),
    (3, 'Exploring Japan', '2027-03-01', '2027-03-15'),
    (4, 'Spain Road Trip', '2027-05-10', '2027-05-24'),
    (5, 'Norway Nature Trip', '2027-07-01', '2027-07-10'),
    (2, 'Christmas in London', '2026-12-20', '2026-12-27'),
    (3, 'Greece Island Holiday', '2027-06-15', '2027-06-25');

-- Display all trips to verify the inserted records.
SELECT * FROM trips;

-- Add destinations for the Travel Planner database.
-- Each destination represents a city and country.

INSERT INTO destinations (city, country)
VALUES
    ('Rome', 'Italy'),
    ('Florence', 'Italy'),
    ('Venice', 'Italy'),
    ('Paris', 'France'),
    ('Bangkok', 'Thailand'),
    ('Chiang Mai', 'Thailand'),
    ('Tokyo', 'Japan'),
    ('Kyoto', 'Japan'),
    ('Barcelona', 'Spain'),
    ('Madrid', 'Spain'),
    ('Oslo', 'Norway'),
    ('Bergen', 'Norway'),
    ('London', 'United Kingdom'),
    ('Athens', 'Greece'),
    ('Santorini', 'Greece');

-- Display all destinations to verify the inserted data.
SELECT * FROM destinations;

-- Connect trips with their destinations.
-- A trip can include multiple cities.

INSERT INTO trip_destinations (trip_id, destination_id)
VALUES
    (1, 1),   -- Summer in Italy: Rome
    (1, 2),   -- Summer in Italy: Florence
    (1, 3),   -- Summer in Italy: Venice
    (2, 4),   -- Weekend in Paris: Paris
    (3, 5),   -- Thailand Adventure: Bangkok
    (3, 6),   -- Thailand Adventure: Chiang Mai
    (4, 7),   -- Exploring Japan: Tokyo
    (4, 8),   -- Exploring Japan: Kyoto
    (5, 9),   -- Spain Road Trip: Barcelona
    (5, 10),  -- Spain Road Trip: Madrid
    (6, 11),  -- Norway Nature Trip: Oslo
    (6, 12),  -- Norway Nature Trip: Bergen
    (7, 13),  -- Christmas in London: London
    (8, 14),  -- Greece Island Holiday: Athens
    (8, 15);  -- Greece Island Holiday: Santorini

-- Check the relationships between trips and destinations.
SELECT * FROM trip_destinations;

-- Add activities for different trip destinations.
-- Each activity is linked to a trip destination.

-- Add activities for different trip destinations.
-- Each activity is linked to a trip destination.

INSERT INTO activities
    (trip_destination_id, activity_name, activity_date, notes)
VALUES
    (1, 'Visit the Colosseum', '2026-06-11',
     'Explore ancient Roman history'),

    (2, 'Visit Uffizi Gallery', '2026-06-15',
     'See famous Renaissance artworks'),

    (3, 'Gondola Ride', '2026-06-18',
     'Explore the canals of Venice'),

    (4, 'Visit Eiffel Tower', '2026-09-13',
     'Enjoy the view of Paris'),

    (5, 'Grand Palace Tour', '2026-11-06',
     'Visit the historic palace in Bangkok'),

    (6, 'Visit Doi Suthep Temple', '2026-11-12',
     'Explore the famous mountain temple'),

    (7, 'Explore Shibuya', '2027-03-03',
     'Experience Tokyo city life'),

    (8, 'Visit Fushimi Inari Shrine', '2027-03-10',
     'Walk through the red torii gates'),

    (9, 'Visit Sagrada Familia', '2027-05-12',
     'Explore Gaudi architecture'),

    (10, 'Visit Prado Museum', '2027-05-20',
     'See famous Spanish paintings'),

    (11, 'Visit Vigeland Park', '2027-07-02',
     'Explore the sculpture park'),

    (12, 'Explore Bryggen', '2027-07-06',
     'Visit historic Bergen'),

    (13, 'Visit Tower of London', '2026-12-22',
     'Explore British history'),

    (14, 'Visit Acropolis', '2027-06-16',
     'Explore ancient Greek ruins'),

    (15, 'Santorini Sunset Tour', '2027-06-20',
     'Watch the sunset in Oia');
    
   
    