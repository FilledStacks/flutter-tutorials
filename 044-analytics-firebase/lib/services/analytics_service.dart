import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/foundation.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics();

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  // User properties tells us what the user is
  Future setUserProperties({@required String userId, String userRole}) async {
    await _analytics.setUserId(userId);
    await _analytics.setUserProperty(name: 'user_role', value: userRole);
    // property to indicate if it's a pro paying member
    // property that might tell us it's a regular poster, etc
  }

  Future logLogin() async {
    await _analytics.logLogin(loginMethod: 'email');
  }

  Future logSignUp() async {
    await _analytics.logSignUp(signUpMethod: 'email');
  }

  Future logPostCreated({bool hasImage}) async {
    await _analytics.logEvent(
      name: 'create_post',
      parameters: {'has_image': hasImage},
    );
  }
}
