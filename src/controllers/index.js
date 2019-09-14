const express = require("express");
const router = express.Router();

const home = require("./home");
// const allResults = require("./allResults");
// const cravingResults = require("./cravingResults");
// const product = require("./product");
const error = require("./error");

router.get("/", home.get);
// router.get("/results", allResults.get);
// router.get("/results/:craving", cravingResults.get);
// router.get("/product/:id", product.get);

router.use(error.client);
router.use(error.server);

module.exports = router;
