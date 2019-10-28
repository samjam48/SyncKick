const { update } = require("../model/queries");

module.exports = matchContentId => {
  update.stopPlaying(matchContentId);
};
