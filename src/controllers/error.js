exports.client = (req, res) => {
  res.status(404);
  res.render("error", {
    statusCode: 404,
    layout: "error",
    message: "Page not found"
  });
};

exports.server = (err, req, res, next) => {
  res.status(500);
  res.render("error", {
    statusCode: 500,
    layout: "error",
    message: "Internal Server Error"
  });
};
