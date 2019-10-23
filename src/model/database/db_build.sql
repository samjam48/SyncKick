BEGIN;

DROP TABLE IF EXISTS users, content, match_content CASCADE;

CREATE TABLE users (
    id                  SERIAL          PRIMARY KEY,
    user_name           VARCHAR(100)    NOT NULL,
    user_image          VARCHAR,
    following_list      int[]
);

CREATE TABLE content (
    id                  SERIAL          PRIMARY KEY,
    title               VARCHAR(100)    NOT NULL,
    content_description VARCHAR(500),
    content_url         VARCHAR    NOT NULL,
    content_image       VARCHAR,
    time_length         VARCHAR,
    content_creator     VARCHAR
);

CREATE TABLE match_content (
    id                  SERIAL          PRIMARY KEY,
    user_id             INTEGER         NOT NULL,
    content_id          INTEGER         NOT NULL,
    point_of_time       VARCHAR,
    start_time          VARCHAR,
    currently_listening BOOLEAN,
    rating              INTEGER
);

INSERT INTO users (user_name, user_image, following_list) VALUES
('Sam', 'https://media.licdn.com/dms/image/C5603AQGJI-F0A-VtrA/profile-displayphoto-shrink_200_200/0?e=1573689600&v=beta&t=D0ApArQBJpY0zntmvnqjF6b8wbfSCRDeRIhCys3kUa0', '{2, 4}'),
('Sarah', 'https://media.licdn.com/dms/image/C5103AQFtjwGG9UcovQ/profile-displayphoto-shrink_200_200/0?e=1573689600&v=beta&t=ZNk3-2MEh48xLQiyxotjqZbplgazR3gBKVaS3lWi-18', '{3}'),
('Lucie', 'https://media.licdn.com/dms/image/C5603AQFl3TnJXFgy9w/profile-displayphoto-shrink_200_200/0?e=1573689600&v=beta&t=WjeqDXfSS5xixoTK_o79t17gfRp7CBFbZDDi4MVenP4', '{4, 1, 2}'),
('Mrs Bean', 'https://dp.profilepics.in/profile_pictures/good/good_profile_pics_01.jpg', '{1}');

INSERT INTO content (title, content_description, content_url, content_image, time_length, content_creator) VALUES
('Heather-adams-intro.mp3', 'Heather introduction','https://anchor.fm/growth-mindset-podcast/episodes/66-Sam-Harris---The-Lost-Art-of-Listening-to-Yourself-e4tukt', 'https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded_episode400/798221/798221-1565531007591-fc871923c6237.jpg', '00:00:54', 'Sam Harris' ),
('Scramble.mp3','right channel scramble','https://anchor.fm/s/55a9394/podcast/rss','https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded_episode400/798221/798221-1568189143375-992215fe34b24.jpg','00:00:02','Sam Harris'),
('Time-Travel.mp3','time travel','https://anchor.fm/s/55a9394/podcast/rss','https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded_episode400/798221/798221-1568189143375-992215fe34b24.jpg','00:00:03','Sam Harris');

INSERT INTO match_content (user_id, content_id, point_of_time, start_time, currently_listening, rating) VALUES
(1, 1, '00:00:48', '1568478582890', FALSE, 3),
(2, 1, '00:00:28', '1568478582890', FALSE, 3),
(3, 2, '00:00:01', '1568478582890', FALSE, 3),
(1, 2, '00:00:00', '1568478582890', FALSE, 3),
(2, 3, '00:00:01', '1568478768026', TRUE, 5);

COMMIT;
