import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageSelector {
  Future<File> selectImage() async {
    return await ImagePicker.pickImage(source: ImageSource.gallery);
  }
}
