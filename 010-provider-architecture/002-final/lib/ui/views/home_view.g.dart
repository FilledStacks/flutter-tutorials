// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => homeView();
}

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => headerTitle(_context);
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key key, this.body, this.header}) : super(key: key);

  final Widget body;

  final Widget header;

  @override
  Widget build(BuildContext _context) =>
      homeContent(body: body, header: header);
}

class PostList extends StatelessWidget {
  const PostList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext _context) => postList(_context);
}
