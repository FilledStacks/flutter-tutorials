const { setup, teardown } = require("./helpers");

describe("General Safety Rules", () => {
  afterEach(async () => {
    await teardown();
  });

  test("should deny a read to the posts collection", async () => {
    const db = await setup();
    const postsRef = db.collection("posts");
    await expect(postsRef.get()).toDeny();
  });

  test("should deny a write to users even when logged in", async () => {
    const db = await setup({
      uid: "danefilled"
    });

    const usersRef = db.collection("users");
    await expect(usersRef.add({ data: "something" })).toDeny();
  });
});

describe("Posts Rules", () => {
  afterEach(async () => {
    await teardown();
  });

  test("should allow update when user owns post", async () => {
    const mockData = {
      "posts/id1": {
        userId: "danefilled"
      },
      "posts/id2": {
        userId: "not_filledstacks"
      }
    };

    const mockUser = {
      uid: "danefilled"
    };

    const db = await setup(mockUser, mockData);

    const postsRef = db.collection("posts");

    await expect(
      postsRef.doc("id1").update({ updated: "new_value" })
    ).toAllow();

    await expect(postsRef.doc("id2").update({ updated: "new_value" })).toDeny();
  });

  test("should allow delete when user owns post", async () => {
    const mockData = {
      "posts/id1": {
        userId: "danefilled"
      },
      "posts/id2": {
        userId: "not_filledstacks"
      }
    };

    const mockUser = {
      uid: "danefilled"
    };

    const db = await setup(mockUser, mockData);

    const postsRef = db.collection("posts");

    await expect(postsRef.doc("id1").delete()).toAllow();

    await expect(postsRef.doc("id2").delete()).toDeny();
  });

  test("should allow delete when user is admin", async () => {
    const mockData = {
      "users/filledstacks": {
        userRole: "Admin"
      },
      "posts/id1": {
        userId: "not_matching1"
      },
      "posts/id2": {
        userId: "not_matching2"
      }
    };

    const mockUser = {
      uid: "filledstacks"
    };

    const db = await setup(mockUser, mockData);

    const postsRef = db.collection("posts");

    await expect(postsRef.doc("id1").delete()).toAllow();
  });

  test("should not allow delete for normal user", async () => {
    const mockData = {
      "users/filledstacks": {
        userRole: "User"
      },
      "posts/id1": {
        userId: "not_matching1"
      },
      "posts/id2": {
        userId: "not_matching2"
      }
    };

    const mockUser = {
      uid: "filledstacks"
    };

    const db = await setup(mockUser, mockData);

    const postsRef = db.collection("posts");

    await expect(postsRef.doc("id1").delete()).toDeny();
  });

  test("should allow adding a post when logged in", async () => {
    const db = await setup({
      uid: "userId"
    });

    const postsRef = db.collection("posts");
    await expect(postsRef.add({ title: "new_post" })).toAllow();
  });

  test("should deny adding a post when not logged in", async () => {
    const db = await setup();
    const postsRef = db.collection("posts");
    await expect(postsRef.add({ title: "new post" })).toDeny();
  });
});
