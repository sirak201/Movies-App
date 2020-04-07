const express = require("express");
const app = express();
const mongoose = require("mongoose");
const moviesRouter = require("./api/movies");
var bodyParser = require("body-parser");

app.use(bodyParser.urlencoded({ extended: false }));

app.use(bodyParser.json());

var mongoDB = "mongodb://localhost/mydatabase";
mongoose.connect(mongoDB, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

var db = mongoose.connection;

db.on("error", (err) => {
  console.log("Error took place", err);
});

db.once("open", () => {
  console.log("We have connected sucessfully");
});

app.use("/movies", moviesRouter);

app.listen(3000);
