module.exports = time => {
  t = time.split(":");
  seconds = Number(t[2]) + Number(t[1]) * 60 + Number(t[0]) * 3600;
  return seconds;
};
