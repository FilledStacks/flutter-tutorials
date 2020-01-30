const { setup, teardown } = require("./helpers");

describe("Safety rules", () => {
  afterEach(async () => {
    await teardown();
  });

  test("read should fail to a collection", async () => {
    const db = await setup();

    const postsRef = db.collection("posts");

    await expect(postsRef.get()).toDeny();
  });

  test("write to random collection should fail even when logged in", async () => {
    const db = await setup({
      uid: "danefilled1",
      email: "dane@filledstacks.com",
      token: {
        email_verified: true
      }
    });

    const postsRef = db.collection("posts");
    await expect(postsRef.get()).toDeny();
  });
});

describe("Posts rules", () => {
  afterEach(async () => {
    await teardown();
  });

  test("Allow update and delete when user owns post", async () => {
    const mockData = {
      // Create mock document wuth a userId danefilled1
      ["posts/id1"]: {
        userId: "danefilled1"
      },
      // create mock document with a userId not_filledstacks
      ["posts/id2"]: {
        userId: "not_filledstacks"
      }
    };

    // setup the firestore app with an auth.uid set to danefilled1
    const db = await setup(
      {
        uid: "danefilled1"
      },
      mockData
    );

    const postsRef = db.collection("posts");
    // get the docid1
    await expect(
      postsRef.doc("id1").update({ updated: "new_value" })
    ).toAllow();

    await expect(postsRef.doc("id2").update({ updated: "new_value" })).toDeny();
  });

  test("Allow adding a post when logged in", async () => {
    const db = await setup({
      uid: "danefilled1"
    });

    const postsRef = db.collection("posts");
    await expect(postsRef.add({ title: "new post" })).toAllow();
  });

  test("Deny adding a post when not logged in", async () => {
    const db = await setup();
    const postsRef = db.collection("posts");
    await expect(postsRef.add({ title: "new post" })).toDeny();
  });

  test("Allow delete when user is admin", async () => {
    const mockData = {
      // Create mock document wuth a userId danefilled1
      ["users/danefilled1"]: {
        userRole: "Admin"
      },
      ["posts/id1"]: {
        userId: "danefilled1"
      },
      // create mock document with a userId not_filledstacks
      ["posts/id2"]: {
        userId: "not_filledstacks"
      }
    };

    // setup the firestore app with an auth.uid set to danefilled1
    const db = await setup(
      {
        uid: "danefilled1"
      },
      mockData
    );

    const postsRef = db.collection("posts");
    // get the docid1
    await expect(postsRef.doc("id1").delete()).toAllow();
  });

  test("Don't allow delete when user is a plain user", async () => {
    const mockData = {
      // Create mock document wuth a userId danefilled1
      ["users/not_filledstacks"]: {
        userRole: "User"
      },
      ["posts/id1"]: {
        userId: "danefilled1"
      },
      // create mock document with a userId not_filledstacks
      ["posts/id2"]: {
        userId: "not_filledstacks"
      }
    };

    // setup the firestore app with an auth.uid set to danefilled1
    const db = await setup(
      {
        uid: "not_filledstacks"
      },
      mockData
    );

    const postsRef = db.collection("posts");
    // get the docid1
    await expect(postsRef.doc("id1").delete()).toDeny();
  });
});
