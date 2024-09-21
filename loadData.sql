-- CREATE TABLE Users 
-- INSERT INTO Users from Project1
INSERT INTO Users (user_id, first_name, last_name, year_of_birth, month_of_birth, day_of_birth, gender)
SELECT DISTINCT user_id, first_name, last_name, year_of_birth, month_of_birth, day_of_birth, gender
FROM project1.Public_User_Information;

-- CREATE TABLE Friends 

INSERT INTO Friends(user1_id, user2_id)
SELECT DISTINCT LEAST(user1_id, user2_id) AS user1_id, GREATEST(user1_id, user2_id) AS user2_id
FROM project1.Public_Are_Friends;

-- CREATE TABLE Friends (
--     user1_id INTEGER, 
--     user2_id INTEGER,
--     PRIMARY KEY (user1_id, user2_id),
--     FOREIGN KEY (user1_id) REFERENCES Users(user_id) ON DELETE CASCADE,
--     FOREIGN KEY (user2_id) REFERENCES Users(user_id) ON DELETE CASCADE
-- );

-- CREATE TABLE Cities

-- CREATE TABLE User_Current_Cities 

-- CREATE TABLE User_Hometown_Cities 

-- CREATE TABLE Messages 

-- CREATE TABLE Programs

-- CREATE TABLE Education 

-- CREATE TABLE User_Events 

-- CREATE TABLE Participants 

-- CREATE TABLE Albums 

-- CREATE TABLE Photos

-- CREATE TABLE Tags