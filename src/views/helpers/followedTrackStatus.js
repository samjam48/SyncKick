const { find } = require("../model/queries");

module.exports = followingIds => {
  followingIds.map(userId => {
    find.userContent(userId).then(userContent => {});
  });
};
