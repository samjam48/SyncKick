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
      // usersWithFollowers.map(user =>
      //   // console.log("follower object:", obj)
      //   user.follower_details.map(obj => console.log("follower object:", obj))
      // );
      // console.log("updated user with followers", usersWithFollowers);

      res.render("home", { usersWithFollowers });
    });
};
