import 'package:scoped_guide/service_locator.dart';
import 'package:scoped_guide/services/storage_service.dart';
import 'package:scoped_guide/enums/view_state.dart';

import 'base_model.dart';

export 'package:scoped_guide/enums/view_state.dart';

class HomeModel extends BaseModel {
  StorageService storageService = locator<StorageService>();

  String title = "HomeModel";

  Future<bool> saveData() async {
    setState(ViewState.Busy);
    title = "Saving Data";
    await storageService.saveData();
    title = "Data Saved";
    setState(ViewState.Retrieved);

    return true;
  }

}