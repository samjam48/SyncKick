const { find } = require("../model/queries");

exports.get = (req, res) => {
  find.userContent(1).then(userContent => {
    res.render("home", { userContent });
  });
};
