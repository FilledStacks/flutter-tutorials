import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compound/models/post.dart';
import 'package:compound/models/user.dart';
import 'package:flutter/services.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('users');
  final CollectionReference _postsCollectionReference =
      Firestore.instance.collection('posts');

  final StreamController<List<Post>> _postsController =
      StreamController<List<Post>>.broadcast();

  // #6: Create a list that will keep the paged results
  List<List<Post>> _allPagedResults = List<List<Post>>();

  static const int PostsLimit = 20;

  DocumentSnapshot _lastDocument;
  bool _hasMorePosts = true;

  Future createUser(User user) async {
    try {
      await _usersCollectionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.document(uid).get();
      return User.fromData(userData.data);
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future addPost(Post post) async {
    try {
      await _postsCollectionReference.add(post.toMap());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future getPostsOnceOff() async {
    try {
      var postDocumentSnapshot =
          await _postsCollectionReference.limit(PostsLimit).getDocuments();
      if (postDocumentSnapshot.documents.isNotEmpty) {
        return postDocumentSnapshot.documents
            .map((snapshot) => Post.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.title != null)
            .toList();
      }
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Stream listenToPostsRealTime() {
    // Register the handler for when the posts data changes
    _requestPosts();
    return _postsController.stream;
  }

  // #1: Move the request posts into it's own function
  void _requestPosts() {
    // #2: split the query from the actual subscription
    var pagePostsQuery = _postsCollectionReference
        .orderBy('title')
        // #3: Limit the amount of results
        .limit(PostsLimit);

    // #5: If we have a document start the query after it
    if (_lastDocument != null) {
      pagePostsQuery = pagePostsQuery.startAfterDocument(_lastDocument);
    }

    if (!_hasMorePosts) return;

    // #7: Get and store the page index that the results belong to
    var currentRequestIndex = _allPagedResults.length;

    pagePostsQuery.snapshots().listen((postsSnapshot) {
      if (postsSnapshot.documents.isNotEmpty) {
        var posts = postsSnapshot.documents
            .map((snapshot) => Post.fromMap(snapshot.data, snapshot.documentID))
            .where((mappedItem) => mappedItem.title != null)
            .toList();

        // #8: Check if the page exists or not
        var pageExists = currentRequestIndex < _allPagedResults.length;

        // #9: If the page exists update the posts for that page
        if (pageExists) {
          _allPagedResults[currentRequestIndex] = posts;
        }
        // #10: If the page doesn't exist add the page data
        else {
          _allPagedResults.add(posts);
        }

        // #11: Concatenate the full list to be shown
        var allPosts = _allPagedResults.fold<List<Post>>(List<Post>(),
            (initialValue, pageItems) => initialValue..addAll(pageItems));

        // #12: Broadcase all posts
        _postsController.add(allPosts);

        // #13: Save the last document from the results only if it's the current last page
        if (currentRequestIndex == _allPagedResults.length - 1) {
          _lastDocument = postsSnapshot.documents.last;
        }

        // #14: Determine if there's more posts to request
        _hasMorePosts = posts.length == PostsLimit;
      }
    });
  }

  Future deletePost(String documentId) async {
    await _postsCollectionReference.document(documentId).delete();
  }

  Future updatePost(Post post) async {
    try {
      await _postsCollectionReference
          .document(post.documentId)
          .updateData(post.toMap());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  void requestMoreData() => _requestPosts();
}
