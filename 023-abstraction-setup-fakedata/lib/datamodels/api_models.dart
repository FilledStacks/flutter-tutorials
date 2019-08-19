class Post {}

class Comment {}

class User {
  final String name;
  final String phoneNumber;

  User({this.name, this.phoneNumber});
}

class LoginResponse {
  final bool success;
  final int userId;
  final String message;

  LoginResponse({this.success, this.userId, this.message});
}
