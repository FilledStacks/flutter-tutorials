class Post {
  final String title;
  final String imageUrl;

  Post({this.title, this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'imageUrl': imageUrl,
    };
  }

  static Post fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Post(
      title: map['title'],
      imageUrl: map['imageUrl'],
    );
  }
}
