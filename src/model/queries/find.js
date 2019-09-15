const connection = require("../database/db_connection");

const allUsers = () => connection.query("SELECT * FROM users;");

const specificUser = id =>
  connection.query("SELECT * FROM users WHERE id = $1;", [id]);

module.exports = {
  allUsers,
  specificUser
};
