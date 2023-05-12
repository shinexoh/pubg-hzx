import 'package:get/get.dart';

class AppController extends GetxController {
  //存储权限状态
  final storageState = false.obs;
  void setStorageState(bool value) => storageState.value = value;

  //目录授予状态
  final directoryState = false.obs;
  void setDirectoryState(bool value) => directoryState.value = value;
}
