class Post {
  String title;
  int likeCount;

  Post({this.title, this.likeCount});

  Post.fromMap(Map<String, dynamic> map) {
    title = map['title'];
    likeCount = map['likeCount'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{'title': title, 'likeCount': likeCount};
    return map;
  }
}
