

const express = require("express");
const app = express();
const PORT = 1337;

app.use(express.static(__dirname));

app.get("/", (req, res) => {
  res.sendFile(__dirname + "/index.html");
});

app.listen(PORT, () => {
  console.log(`Listen : ${PORT}`);
});