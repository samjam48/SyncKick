// stream the track exactly how a different user is listening to it.
// e.g. play, stop and pause as the other user does
// save this track details to current user as well in match content

const { find, insert, update } = require("../model/queries");

exports.get = (req, res) => {
  find.userTrack(req.params.track_id).then(([track]) => {
    find.specificUser(track.user_id).then(([user]) => {
      res.render("listenLive", {
        track,
        user
      });
    });

    // find
    //   .followingListContent(userAndContent[0][0].following_list)
    //   .then(followingContent => {
    //     res.render("userTracks", {
    //       followingContent,
    //       user: userAndContent[0][0],
    //       content: userAndContent[1]
    //     });
    //   });
  });
};
