const { find } = require("../model/queries");

exports.get = (req, res) => {
  const p1 = find.specificUser(req.params.id).then(([userDetails]) => {
    return userDetails.following_list;
  });
  const p2 = find.userContent(req.params.id);

  Promise.all([p1, p2]).then(([followingList, userContent]) => {
    find.followingListContent(followingList).then(followingContent => {
      console.log("following content = ", followingContent[0]);

      res.render("userTracks", {
        followingContent,
        userContent
      });
    });
  });
};

//   return find.userContent(userDetails.following_list[0]);
// });

// return Promise.all(userDetails.following_list.map(userId => {
//   return find.userContent(userId);
// });
