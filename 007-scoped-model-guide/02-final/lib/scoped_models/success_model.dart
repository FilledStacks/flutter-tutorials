import 'package:scoped_guide/scoped_models/base_model.dart';

class SuccessModel extends BaseModel {
  String title = "no text yet";

  Future fetchDuplicatedText(String text) async {
    setState(ViewState.Busy);
    await Future.delayed(Duration(seconds: 2));
    title = '$text $text';

    setState(ViewState.Retrieved);
  }
}