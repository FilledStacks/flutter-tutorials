import 'package:compound/ui/shared/ui_helpers.dart';
import 'package:compound/ui/widgets/input_field.dart';
import 'package:compound/viewmodels/create_post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CreatePostView extends StatelessWidget {
  final titleController = TextEditingController();

  CreatePostView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreatePostViewModel>.reactive(
      viewModelBuilder: () => CreatePostViewModel(),
      builder: (context, model, child) => Scaffold(
          floatingActionButton: FloatingActionButton(
            child: !model.busy
                ? Icon(Icons.add)
                : CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
            onPressed: () {
              // TODO: Add Post
            },
            backgroundColor:
                !model.busy ? Theme.of(context).primaryColor : Colors.grey[600],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                verticalSpace(40),
                Text(
                  'Create Post',
                  style: TextStyle(fontSize: 26),
                ),
                verticalSpaceMedium,
                InputField(
                  placeholder: 'Title',
                  controller: titleController,
                ),
                verticalSpaceMedium,
                Text('Post Image'),
                verticalSpaceSmall,
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  child: Text(
                    'Tap to add post image',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
