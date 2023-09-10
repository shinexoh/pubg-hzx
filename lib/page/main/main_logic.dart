import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../app/app.dart';
import '../../server/server.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';
import '../../config/config.dart';
import '../../utils/utils.dart';

import 'main_page.dart';

mixin MainLogic on State<MainPage> {
  final _appController = navigatorKey.currentContext!.read<AppController>();

  // 检查任务状态
  void checkTask() {
    SpUtil.containsKey(AppConfig.taskKey)
        ? _appController.setTaskState(true)
        : _appController.setTaskState(false);
  }

  // 检查存储权限
  void checkStorage() async {
    await Permission.storage.status == PermissionStatus.granted
        ? _appController.setStorageState(true)
        : _appController.setStorageState(false);
  }

  // 检查游戏目录授予
  void checkDirectory() async {
    await SharedStorage.checkUriGrant(UriConfig.mainUri)
        ? _appController.setDirectoryState(true)
        : _appController.setDirectoryState(false);
  }

  // 统计应用数据
  void statistics() => HttpClient.get(Api.appStatistics);

  // 检查应用更新，如果主更新链接失败就请求备用更新链接
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
      final alAppUpdate = await HttpClient.get(Api.alternateUpdate);

      if (alAppUpdate.isOk) {
        final alNewVersion = alAppUpdate.data['appupdate']['version']
            .toString()
            .split('.')
            .join();

        if (double.parse(alNewVersion) > AppConfig.updateVersion) {
          AppDialog.updateDialog(
              title: alAppUpdate.data['appupdate']['title'],
              subTitle: alAppUpdate.data['appupdate']['subtitle'],
              url: alAppUpdate.data['appupdate']['downloadurl'],
              isForce: alAppUpdate.data['appupdate']['isforce']);
        }
      }
    }
  }

  // 打印一些信息
  void printInfo() async {
    await Future.delayed(const Duration(seconds: 2));
    debugPrint('''
所有Key：${SpUtil.getAllKey()}
安卓Sdk版本：${_appController.sdkVersion}
存储权限：${_appController.storageState}
目录授予：${_appController.directoryState}''');
  }

  // 如果旧Key存在就还原画质
  void restoreFile() async {
    if (SpUtil.containsKey('TaskKey')) {
      SpUtil.remove('TaskKey');

      if (_appController.sdkVersion <= 29) {
        UseFor10.restorePq();
        UseFor10.restoreDl();
      } else if (await SharedStorage.checkUriGrant(UriConfig.mainUri)) {
        UseFor11.restorePq();
        UseFor11.restoreDl();
      }
    }
  }

  // 显示应用公告SnackBar
  void showAppTips() async {
    final appTips = await HttpClient.get(Api.main);

    if (appTips.isOk) {
      final String? tipsContent = appTips.data['apptips'];

      if (tipsContent != null) {
        showSnackBar(
          tipsContent,
          label: '查看',
          onPressed: () => DialogStyle.mainDialog(
              subTitle: tipsContent,
              showCanceButton: false,
              onOkButton: () => navigatorKey.currentState!.pop()),
        );
      }
    }
  }
}
