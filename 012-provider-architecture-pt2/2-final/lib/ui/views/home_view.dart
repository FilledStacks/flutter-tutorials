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

import 'base_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) => model.getPosts(Provider.of<User>(context).id),
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: model.state == ViewState.Busy
        ? Center(child: CircularProgressIndicator())
         : Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             UIHelper.verticalSpaceLarge(),
             Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text('Welcome ${Provider.of<User>(context).name}', 
              style: headerStyle,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text('Here are all your posts', 
              style: subHeaderStyle),
            ),
            UIHelper.verticalSpaceSmall(),
            Expanded(child: getPostsUi(model.posts)),
        ],)
      ),
    );
  }

  Widget getPostsUi(List<Post> posts) => ListView.builder(
    itemCount: posts.length,
     itemBuilder: (context, index) => PostListItem(
      post: posts[index],
      onTap: () {
        Navigator.pushNamed(context, 'post', arguments: posts[index]);
      },
     )
  );
}
