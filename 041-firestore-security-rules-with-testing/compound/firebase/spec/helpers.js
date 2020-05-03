const firebase = require("@firebase/testing");
const fs = require("fs");

module.exports.setup = async (auth, data) => {
  const projectId = `rules-spec-${Date.now()}`;

  const app = firebase.initializeTestApp({
    projectId,
    auth
  });

  const db = app.firestore();

  // Apply the test rules so we can write documents
  await firebase.loadFirestoreRules({
    projectId,
    rules: fs.readFileSync("firestore-test.rules", "utf8")
  });

  // write mock documents if any
  if (data) {
    for (const key in data) {
      const ref = db.doc(key); // This means the key should point directly to a document
      await ref.set(data[key]);
    }
  }

  // Apply the actual rules for the project
  await firebase.loadFirestoreRules({
    projectId,
    rules: fs.readFileSync("firestore.rules", "utf8")
  });

  return db;
};

module.exports.teardown = async () => {
  // Delete all apps currently running in the firebase simulated environment
  Promise.all(firebase.apps().map(app => app.delete()));
};

// Add extensions onto the expect method
expect.extend({
  async toAllow(testPromise) {
    let pass = false;
    try {
      await firebase.assertSucceeds(testPromise);
      pass = true;
    } catch (error) {
      // log error to see which rules caused the test to fail
      console.log(error);
    }

    return {
      pass,
      message: () =>
        "Expected Firebase operation to be allowed, but it was denied"
    };
  }
});

expect.extend({
  async toDeny(testPromise) {
    let pass = false;
    try {
      await firebase.assertFails(testPromise);
      pass = true;
    } catch (error) {
      // log error to see which rules caused the test to fail
      console.log(error);
    }

    return {
      pass,
      message: () =>
        "Expected Firebase operation to be denied, but it was allowed"
    };
  }
});
