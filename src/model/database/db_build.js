const { QueryFile } = require("pg-promise");
const path = require("path");
const connection = require("./db_connection");

const sql = file => {
  return new QueryFile(path.join(__dirname, file), {
    minify: true
  });
};

const build = sql("./db_build.sql");

connection
  .query(build)
  .then(() => console.log("Database connected and built"))
  .catch(e => console.error("error", e));

module.exports = {
  build,
  connection
};
