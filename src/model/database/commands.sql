SELECT * FROM match_content match
JOIN content c ON c.id = match.content_id
WHERE user_id = 1;


UPDATE match_content match
SET currently_listening = FALSE
WHERE id = 1;


UPDATE match_content match
SET target_time = 500
WHERE id = 1;

INSERT INTO match_content(user_id, content_id, current_time_in_track, time_started_utc, currently_listening, target_time, rating)
VALUES (1, 1, '00:00:48', '1568478582890', FALSE, 50, 3)
RETURNING id;

-----

SELECT
  location,
  AVG(total_likes)::integer

FROM (
  SELECT
    location,
    COUNT(l.*) "total_likes"

  FROM mentors auth
  JOIN posts p ON p.mentor_name = auth.name
  JOIN likes l ON l.post_id = p.id

  GROUP BY
    p.id,
    auth.location
) AS Q1

GROUP BY location;