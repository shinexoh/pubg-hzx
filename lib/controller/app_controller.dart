import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {
  // 任务状态
  bool _taskState = false;
  bool get taskState => _taskState;

  // 存储权限状态
  bool _storageState = false;
  bool get storageState => _storageState;

  // 目录授予状态
  bool _directoryState = false;
  bool get directoryState => _directoryState;

  // 安卓SDK版本号
  int _sdkVersion = 0;
  int get sdkVersion => _sdkVersion;

  void setTaskState(bool value) {
    _taskState = value;
    notifyListeners();
  }

  void setStorageState(bool value) {
    _storageState = value;
    notifyListeners();
  }

  void setDirectoryState(bool value) {
    _directoryState = value;
    notifyListeners();
  }

  void setSdkVersion(int value) {
    _sdkVersion = value;
    notifyListeners();
  }
}
