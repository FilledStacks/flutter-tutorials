class Post {
  final String id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});
}

List<Post> postsData = [
  Post(
    id: '1',
    title: 'Post 1',
    body: 'Post 1 body',
  ),
  Post(
    id: '2',
    title: 'Post 2',
    body: 'Post 2 body',
  ),
  Post(
    id: '3',
    title: 'Post 3',
    body: 'Post 3 body',
  ),
  Post(
    id: '4',
    title: 'Post 4',
    body: 'Post 4 body',
  ),
  Post(
    id: '5',
    title: 'Post 5',
    body: 'Post 5 body',
  ),
];
