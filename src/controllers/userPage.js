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

// const track = {
//   user_id: 1,
//   content_id: 1,
//   current_time_in_track: "00:00:00",
//   time_started_utc: "1568478582890",
//   currently_listening: false,
//   target_time: 600,
//   rating: 4
// };

// insert
//   .addTrackToUser(track)
//   .then(id => console.log("inserted row id ========= ", id));
