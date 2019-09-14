const request = require("supertest");
const tape = require("tape");
const _test = require("tape-promise").default;

const test = _test(tape);
const app = require("../app");

test("Home route should return HTML content and 200 status", t => {
  request(app)
    .get("/")
    .end((err, res) => {
      t.equal(
        res.headers["content-type"],
        "text/html; charset=utf-8",
        "Content type is html"
      );
      t.equal(res.status, 200, "Status code is 200");
      t.error(err, "There is no error");
      t.end();
    });
});

test("Error loads up correctly for 404", t => {
  request(app)
    .get("/foobar")
    .end((err, res) => {
      t.equal(res.status, 404, "Status code is 404");
      t.error(err, "There is no error");
      t.end();
    });
});

// test("Results Page gives correct content type and 200 status", t => {
//   request(app)
//     .get("/results")
//     .end((err, res) => {
//       t.equal(
//         res.headers["content-type"],
//         "text/html; charset=utf-8",
//         "Content type is HTML"
//       );
//       t.equal(res.status, 200, "Status code is 200");
//       t.error(err, "There is no error");
//       t.end();
//     });
// });

// test("Product Page gives correct content type for item 1 and status 200", t => {
//   request(app)
//     .get("/product/1")
//     .end((err, res) => {
//       t.equal(
//         res.headers["content-type"],
//         "text/html; charset=utf-8",
//         "Content type is HTML"
//       );
//       t.equal(res.status, 200, "Status code is 200");
//       t.error(err, "There is no error");
//       t.end();
//     });
// });
