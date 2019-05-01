class User {
  final String username;
  final String email;
  final String userId;
  final String accessToken;

  User({this.username, this.email, this.userId, this.accessToken});

  User.fromJson(Map<String, dynamic> data)
      : username = data['username'],
        email = data['email'],
        userId = data['userId'],
        accessToken = data['accessToken'];
}
