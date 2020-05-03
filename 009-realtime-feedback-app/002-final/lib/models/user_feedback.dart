class UserFeedback {
  final String details;
  final String note;
  final bool open;
  final bool read;
  final String title;
  final int type;
  final String userId;
  final String id;

  UserFeedback(
      {this.details,
      this.note,
      this.open,
      this.read,
      this.title,
      this.type,
      this.userId,
      this.id});

  UserFeedback.fromData(Map<String, dynamic> data)
      : details = data['details'],
        note = data['note'],
        open = data['open'] ?? true,
        read = data['read'] ?? false,
        title = data['title'],
        type = data['type'] ?? 0,
        userId = data['userId'],
        id = data['id'];
}
