module.exports = (followerId, users) =>
  users.reduce((acc, user) => (user.id === followerId ? user : acc), {});

// const showFollowers = (listOfFollowerIds, users) => {
//   listOfFollowerIds.map(followerId => {});
// };
