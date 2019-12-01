const connection = require("../database/db_connection");

const allUsers = () => connection.query("SELECT * FROM users;");

const allContent = () => connection.query("SELECT * FROM content;");

const specificUser = userId =>
  connection.query("SELECT * FROM users WHERE id = $1;", [userId]);

const userContent = userId =>
  connection.query(
    `SELECT * FROM content c
    JOIN match_content match ON c.id = match.content_id
    WHERE match.user_id = $1;`,
    [userId]
  );

const userTrack = userTrackId =>
  connection.query(
    `SELECT * FROM content c
    JOIN match_content match on c.id = match.content_id
    WHERE match.id = $1;`,
    [userTrackId]
  );

const userAndContent = userId => {
  const user = specificUser(userId);
  const content = userContent(userId);

  return Promise.all([user, content]);
};

const followingListContent = followingList => {
  const promises = followingList.map(userId => {
    return userAndContent(userId);
  });
  return Promise.all(promises);
};

module.exports = {
  allUsers,
  allContent,
  followingListContent,
  specificUser,
  userTrack,
  userContent,
  userAndContent
};
