-- Create a table called 'users'
CREATE TABLE Users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Insert some data into the 'users' table
INSERT INTO users (first_name, last_name, email)
VALUES 
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Doe', 'jane.doe@example.com'),
('Alice', 'Smith', 'alice.smith@example.com'),
('Bob', 'Brown', 'bob.brown@example.com');

-- Select data from the 'users' table
SELECT * FROM users;

-- Count the number of users
SELECT COUNT(*) AS user_count FROM users;
