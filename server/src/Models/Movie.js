var mongoose = require("mongoose");
var Schema = mongoose.Schema;

var movieSchema = new Schema({
  title: {
    type: String,
    unique: true,
    require: true,
  },

  amh_title: {
    type: String,
  },

  rating: {
    type: Number,
    min: [0, "Rating can not be lower than 0"],
    max: [10, "10 is the maximum rating"],
  },

  imageUrl: {
    type: String,
    required: true,
  },

  description: {
    type: String,
    requited: true,
  },

  actors: {
    type: [String],

    validate: {
      validator: (actors) => {
        return actors.length >= 1;
      },

      message: (props) => `${props.value} The movie needs atleast 1 actor`,
    },
  },

  category: {
    type: [String],
    requited: true,
    validator: {
      validate: (catagery) => {
        return catagery.length >= 3;
      },

      message: (props) =>
        `${props.value} The movie need to fit in  atleast 3 catagery`,
    },
  },

  amh_category: {
    type: [String],
    requited: true,
    validator: {
      validate: (catagery) => {
        return catagery.length >= 3;
      },

      message: (props) =>
        `${props.value} The movie need to fit in  atleast 3 catagery`,
    },
  },

  price: {
    type: Number,
    min: 0,
    max: 25,
  },

  realeaseDate: {
    type: Date,
    default: Date.now,
  },
});

movieSchema.statics.getMovies = async function () {
  const count = await Movie.countDocuments().exec();

  if (count === 0) {
    const g = await Movie.insertDefaultMovies();
    return g;
  }

  const movies = Movie.find({});

  return movies;
};

movieSchema.statics.insertDefaultMovies = async function () {
  try {
    const dummyData = [
      {
        title: "Difret - Based On True Story ",
        amh_title: "ዲፍረትaw - ኣውነት ታሪክ",
        rating: 8.6,
        description:
          "Nam nunc nam accumsan hendrerit nec. Et accumsan massa mollis et nostra nam sed eget odio. Vestibulum molestie tempus nostra litora ut parturient sollicitudin. Cubilia, leo sed facilisi curae;! Aliquam natoque hac proin inceptos feugiat      dis torquent sociis libero! Mollis taciti tempus mauris. Molestie non orci nibh posuere cubilia doloid. Semper ipsum volutpat posuere aliquet habitasse dictum! Dis lobortis habitant interdum taciti facilisi metus neque nisl nascetur.",
        category: ["Romance , Thriller", "Non-Fiction"],
        amh_category: ["ፊኪር", "ኣስደንካህ", "አውነት ታሪክ"],
        actors: ["Meron G", "Tizita H", "Moges Y"],
        price: 14.99,
        imageUrl: "fff",
      },

      {
        title: "The Red Sea Diving Resort",
        amh_title: "ከይ ባሀር ያለው ረሶርት ",
        rating: 8.6,
        description:
          "Nam nunc nam accumsan hendrerit nec. Et accumsan massa mollis et nostra nam sed eget odio. Vestibulum molestie tempus nostra litora ut parturient sollicitudin. Cubilia, leo sed facilisi curae;! Aliquam natoque hac proin inceptos feugiat      dis torquent sociis libero! Mollis taciti tempus mauris. Molestie non orci nibh posuere cubilia doloid. Semper ipsum volutpat posuere aliquet habitasse dictum! Dis lobortis habitant interdum taciti facilisi metus neque nisl nascetur.",
        category: ["Action , Thriller", "Fiction"],
        amh_category: ["ፊኪር", "ኣስደንካህ", "አውነት ታሪክ"],
        actors: ["Chris E", "Haley B", "Micheael K"],
        price: 14.99,
        imageUrl: "fff",
      },

      {
        title: "Beza A Birhane Nigussie Film",
        amh_title: "ከይ ባሀር ያለው ረሶርት ",
        rating: 8.6,
        description:
          "Nam nunc nam accumsan hendrerit nec. Et accumsan massa mollis et nostra nam sed eget odio. Vestibulum molestie tempus nostra litora ut parturient sollicitudin. Cubilia, leo sed facilisi curae;! Aliquam natoque hac proin inceptos feugiat      dis torquent sociis libero! Mollis taciti tempus mauris. Molestie non orci nibh posuere cubilia doloid. Semper ipsum volutpat posuere aliquet habitasse dictum! Dis lobortis habitant interdum taciti facilisi metus neque nisl nascetur.",
        category: ["Action , Thriller", "Non-Fiction"],
        amh_category: ["ፊኪር", "ኣስደንካህ", "አውነት ታሪክ"],
        actors: ["Dingani B", "Getnet K", "Moges K"],
        price: 20.99,
        imageUrl: "fff",
      },
    ];

    let holderArr = [];
    for (let object of dummyData) {
      const movie = new Movie(object);

      const newMovie = await movie.save();
      holderArr.push(newMovie);
    }

    return holderArr;
  } catch (err) {
    console.log(err);
  }
};

var Movie = mongoose.model("Movie", movieSchema);
module.exports = Movie;
