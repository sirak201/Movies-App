var express = require("express");
var router = express.Router();
var Movie = require("../Models/Movie");

// define the home page route
router.get("/", async (req, res) => {
  try {
    const addedMovies = await Movie.getMovies();
    res.send(addedMovies);
    return;
  } catch (error) {
    res.json(error);
    return;
  }
});

router.post("/createMovie", async (req, res) => {
  try {
    const newMovie = new Movie(req.body);
    const addedMovie = await newMovie.save();
    res.send(addedMovie);
  } catch (error) {
    res.status(422).send(error.message);
  }
});

module.exports = router;
