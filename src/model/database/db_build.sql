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
    filename             VARCHAR(500)    NOT NULL,
    title               VARCHAR(100)    NOT NULL,
    content_description VARCHAR(500),
    content_url         VARCHAR    NOT NULL,
    content_image       VARCHAR,
    time_length         VARCHAR,
    content_creator     VARCHAR
);

CREATE TABLE match_content (
    id                      SERIAL          PRIMARY KEY,
    user_id                 INTEGER         NOT NULL,
    content_id              INTEGER         NOT NULL,
    current_time_in_track   VARCHAR,
    time_started_utc        VARCHAR,
    currently_listening     BOOLEAN,
    target_time             INTEGER,
    rating                  INTEGER
);

INSERT INTO users (user_name, user_image, following_list) VALUES
('Sam', 'https://media.licdn.com/dms/image/C5603AQGJI-F0A-VtrA/profile-displayphoto-shrink_200_200/0?e=1573689600&v=beta&t=D0ApArQBJpY0zntmvnqjF6b8wbfSCRDeRIhCys3kUa0', '{2, 3}'),
('Sarah', 'https://media.licdn.com/dms/image/C5103AQFtjwGG9UcovQ/profile-displayphoto-shrink_200_200/0?e=1573689600&v=beta&t=ZNk3-2MEh48xLQiyxotjqZbplgazR3gBKVaS3lWi-18', '{3}'),
('Lucie', 'https://media.licdn.com/dms/image/C5603AQFl3TnJXFgy9w/profile-displayphoto-shrink_200_200/0?e=1573689600&v=beta&t=WjeqDXfSS5xixoTK_o79t17gfRp7CBFbZDDi4MVenP4', '{4, 1, 2}'),
('Mrs Bean', 'https://dp.profilepics.in/profile_pictures/good/good_profile_pics_01.jpg', '{1}');

INSERT INTO content (title, filename, content_description, content_url, content_image, time_length, content_creator) VALUES
('Heather Intro', 'Heather-adams-intro.mp3', 'Heather introduction','https://anchor.fm/growth-mindset-podcast/episodes/66-Sam-Harris---The-Lost-Art-of-Listening-to-Yourself-e4tukt', 'https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded_episode400/798221/798221-1565531007591-fc871923c6237.jpg', '00:00:54', 'Sam Harris' ),
('65: Lifehack 2019 - Growth Mindset Podcast', '65- Lifehack 2019 - Growth Mindset Podcast.mp3', 'The best lifehack for 2019 you have never heard of', 'https://anchor.fm/growth-mindset-podcast/episodes/66-Sam-Harris---The-Lost-Art-of-Listening-to-Yourself-e4tukt', 'https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded_episode400/798221/798221-1565531007591-fc871923c6237.jpg', '00:20:00', 'Sam Harris' ),
('Scramble', 'Scramble.mp3','right channel scramble','https://anchor.fm/s/55a9394/podcast/rss','https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded_episode400/798221/798221-1568189143375-992215fe34b24.jpg','00:00:02','Sam Harris'),
('Time travel', 'Time-Travel.mp3','time travel','https://anchor.fm/s/55a9394/podcast/rss','https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded_episode400/798221/798221-1568189143375-992215fe34b24.jpg','00:00:03','Sam Harris');

INSERT INTO match_content (user_id, content_id, current_time_in_track, time_started_utc, currently_listening, target_time, rating) VALUES
(1, 1, '00:00:48', '1568478582890', FALSE, 50, 3),
(1, 2, '00:03:00', '1568478582890', FALSE, 600, 3),
(2, 1, '00:00:28', '1568478582890', FALSE, 35, 3),
(3, 2, '00:00:01', '1568478582890', FALSE, 2, 3),
(2, 3, '00:00:01', '1568478768026', TRUE, 2, 5);

COMMIT;
