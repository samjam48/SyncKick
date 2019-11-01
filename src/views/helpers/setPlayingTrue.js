const { update } = require("../../model/queries");

module.exports = matchContentId => {
  update.setPlayingTrue(matchContentId);
};
