const functions = require("firebase-functions");

var admin = require("firebase-admin");
var serviceAccount = require("./compound-53007-firebase-adminsdk-v3wqo-36e95e9b2e.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

var database = admin.firestore();

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
exports.helloWorld = functions.https.onRequest((request, response) => {
  const postsRef = database.collection("posts");
  
  for (let index = 0; index < 100; index++) {
    var postListRef = postsRef.doc(`post-${index}`);
    postListRef.set({
      title: `Post User ${index}`,
      imageUrl: "https://picsum.photos/300/300",
      userId: "my-id"
    });
  }

  response.send("Hello from Firebase!");
});
