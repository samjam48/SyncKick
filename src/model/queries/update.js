const connection = require("../database/db_connection");

const currentTime = (matchContentId, currentTime) =>
  connection.query(
    `UPDATE match_content
    SET current_time_in_track = ${currentTime}
    WHERE id = ${matchContentId};`
  );

const rating = (matchContentId, rating) =>
  connection.query(
    `UPDATE match_content
    SET rating = ${rating}
    WHERE id = ${matchContentId};`
  );

const setPlayingFalse = matchContentId =>
  connection.query(
    `UPDATE match_content
    SET currently_listening = FALSE
    WHERE id = ${matchContentId};`
  );

const setPlayingTrue = matchContentId =>
  connection.query(
    `UPDATE match_content
    SET currently_listening = TRUE
    WHERE id = ${matchContentId};`
  );

const targetTime = (matchContentId, targetTime) =>
  connection.query(
    `UPDATE match_content
    SET target_time = ${targetTime}
    WHERE id = ${matchContentId};`
  );

module.exports = {
  currentTime,
  rating,
  setPlayingFalse,
  setPlayingTrue,
  targetTime
};
