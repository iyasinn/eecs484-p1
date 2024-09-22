-- CREATE TABLE Users 
-- INSERT INTO Users from Project1
INSERT INTO Users (user_id, first_name, last_name, year_of_birth, month_of_birth, day_of_birth, gender)
SELECT DISTINCT user_id, first_name, last_name, year_of_birth, month_of_birth, day_of_birth, gender
FROM project1.Public_User_Information;

-- CREATE TABLE Friends 

INSERT INTO Friends(user1_id, user2_id)
SELECT DISTINCT LEAST(user1_id, user2_id) AS user1_id, GREATEST(user1_id, user2_id) AS user2_id
FROM project1.Public_Are_Friends;

-- CREATE TABLE Cities
INSERT INTO Cities(city_name, state_name, country_name)
SELECT DISTINCT 
    current_city AS city_name, 
    current_state AS state_name, 
    current_country AS country_name
FROM project1.Public_User_Information
UNION
SELECT DISTINCT 
    hometown_city AS city_name, 
    hometown_state AS state_name, 
    hometown_country AS country_name
FROM project1.Public_User_Information;


INSERT INTO User_Current_Cities(user_id, current_city_id)
SELECT DISTINCT 
    pui.user_id, 
    c.city_id 
FROM 
    project1.Public_User_Information pui
    JOIN Cities c ON pui.current_city = c.city_name 
                  AND pui.current_state = c.state_name 
                  AND pui.current_country = c.country_name 


INSERT INTO User_Hometown_Cities(user_id, hometwon_city_id)
SELECT DISTINCT 
    pui.user_id, 
    c.city_id
FROM 
    project1.Public_User_Information pui 
    JOIN Cities c ON pui.hometown_city = c.city_name
                  AND pui.hometown_state = c.state_name 
                  AND pui.hometown_country = c.country_name


-- INSERT INTO User_Hometown_Cities(user_id, hometown_city_id)
-- SELECT DISTINCT 
--     user_id, 
--     (SELECT city_id 
--      FROM Cities
--      WHERE city_name = hometown_city
--        AND state_name = hometown_state
--        AND country_name = hometown_country) AS hometown_city_id
-- FROM project1.Public_User_Information WHERE city_id IS NOT NULL;

-- CREATE TABLE Programs
INSERT INTO Programs (institution, concentration, degree)
    SELECT DISTINCT institution_name AS institution, program_concentration AS concentration, program_degree AS degree
FROM project1.Public_User_Information
WHERE institution_name IS NOT NULL;

-- CREATE TABLE Programs (
--     program_id INTEGER, 
--     institution VARCHAR2(100) NOT NULL, 
--     concentration VARCHAR2(100) NOT NULL, 
--     degree VARCHAR2(100) NOT NULL,
--     PRIMARY KEY (program_id),
--     UNIQUE (institution, concentration, degree)
-- );


-- CREATE TABLE Education 
INSERT INTO Education (user_id, program_id, program_year)
SELECT DISTINCT 
    pub.user_id, 
    p.program_id, 
    pub.program_year
FROM project1.Public_User_Information pub
JOIN Programs p 
    ON pub.institution_name = p.institution 
    AND pub.program_concentration = p.concentration 
    AND pub.program_degree = p.degree;


-- CREATE TABLE User_Events 
INSERT INTO User_Events (event_id, event_creator_id, event_name, event_tagline, event_description, event_host,
    event_type, event_subtype, event_address, event_city_id, event_start_time, event_end_time)
SELECT DISTINCT 
    pub.event_id, 
    pub.event_creator_id, 
    pub.event_name, 
    pub.event_tagline, 
    pub.event_description, 
    pub.event_host,
    pub.event_type, 
    pub.event_subtype, 
    pub.event_address, 
    c.event_city_id, 
    pub.event_start_time, 
    pub.event_end_time
FROM project1.Public_Event_Information pub
JOIN Cities c 
    ON pub.event_city = c.city_name 
    AND pub.event_state = c.state_name
    AND pub.event_country = c.country_name;


-- CREATE TABLE Albums 
INSERT INTO Albums (album_id, album_owner_id, album_name, album_created_time, album_modified_time, album_link, album_visibility, cover_photo_id)
SELECT DISTINCT album_id, owner_id, album_name, album_created_time, album_modified_time, album_link, album_visibility, cover_photo_id
FROM project1.Public_Photo_Information;


-- CREATE TABLE Photos
INSERT INTO Photos (photo_id, album_id, photo_caption, photo_created_time, photo_modified_time, photo_link)
SELECT DISTINCT photo_id, album_id, photo_caption, photo_created_time, photo_modified_time, photo_link
FROM project1.Public_Photo_Information;


-- CREATE TABLE Tags
INSERT INTO Tags (tag_photo_id, tag_subject_id, tag_created_time, tag_x, tag_y)
SELECT DISTINCT photo_id, tag_subject_id, tag_created_time, tag_x_coordinate, tag_y_coordinate
FROM project1.Public_Tag_Information;