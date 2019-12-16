const tape = require("tape");
const _test = require("tape-promise").default;

const test = _test(tape);
const { build, connection } = require("../model/database/db_build");
const { find, insert, update } = require("../model/queries/");

test("tape test for db files is working", t => {
  t.equal(1, 1, "1 equals 1");
  t.end();
});

const data = {
  userName: "Sam",
  title: "Problems and Solutions",
  currentlyListening: false,
  currentTimeInTrack: "00:00:48",
  newTrack: {
    user_id: 1,
    content_id: 1,
    current_time_in_track: "00:00:00",
    time_started_utc: "1568478582899",
    currently_listening: false,
    target_time: 300,
    rating: null
  },
  newTrackCopy: {
    user_id: 1,
    content_id: 1,
    current_time_in_track: "00:00:00",
    time_started_utc: "1568478582899",
    currently_listening: false,
    target_time: 300,
    rating: null
  }
};

// ---------- Find Queries --------- //

connection
  .query(build)
  .then(() => {
    test("Find all users", t => {
      return find.allUsers().then(result => {
        t.deepEqual(
          result[0].user_name,
          data.userName,
          "allUsers() returns the correct info from DB"
        );
        t.end();
      });
    });

    test("Find all content", t => {
      return find.allContent().then(result => {
        t.deepEqual(
          result[0].title,
          data.title,
          "allContent() returns the correct info from DB"
        );
        t.end();
      });
    });

    test("Find specific user", t => {
      return find.specificUser(1).then(result => {
        t.deepEqual(
          result[0].user_name,
          data.userName,
          "specificUser() returns the correct info from DB"
        );
        t.end();
      });
    });

    test("Find user content", t => {
      return find.userContent(1).then(result => {
        t.deepEqual(
          result[0].currently_listening,
          data.currentlyListening,
          "userContent() returns the correct listening status"
        );
        t.deepEqual(
          result[0].title,
          data.title,
          "userContent() returns the correct title"
        );
        t.end();
      });
    });

    test("Find the track and users listening details", t => {
      return find.userTrack(1).then(result => {
        t.deepEqual(
          result[0].title,
          data.title,
          "userTrack() returns correct track title"
        );
        t.deepEqual(
          result[0].current_time_in_track,
          data.currentTimeInTrack,
          "userTrack() returns correct time location in track"
        );
        t.end();
      });
    });

    test("Find all content of a user", t => {
      return find.userAndContent(1).then(result => {
        t.deepEqual(
          result[0][0].user_name,
          data.userName,
          "userAndContent() returns correct user as first element"
        );
        t.deepEqual(
          result[1][0].title,
          data.title,
          "userAndContent() returns correct track title"
        );
        t.deepEqual(
          result[1][0].current_time_in_track,
          data.currentTimeInTrack,
          "userAndContent() returns correct time location in track"
        );
        t.end();
      });
    });

    test("Find all content of followers", t => {
      return find.followingListContent([1, 2]).then(result => {
        t.deepEqual(
          result[0][0][0].user_name,
          data.userName,
          "followingListContent() returns correct user as first element"
        );
        t.deepEqual(
          result[0][1][0].title,
          data.title,
          "followingListContent() returns correct track title"
        );
        t.deepEqual(
          result[0][1][0].current_time_in_track,
          data.currentTimeInTrack,
          "followingListContent() returns correct time location in track"
        );
        t.deepEqual(
          result.length,
          2,
          "followingListContent() returns correct amount of users and their content"
        );
        t.end();
      });
    });
  })
  .catch(e => console.error("error", e));

// ---------- Insert Queries --------- //

connection.query(build).then(() => {
  test("Add track to Users content", t => {
    return insert.addTrackToUser(data.newTrack).then(result => {
      t.deepEqual(
        result[0].id,
        10,
        "addTrackToUser() adds a new track and returns id"
      );
      t.deepEqual(
        data.newTrack,
        data.newTrackCopy,
        "addTrackToUser() is a pure function"
      );
      return find.userTrack(result[0].id).then(result => {
        t.deepEqual(
          result[0].title,
          data.title,
          "addTrackToUser() creates new track with correct title"
        );
        t.end();
      });
    });
  });
});

// ---------- Update Queries --------- //

connection.query(build).then(() => {
  // // test won't work with double quotes
  // test("Update current time", t => {
  //   return update.currentTime(9, "00:01:00").then(() => {
  //     return find.userTrack(9).then(result => {
  //       t.deepEqual(
  //         result[0].current_time_in_track,
  //         "00:01:00",
  //         "update currentTime() changes correct tracks time"
  //       );
  //       t.end();
  //     });
  //   });
  // });

  test("Update playing status to false", t => {
    return update.setPlayingFalse(2).then(() => {
      return find.userTrack(2).then(result => {
        t.deepEqual(
          result[0].currently_listening,
          false,
          "setPlayingFalse() changes correct track to false"
        );
        t.end();
      });
    });
  });

  test("Update playing status to true", t => {
    return update.setPlayingTrue(1).then(() => {
      return find.userTrack(1).then(result => {
        t.deepEqual(
          result[0].currently_listening,
          true,
          "setPlayingTrue() changes correct track to false"
        );
        t.end();
      });
    });
  });

  test("Update target time", t => {
    return update.targetTime(1, 500).then(() => {
      return find.userTrack(1).then(result => {
        t.deepEqual(
          result[0].target_time,
          500,
          "targetTime() changes correct tracks target time"
        );
        t.end();
      });
    });
  });
});
