class User {
  final String id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});
}

List<User> usersData = [
  User(
    id: '1',
    name: 'User 1',
    email: 'user1@email.com',
  ),
  User(
    id: '2',
    name: 'User 2',
    email: 'user2@email.com',
  ),
  User(
    id: '3',
    name: 'User 3',
    email: 'user3@email.com',
  ),
  User(
    id: '4',
    name: 'User 4',
    email: 'user4@email.com',
  ),
];
