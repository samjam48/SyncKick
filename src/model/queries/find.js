const connection = require("../database/db_connection");

const allUsers = () => connection.query("SELECT * FROM users;");

const allContent = () => connection.query("SELECT * FROM content;");

const specificUser = id =>
  connection.query("SELECT * FROM users WHERE id = $1;", [id]);

const userContent = userId =>
  connection.query(
    `SELECT * FROM match_content match
    JOIN content c ON c.id = match.content_id
    WHERE user_id = ${userId};`
  );

module.exports = {
  allUsers,
  allContent,
  specificUser,
  userContent
};
