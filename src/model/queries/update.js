const connection = require("../database/db_connection");

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
  setPlayingFalse,
  setPlayingTrue,
  targetTime
};
