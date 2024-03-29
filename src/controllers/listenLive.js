// stream the track exactly how a different user is listening to it.
// e.g. play, stop and pause as the other user does

const { find, insert, update } = require("../model/queries");

exports.get = (req, res) => {
  find.userTrack(req.params.track_id).then(([track]) => {
    find.specificUser(track.user_id).then(([user]) => {
      res.render("listenLive", {
        track,
        user
      });
    });
  });
};

// TO DO - save this track details to current user as well in match content
