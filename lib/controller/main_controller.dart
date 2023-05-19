import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:remixicon/remixicon.dart';
import 'package:get/get.dart';

import '../page/home_page.dart';
import '../page/fun_page.dart';
import '../page/device_page.dart';
import '../page/user_page.dart';

import 'package:huazhixia/server/api.dart';
import 'package:huazhixia/server/http_client.dart';
import 'package:huazhixia/controller/controller.dart';
import 'package:huazhixia/widgets/widgets.dart';
import 'package:huazhixia/config/config.dart';
import 'package:huazhixia/util/util.dart';

class MainController extends GetxController {
  final _appController = Get.put(AppController());

  final pageIndex = 0.obs;

  final List<Widget> pageBody = [
    const HomePage(),
    const FunPage(),
    const DevicePage(),
    const UserPage(),
  ];

  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
        label: '首页',
        icon: Icon(Remix.home_5_line),
        activeIcon: Icon(Remix.home_5_fill)),
    BottomNavigationBarItem(
        label: '功能',
        icon: Icon(Remix.compass_3_line),
        activeIcon: Icon(Remix.compass_3_fill)),
    BottomNavigationBarItem(
        label: '设备',
        icon: Icon(Remix.dvd_line),
        activeIcon: Icon(Remix.dvd_fill)),
    BottomNavigationBarItem(
        label: '我的',
        icon: Icon(Remix.user_smile_line),
        activeIcon: Icon(Remix.user_smile_fill)),
  ];

  void onTap(int index) {
    pageIndex.value = index;
  }

  //检查任务状态
  void checkTask() async {
    await SpUtil.addString(AppConfig.taskKey, '');
    SpUtil.containsKey(AppConfig.taskKey)
        ? _appController.setTaskState(true)
        : _appController.setTaskState(false);
  }

  //检查存储权限
  void checkStorage() async {
    await Permission.storage.status == PermissionStatus.granted
        ? _appController.setStorageState(true)
        : _appController.setStorageState(false);
  }

  //检查游戏目录授予
  void checkDirectory() async {
    await SharedStorage.checkUriGrant(UriConfig.mainUri)
        ? _appController.setDirectoryState(true)
        : _appController.setDirectoryState(false);
  }

  //检查应用是否维护
  void checkPause() async {
    final appPause = await HttpClient.get(Api.main);

    if (appPause.isOk && appPause.data['apppause']['enable'] == true) {
      AppDialog.pauseDialog(
        appPause.data['apppause']['title'],
        appPause.data['apppause']['subtitle'],
      );
    }
  }

  //检查应用更新，如果主更新链接挂了就请求备用更新链接
  void checkUpdate() async {
    final appUpdate = await HttpClient.get(Api.main);

    if (appUpdate.isOk) {
      final newVersion =
          appUpdate.data['appupdate']['version'].toString().split('.').join();

      if (double.parse(newVersion) > AppConfig.updateVersion) {
        AppDialog.updateDialog(
            title: appUpdate.data['appupdate']['title'],
            subTitle: appUpdate.data['appupdate']['subtitle'],
            url: appUpdate.data['appupdate']['downloadurl'],
            isForce: appUpdate.data['appupdate']['isforce']);
      }
    } else {
      final appUpdateAl = await HttpClient.get(Api.alternateUpdate);

      if (appUpdateAl.isOk) {
        final newVersionAl = appUpdateAl.data['appupdate']['version']
            .toString()
            .split('.')
            .join();

        if (double.parse(newVersionAl) > AppConfig.updateVersion) {
          AppDialog.updateDialog(
              title: appUpdateAl.data['appupdate']['title'],
              subTitle: appUpdateAl.data['appupdate']['subtitle'],
              url: appUpdateAl.data['appupdate']['downloadurl'],
              isForce: appUpdateAl.data['appupdate']['isforce']);
        }
      }
    }
  }
}
