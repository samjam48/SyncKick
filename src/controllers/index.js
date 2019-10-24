const express = require("express");
const router = express.Router();

const users = require("./users");
const userPage = require("./userPage");
const error = require("./error");

router.get("/", (req, res) => res.render("home"));
router.get("/users", users.get);
router.get("/user/:id", userPage.get);

router.use(error.client);
router.use(error.server);

module.exports = router;
