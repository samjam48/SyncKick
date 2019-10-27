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

const followingListContent = followingList => {
  const promises = followingList.map(userId => {
    return userContent(userId);
  });
  return Promise.all(promises);
};

const userAndContent = userId => {
  const user = specificUser(userId);
  const content = userContent(userId);

  return Promise.all([user, content]);
};

module.exports = {
  allUsers,
  allContent,
  followingListContent,
  specificUser,
  userContent,
  userAndContent
};
