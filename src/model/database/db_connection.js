// const env = require("env2")("./.env");
require("dotenv").config();

const pgp = require("pg-promise")();
const url = require("url");

let DB_URL = process.env.PLANTBASE_DB_URL;

if (process.env.NODE_ENV === "test") {
  DB_URL = process.env.TEST_DB_URL;
} else if (process.env.NODE_ENV === "local") {
  DB_URL = process.env.LOCAL_DB_URL;
} else if (process.env.NODE_ENV === "production") {
  DB_URL = process.env.PLANTBASE_DB_URL;
}

if (!process.env) {
  throw new Error("Environment variable must be set");
}

if (!DB_URL) {
  throw new Error(
    "Database URL must be set to connect. Current Node environment = ",
    process.env.NODE_ENV
  );
}

const params = url.parse(DB_URL);

const [username, password] = params.auth.split(":");

const options = {
  host: params.hostname,
  port: params.port,
  database: params.pathname.split("/")[1],
  max: process.env.DB_MAX_CONNECTION || 2,
  user: username,
  password,
  ssl: params.hostname !== "localhost"
};

module.exports = pgp(options);
