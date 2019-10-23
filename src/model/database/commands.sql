SELECT * FROM match_content match
JOIN content c ON c.id = match.content_id
WHERE user_id = 1;

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