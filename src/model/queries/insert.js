const connection = require("../database/db_connection");

const addTrackToUser = input => {
  const {
    user_id,
    content_id,
    current_time_in_track,
    time_started_utc,
    currently_listening,
    target_time,
    rating
  } = input;

  return connection.query(
    `INSERT INTO match_content(
      user_id,
      content_id,
      current_time_in_track,
      time_started_utc,
      currently_listening,
      target_time,
      rating
    )
    VALUES ($1, $2, $3, $4, $5, $6, $7)
    RETURNING id;`,
    [
      user_id,
      content_id,
      current_time_in_track,
      time_started_utc,
      currently_listening,
      target_time,
      rating
    ]
  );
};

module.exports = {
  addTrackToUser
};
