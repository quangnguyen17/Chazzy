module.exports = {
  getAll(req, res) {
    res.json({ users: [], msg: "All Users" });
  },
};
