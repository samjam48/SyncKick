module.exports = usersWithFollowers => {
  window.sessionStorage.setItem(
    "usersWithFollowers",
    JSON.stringify(usersWithFollowers)
  );
};
