const { find } = require("../model/queries");

exports.get = (req, res) => {
  const p1 = find.specificUser(req.params.id).then(([userDetails]) => {
    return userDetails.following_list;
  });
  const p2 = find.userAndContent(req.params.id);

  Promise.all([p1, p2]).then(([followingList, userAndContent]) => {
    find.followingListContent(followingList).then(followingContent => {
      console.log("userAndContent = ", userAndContent);

      res.render("userTracks", {
        followingContent,
        user: userAndContent[0][0],
        content: userAndContent[1]
      });
    });
  });
};
