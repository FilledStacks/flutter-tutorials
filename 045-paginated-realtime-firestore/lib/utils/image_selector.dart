import 'package:image_picker/image_picker.dart';

class ImageSelector {
  Future<PickedFile> selectImage() async {
    return await ImagePicker().getImage(source: ImageSource.gallery);
  }
}
