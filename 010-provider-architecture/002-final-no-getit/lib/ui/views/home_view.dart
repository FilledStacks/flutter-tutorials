import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecutre/core/enums/viewstate.dart';
import 'package:provider_architecutre/core/models/post.dart';
import 'package:provider_architecutre/core/models/user.dart';
import 'package:provider_architecutre/core/viewmodels/home_model.dart';
import 'package:provider_architecutre/ui/shared/app_colors.dart';
import 'package:provider_architecutre/ui/shared/text_styles.dart';
import 'package:provider_architecutre/ui/shared/ui_helpers.dart';
import 'package:provider_architecutre/ui/widgets/postlist_item.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'home_view.g.dart';

@widget
Widget homeView() {
  return Scaffold(
    backgroundColor: backgroundColor,
    // A consumer so that we don't rebuild `Scaffold` when `HomeModel` change.
    body: Consumer<HomeModel>(builder: (context, model, _) {
      return model.state == ViewState.Busy
          ? const Center(child: CircularProgressIndicator())
          : const HomeContent(
              header: HeaderTitle(),
              body: PostList(),
            );
    }),
  );
}

// It's better as a standalone widget since it depends on `BuiltContext`
// so we don't rebuild `HomeContent` for no reason, and we have a const constructor
@widget
Widget headerTitle(BuildContext context) {
  return Text(
    'Welcome ${Provider.of<User>(context).name}',
    style: headerStyle,
  );
}

@widget
Widget homeContent({Widget body, Widget header}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      UIHelper.verticalSpaceLarge,
      Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: header,
      ),
      const Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: const Text(
          'Here are all your posts',
          style: subHeaderStyle,
        ),
      ),
      UIHelper.verticalSpaceSmall,
      Expanded(child: body),
    ],
  );
}

@widget
Widget postList(BuildContext context) {
  final homeModel = Provider.of<HomeModel>(context);

  return ListView.builder(
    itemCount: homeModel.posts.length,
    itemBuilder: (context, index) {
      var post = homeModel.posts[index];
      return Provider<Post>.value(
        key: ValueKey(post.id),
        value: post,
        // it's not necessary to move the click handler to PostListItem
        // but this allows to use a const constructor, which is better for performance.
        // this way, only the item that changes rebuilds. Not the whole list.
        child: const PostListItem(),
      );
    },
  );
}
