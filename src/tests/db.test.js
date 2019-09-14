const tape = require("tape");
const _test = require("tape-promise").default;

const test = _test(tape);
const { build, connection } = require("../model/database/db_build");

test("tape test for db files is working", t => {
  t.equal(1, 1, "1 equals 1");
  t.end();
});
