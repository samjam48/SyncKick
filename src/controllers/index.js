const express = require("express");
const router = express.Router();

const users = require("./users");
const userPage = require("./userPage");
const listenLive = require("./listenLive");
const listenCatchup = require("./listenCatchup");
const error = require("./error");

router.get("/", (req, res) => res.render("home"));
router.get("/users", users.get);
router.get("/user/:user_id", userPage.get);
// router.get("/listen/:id/solo", userPage.get);
router.get("/listen/:track_id/live", listenLive.get);
router.get("/listen/:track_id/catchup", listenCatchup.get);

router.use(error.client);
router.use(error.server);

module.exports = router;
