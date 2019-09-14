const connection = require("../database/db_connection");

module.exports = () => connection.query("SELECT * FROM users;");
