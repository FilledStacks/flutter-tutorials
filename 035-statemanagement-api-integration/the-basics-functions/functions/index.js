const functions = require("firebase-functions");
var express = require("express");
var cors = require("cors");
var app = express();

app.use(cors());

const episodes = [
  {
    title: "Setup, Build and Deploy",
    duration: 14.07,
    imageUrl:
      "https://www.filledstacks.com/assets/static/32.81b85c1.ebb7a1aaddfef10313d7bab97243d449.jpg"
  },
  {
    title: "Adding a Responsive UI",
    duration: 18.54,
    imageUrl:
      "https://www.filledstacks.com/assets/static/033.81b85c1.ebdf16d08a54fd37bc4cd5d1a0b0767f.jpg"
  },
  {
    title: "Layout Templates",
    duration: 14.55,
    imageUrl:
      "https://www.filledstacks.com/assets/static/034.81b85c1.52d07852af687a77985f54c5eedecb82.jpg"
  },
  {
    title: "State Management and Api integration",
    duration: 14.55,
    imageUrl:
      "https://www.filledstacks.com/assets/static/35.81b85c1.f9ab74c22bb56931e36a13783c29361f.jpg"
  }
];

app.get("/courseEpisodes", (req, res, next) => {
  res.json(episodes);
});

app.get("/episode", (req, res, next) => {
  res.json(episodes[req.query.id]);
});

// Expose Express API as a single Cloud Function:
exports.thebasics = functions.https.onRequest(app);
