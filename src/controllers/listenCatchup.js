// stream the track from current point to where the other user has reached.

const { find, insert, update } = require("../model/queries");

exports.get = (req, res) => {
  find.userTrack(req.params.track_id).then(([track]) => {
    find.specificUser(track.user_id).then(([user]) => {
      res.render("listenCatchup", {
        track,
        user
      });
    });
  });
};

// TO DO - save this track details to current user as well in match content
