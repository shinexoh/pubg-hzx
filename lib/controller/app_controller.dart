import 'package:get/get.dart';

class AppController extends GetxController {
  //任务状态
  var taskState = false.obs;
  void setTaskState(bool value) => taskState.value = value;

  //存储权限状态
  var storageState = false.obs;
  void setStorageState(bool value) => storageState.value = value;

  //目录授予状态
  var directoryState = false.obs;
  void setDirectoryState(bool value) => directoryState.value = value;

  //安卓SDK版本号
  var sdkVersion = 0.obs;
  void setSdkVersion(int version) => sdkVersion.value = version;
}
