import 'package:get/get.dart';

class AppController extends GetxController {
  //任务状态
  final taskState = false.obs;
  void setTaskState(bool value) => taskState.value = value;

  //存储权限状态
  final storageState = false.obs;
  void setStorageState(bool value) => storageState.value = value;

  //目录授予状态
  final directoryState = false.obs;
  void setDirectoryState(bool value) => directoryState.value = value;

  //安卓版本
  final androidVersion = 0.0.obs;
  void setAndroidVersion(double version) => androidVersion.value = version;
}
