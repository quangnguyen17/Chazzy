const express = require("express");
const app = express();

app.use(express.json(), express.urlencoded({ extended: true }));

require("./config/mongoose.config");
require("./routes/routes")(app);

const PORT = 8000;
const server = app.listen(PORT, () =>
  console.log(`Server is up and listening on port ${PORT}`)
);

const io = require("socket.io")(server);
io.on("connection", (socket) => {
  console.log("Socket connected: ", socket);
});
