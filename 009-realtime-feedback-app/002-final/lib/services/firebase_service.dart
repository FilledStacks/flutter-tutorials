import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:skeleton_watcher/models/stats.dart';
import 'package:skeleton_watcher/models/user_feedback.dart';

class FirebaseService {
  final StreamController<Stats> _statsController = StreamController<Stats>();

  final StreamController<List<UserFeedback>> _feedbackController =
      StreamController<List<UserFeedback>>();

  final StreamController<int> _unreadController = StreamController<int>();

  FirebaseService() {
    Firestore.instance
        .collection('informations')
        .document('project_stats')
        .snapshots()
        .listen(_statsUpdated);

    Firestore.instance
        .collection('feedback')
        .where('open', isEqualTo: true)
        .snapshots()
        .listen(_feedbackAdded);
  }

  Stream<Stats> get appStats => _statsController.stream;

  Stream<List<UserFeedback>> get feedback => _feedbackController.stream;

  Stream<int> get unreadCount => _unreadController.stream;

  void markFeedbackAsRead({@required String feedbackId}) {
    Firestore.instance
        .collection('feedback')
        .document(feedbackId)
        .updateData({
          'read': true
        });
  }

  void _statsUpdated(DocumentSnapshot snapshot) {
    _statsController.add(Stats.fromSnapshot(snapshot));
  }

  void _feedbackAdded(QuerySnapshot snapshot) {
    var feedback = _getFeedbackFromSnapshot(snapshot);
    _feedbackController.add(feedback);
    _emitUnreadCount(feedback);
  }

  List<UserFeedback> _getFeedbackFromSnapshot(QuerySnapshot snapshot) {
    var feedbackItems = List<UserFeedback>();
    var documents = snapshot.documents;

    var hasDocuments = documents.length > 0;

    if(hasDocuments) {
      for (var document in documents) {
        var documentData = document.data;
        documentData['id'] = document.documentID;
        feedbackItems.add(UserFeedback.fromData(documentData));
      }
    }

    return feedbackItems;
  }

  void _emitUnreadCount(List<UserFeedback> userFeedback) {
    var unreadCount = userFeedback.where((item) => !item.read).length;
    _unreadController.add(unreadCount);
  }
}
