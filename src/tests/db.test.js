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
  currentlyListening: false
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
  })
  .catch(e => console.error("error", e));
