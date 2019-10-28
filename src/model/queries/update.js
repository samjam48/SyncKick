const connection = require("../database/db_connection");

const startPlaying = matchContentId =>
  connection.query(
    `UPDATE match_content match
    SET currently_listening = TRUE,
    WHERE id = ${matchContentId};`
  );

const stopPlaying = matchContentId =>
  connection.query(
    `UPDATE match_content match
    SET currently_listening = FALSE,
    WHERE id = ${matchContentId};`
  );

module.exports = {
  startPlaying,
  stopPlaying
};
