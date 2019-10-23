const { find } = require("../model/queries");

exports.get = (req, res) => {
  find.userContent(req.params.id).then(userContent => {
    res.render("userTracks", { userContent });
  });
};
