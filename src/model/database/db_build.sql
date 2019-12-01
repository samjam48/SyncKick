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
('Sam', 'https://media.licdn.com/dms/image/C5603AQGJI-F0A-VtrA/profile-displayphoto-shrink_200_200/0?e=1580947200&v=beta&t=IeLCO5HFmCO6FqeT4nyWSpy--guwOf4Z3S0bSU8UP4w', '{2, 3}'),
('Sarah', 'https://media.licdn.com/dms/image/C5103AQFtjwGG9UcovQ/profile-displayphoto-shrink_200_200/0?e=1580947200&v=beta&t=kiCsrAGJWQSHiiRcoQDRU5pf9ZMCNdzsMpsRLOo4e1Q', '{3}'),
('Lucie', 'https://media.licdn.com/dms/image/C5603AQFl3TnJXFgy9w/profile-displayphoto-shrink_200_200/0?e=1580947200&v=beta&t=_OPP1C1DpeB6GQ_p9uxL4Lw2cVcMdq0JiBvI_UeDeHI', '{4, 1, 2}'),
('Mrs Bean', 'https://dp.profilepics.in/profile_pictures/good/good_profile_pics_01.jpg', '{1}');

INSERT INTO content (title, filename, content_description, content_url, content_image, time_length, content_creator) VALUES
('Heather Intro', 'Heather-Adams-Intro.mp3', 'Heather introduction','https://anchor.fm/growth-mindset-podcast/episodes/66-Sam-Harris---The-Lost-Art-of-Listening-to-Yourself-e4tukt', 'https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded_episode400/798221/798221-1565531007591-fc871923c6237.jpg', '00:00:54', 'Sam Harris' ),
('65: Lifehack 2019 - Growth Mindset Podcast', '65: Lifehack 2019 - Growth Mindset Podcast.mp3', 'The best lifehack for 2019 you have never heard of', 'https://anchor.fm/growth-mindset-podcast/episodes/66-Sam-Harris---The-Lost-Art-of-Listening-to-Yourself-e4tukt', 'https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded_episode400/798221/798221-1565531007591-fc871923c6237.jpg', '00:20:00', 'Sam Harris' ),
('66: The Lost Art of Listening To Yourself - Growth Mindset Podcast', '66: The Lost Art of Listening To Yourself - Growth Mindset Podcast.mp3', 'The best lifehack for 2019 you have never heard of', 'https://anchor.fm/growth-mindset-podcast/episodes/66-Sam-Harris---The-Lost-Art-of-Listening-to-Yourself-e4tukt', 'https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded_episode400/798221/798221-1565531007591-fc871923c6237.jpg', '00:20:00', 'Sam Harris' ),
('Makhai Beats', 'Love Chances.mp3','Mellow Beats to enjoy','https://anchor.fm/s/55a9394/podcast/rss','https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded_episode400/798221/798221-1568189143375-992215fe34b24.jpg','00:02:26','Makhai Beats'),
('Inspiring Corporate Music', 'Scott_Holmes_-_10_-_Inspiring_Corporate.mp3','Inspiring Corporate Music','https://anchor.fm/s/55a9394/podcast/rss','https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded_episode400/798221/798221-1568189143375-992215fe34b24.jpg','00:02:29','Scott Holmes'),
('Happy Ending', 'Scott_Holmes_-_11_-_Happy_Ending.mp3','Inspiring Corporate Music','https://anchor.fm/s/55a9394/podcast/rss','https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded_episode400/798221/798221-1568189143375-992215fe34b24.jpg','00:02:33','Scott Holmes');



INSERT INTO match_content (user_id, content_id, current_time_in_track, time_started_utc, currently_listening, target_time, rating) VALUES
(1, 4, '00:00:48', '1568478582890', FALSE, 80, 3),
(1, 2, '00:03:00', '1568478582890', TRUE, 600, 3),
(1, 5, '00:00:00', '1568478582890', FALSE, 200, 3),
(2, 2, '00:05:00', '1568478582890', FALSE, 35, 3),
(2, 3, '00:04:01', '1568478768026', TRUE, 2, 5),
(3, 6, '00:00:20', '1568478582890', FALSE, 150, 3),
(3, 4, '00:00:01', '1568478582890', FALSE, 80, 3),
(3, 3, '00:10:01', '1568478582890', TRUE, 2, 3),
(4, 2, '00:05:01', '1568478582890', FALSE, 2, 3);

COMMIT;
