-- CREATE TABLE Users 
-- -
-- user_id
-- first_name
-- last_name
-- year_of_birth
-- month_of_birth
-- day_of_birth
-- gender

-- INSERT INTO Users from Project1
INSERT INTO Users (user_id, first_name, last_name, year_of_birth, month_of_birth, day_of_birth, gender)
SELECT DISTINCT user_id, first_name, last_name, year_of_birth, month_of_birth, day_of_birth, gender
FROM project1.Public_User_Information;

-- CREATE TABLE Friends 

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