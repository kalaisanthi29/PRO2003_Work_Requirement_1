CREATE TABLE users (
    user_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE trips (
    trip_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id INTEGER NOT NULL,
    trip_name VARCHAR(150) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,

    CONSTRAINT fk_trip_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id),

    CONSTRAINT check_trip_dates
        CHECK (end_date >= start_date)
);

CREATE TABLE destinations (
    destination_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL
);

CREATE TABLE trip_destinations (
    trip_destination_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    trip_id INTEGER NOT NULL,
    destination_id INTEGER NOT NULL,

    CONSTRAINT fk_trip_destination_trip
        FOREIGN KEY (trip_id)
        REFERENCES trips(trip_id),

    CONSTRAINT fk_trip_destination_destination
        FOREIGN KEY (destination_id)
        REFERENCES destinations(destination_id),

    CONSTRAINT unique_trip_destination
        UNIQUE (trip_id, destination_id)
);

CREATE TABLE activities (
    activity_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    trip_destination_id INTEGER NOT NULL,
    activity_name VARCHAR(150) NOT NULL,
    activity_date DATE,
    notes TEXT,

    CONSTRAINT fk_activity_trip_destination
        FOREIGN KEY (trip_destination_id)
        REFERENCES trip_destinations(trip_destination_id)
);