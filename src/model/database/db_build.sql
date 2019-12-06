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
('Problems and Solutions', '4-Agustin-Problems_&_Solutions.mp3', 'Agustin Gonzalez offers some sage stoic advice','https://growthmindsetpodcast.com', 'https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded_episode400/798221/798221-1565531007591-fc871923c6237.jpg', '00:06:38', 'Sam Harris' ),
('65: Lifehack 2019 - Growth Mindset Podcast', '65: Lifehack 2019 - Growth Mindset Podcast.mp3', 'The best lifehack for 2019 you have never heard of', 'https://anchor.fm/growth-mindset-podcast/episodes/66-Sam-Harris---The-Lost-Art-of-Listening-to-Yourself-e4tukt', 'https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded_episode400/798221/798221-1565531007591-fc871923c6237.jpg', '00:20:00', 'Sam Harris' ),
('66: The Lost Art of Listening To Yourself - Growth Mindset Podcast', '66: The Lost Art of Listening To Yourself - Growth Mindset Podcast.mp3', 'The best lifehack for 2019 you have never heard of', 'https://anchor.fm/growth-mindset-podcast/episodes/66-Sam-Harris---The-Lost-Art-of-Listening-to-Yourself-e4tukt', 'https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded_episode400/798221/798221-1565531007591-fc871923c6237.jpg', '00:20:00', 'Sam Harris' ),
('Makhai Beats', 'Love Chances.mp3','Mellow Beats to enjoy','https://anchor.fm/s/55a9394/podcast/rss','https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded_episode400/798221/798221-1568189143375-992215fe34b24.jpg','00:02:26','Makhai Beats'),
('Inspiring Corporate Music', 'Scott_Holmes_-_10_-_Inspiring_Corporate.mp3','Inspiring Corporate Music','https://anchor.fm/s/55a9394/podcast/rss','https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded_episode400/798221/798221-1568189143375-992215fe34b24.jpg','00:02:29','Scott Holmes'),
('Happy Ending', 'Scott_Holmes_-_11_-_Happy_Ending.mp3','Inspiring Corporate Music','https://anchor.fm/s/55a9394/podcast/rss','https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded_episode400/798221/798221-1568189143375-992215fe34b24.jpg','00:02:33','Scott Holmes'),
('Wander', 'Ikson - Wander.mp3','Chill out tunes','https://anchor.fm/s/55a9394/podcast/rss','https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded_episode400/798221/798221-1568189143375-992215fe34b24.jpg','00:02:10','Ikson'),
('Beach', 'Joakim Karud - Beach.mp3','Chill out tunes','https://anchor.fm/s/55a9394/podcast/rss','https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded_episode400/798221/798221-1568189143375-992215fe34b24.jpg','00:02:11','Joakim Karud'),
('Having ideas and dealing with money', '6-Nick-Having_Ideas_&_money.mp3','Nicholas Charles Tyrwhitt Wheeler on how to have ideas and the problems you get when they work out','https://anchor.fm/s/55a9394/podcast/rss','https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded_episode400/798221/798221-1568189143375-992215fe34b24.jpg','00:04:50','Sam Harris'),
('Mait Muntel - Earliest Memory', '14-Mait_Early Memory.mp3','A three year decides to walk home across a city in the middle of Estonian winter','https://anchor.fm/s/55a9394/podcast/rss','https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded_episode400/798221/798221-1568189143375-992215fe34b24.jpg','00:01:45','Sam Harris');

INSERT INTO match_content (user_id, content_id, current_time_in_track, time_started_utc, currently_listening, target_time, rating) VALUES
(1, 1, '00:00:48', '1568478582890', FALSE, 80, 3),
(1, 2, '00:03:00', '1568478582890', TRUE, 600, 3),
(1, 3, '00:00:00', '1568478582890', FALSE, 200, 3),
(2, 4, '00:01:00', '1568478582890', FALSE, 85, 3),
(2, 5, '00:00:21', '1568478768026', TRUE, 100, 5),
(3, 6, '00:00:20', '1568478582890', FALSE, 150, 3),
(3, 7, '00:00:01', '1568478582890', FALSE, 80, 3),
(3, 8, '00:01:01', '1568478582890', TRUE, 120, 3),
(4, 9, '00:00:11', '1568478582890', FALSE, 50, 3);

COMMIT;
