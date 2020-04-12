const UserController = require("../controllers/UserController");
const MessageController = require("../controllers/MessageController");

module.exports = (app) => {
  // GET
  app.get("/", (req, res) => res.redirect("/api"));
  app.get("/api", (req, res) => res.json({ msg: "Welcome to Chazzy!" }));
  app.get("/api/users", UserController.getAll);
  app.get("/api/messages", MessageController.getAll);

  // POST
  // PUT
  // DELETE
};
