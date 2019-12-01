const { find, insert } = require("../model/queries");

exports.get = (req, res) => {
  find.userAndContent(req.params.user_id).then(userAndContent => {
    find
      .followingListContent(userAndContent[0][0].following_list)
      .then(followingContent => {
        res.render("userTracks", {
          followingContent,
          user: userAndContent[0][0],
          content: userAndContent[1]
        });
      });
  });
};
