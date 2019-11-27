const functions = require("firebase-functions");
var express = require("express");
var cors = require("cors");
var app = express();

app.use(cors());

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions

app.get('/courseEpisodes',  (req, res, next) => {
   var episodes = [
    {
      title: "Setup, Build and Deploy",
      duration: 14.07,
      imageUrl:
        "https://www.filledstacks.com/assets/static/32.81b85c1.ebb7a1a.jpg"
    },
    {
      title: "Adding a Responsive UI",
      duration: 18.54,
      imageUrl:
        "https://www.filledstacks.com/assets/static/033.81b85c1.ebdf16d.jpg"
    },
    {
      title: "Layout Templates",
      duration: 14.55,
      imageUrl:
        "https://www.filledstacks.com/assets/static/034.81b85c1.52d0785.jpg"
    },
    {
      title: "State Management and Api integration",
      duration: 14.55,
      imageUrl:
        "https://www.filledstacks.com/assets/static/034.81b85c1.52d0785.jpg"
    }
  ];
  
  res.json(episodes);
});

// Expose Express API as a single Cloud Function:
exports.thebasics = functions.https.onRequest(app);