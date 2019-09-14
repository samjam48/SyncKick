const { getUsers } = require("../model/queries");

exports.get = (req, res) => {
  getUsers().then(users => res.render("home", { users }));
};
