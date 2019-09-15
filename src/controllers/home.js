const { find } = require("../model/queries");

exports.get = (req, res) => {
  find
    .allUsers()
    .then(users => {
      return users.map(user => {
        user.follower_details = user.following_list.map(followerId => {
          return users.reduce((acc, user) => {
            if (user.id === followerId) {
              acc.follower_name = user.user_name;
              acc.follower_image = user.user_image;
            }
            return acc;
          }, {});
        });
        return user;
      });
    })
    .then(usersWithFollowers => {
      res.render("home", { usersWithFollowers });
    });
};
