const { getCravings } = require("../model/queries");

exports.get = (req, res) => {
  res.render("home");
};
