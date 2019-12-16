const { update } = require("../../model/queries");

module.exports = (matchContentId, currentTime) => {
  update.currentTime(matchContentId, currentTime);
};
