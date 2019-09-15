module.exports = (followerId, users) =>
  users.reduce((acc, user) => (user.id === followerId ? user : acc), {});

// this is currently demo code. No helpers being used yet
