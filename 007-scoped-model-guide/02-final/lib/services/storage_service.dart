class StorageService {
  Future<bool> saveData() async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }
}