CREATE VIEW View_User_Information AS
SELECT 
    U.user_id, 
    U.first_name, 
    U.last_name, 
    U.year_of_birth, 
    U.month_of_birth, 
    U.day_of_birth, 
    U.gender, 
    C1.city_name AS current_city, 
    C1.state_name AS current_state, 
    C1.country_name AS current_country, 
    C2.city_name AS hometown_city, 
    C2.state_name AS hometown_state, 
    C2.country_name AS hometown_country,
    P.institution AS institution_name, 
    E.program_year, 
    P.concentration AS program_concentration, 
    P.degree AS program_degree
FROM Users U
JOIN User_Current_Cities CC ON U.user_id = CC.user_id
JOIN Cities C1 ON CC.current_city_id = C1.city_id
JOIN User_Hometown_Cities HC ON U.user_id = HC.user_id
JOIN Cities C2 ON HC.hometown_city_id = C2.city_id
LEFT JOIN Education E ON U.user_id = E.user_id
LEFT JOIN Programs P ON E.program_id = P.program_id;

CREATE VIEW View_Are_Friends AS
SELECT user1_id, user2_id
FROM Friends;

CREATE VIEW View_Photo_Information AS
SELECT 
    A.album_id, 
    A.album_owner_id AS owner_id,
    A.cover_photo_id,
    A.album_name,
    A.album_created_time,
    A.album_modified_time,
    A.album_link,
    A.album_visibility,
    P.photo_id,
    P.photo_caption,
    P.photo_created_time,
    P.photo_modified_time,
    P.photo_link
FROM Albums A
JOIN Photos P ON P.album_id = A.album_id;

CREATE VIEW View_Event_Information AS
SELECT 
    E.event_id,
    E.event_creator_id,
    E.event_name,
    E.event_tagline,
    E.event_description,
    E.event_host,
    E.event_type,
    E.event_subtype,
    E.event_address,
    C.city_name AS event_city,
    C.state_name AS event_state,
    C.country_name AS event_country,
    E.event_start_time,
    E.event_end_time
FROM User_Events E
JOIN Cities C ON E.event_city_id = C.city_id;

CREATE VIEW View_Tag_Information AS
SELECT
    tag_photo_id AS photo_id,
    tag_subject_id, 
    tag_created_time, 
    tag_x AS tag_x_coordinate, 
    tag_y AS tag_y_coordinate
FROM Tags;



