import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:device_apps/device_apps.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../app/app.dart';
import '../utils/utils.dart';
import '../config/config.dart';
import '../controller/controller.dart';
import '../server/server.dart';
import '../widgets/widgets.dart';

// 常用的方法封装
class AppUtil {
  static final _appController =
      navigatorKey.currentContext!.read<AppController>();

  /// 调用系统浏览器打开网页
  static void openUrl(String url) async {
    final intent = AndroidIntent(
      action: 'android.intent.action.VIEW',
      data: url,
    );

    if (await intent.canResolveActivity() ?? false) {
      intent.launch();
    } else {
      DialogStyle.mainDialog(
          subTitle: '打开浏览器失败，请点击下方复制网址后粘贴到浏览器打开！\n\n$url',
          okButtonTitle: '点击复制网址',
          showCanceButton: false,
          onOkButton: () {
            navigatorKey.currentState!.pop();
            Clipboard.setData(ClipboardData(text: url));
            showToast('复制网址成功');
          });
    }
  }

  /// 打开QQ名片主页
  static void openQQ(int qq) async {
    final intent = AndroidIntent(
        action: 'android.intent.action.VIEW',
        data: 'mqqapi://card/show_pslcard?card_type=person&uin=$qq');

    if (await intent.canResolveActivity() ?? false) {
      intent.launch();
    } else {
      DialogStyle.mainDialog(
        subTitle: '打开QQ失败，请手动添加QQ：$qq',
        showCanceButton: false,
        onOkButton: () => navigatorKey.currentState!.pop(),
      );
    }
  }

  /// 打开QQ群主页
  static void openQQGroup(int qqGroup) async {
    final intent = AndroidIntent(
        action: 'android.intent.action.VIEW',
        data: 'mqqapi://card/show_pslcard?card_type=group&uin=$qqGroup');

    if (await intent.canResolveActivity() ?? false) {
      intent.launch();
    } else {
      DialogStyle.mainDialog(
        subTitle: '打开QQ失败，请手动添加QQ群：$qqGroup',
        showCanceButton: false,
        onOkButton: () => navigatorKey.currentState!.pop(),
      );
    }
  }

  /// 打开应用设置界面
  static void openAppSettings() async {
    // const intent = AndroidIntent(
    //   action: 'android.settings.APPLICATION_DETAILS_SETTINGS',
    //   data: 'package:com.shinex.huazhixia',
    // );

    // if (await intent.canResolveActivity() ?? false) {
    //   await intent.launch();
    // } else {
    //   showToast('打开设置失败，请手动打开');
    // }

    if (!await DeviceApps.openAppSettings('com.shinex.huazhixia')) {
      showToast('打开设置失败，请手动打开');
    }
  }

  /// 设置状态栏样式Light
  static void setStatusBarLight() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
  }

  /// 设置状态栏样式Dark
  static void setStatusBarDark() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  /// 查看是否存在解锁文件
  static Future<bool> checkDlFile() async {
    final file = File(GameFilePath.dlFilePath);

    if (_appController.sdkVersion <= 29) {
      if (await file.exists()) return true;
    } else if (await SharedStorage.checkUriGrant(UriConfig.mainUri)) {
      if (await SharedStorage.fileExist(GameFileName.dlFileName)) {
        return true;
      }
    }

    return false;
  }

  /// 检查网络是否可用
  static Future<bool> checkNetAvailability() async {
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity != ConnectivityResult.none) {
      final http = await HttpClient.get('https://juejin.cn/');
      return http.isOk;
    }
    return false;
  }

  /// 随机修改画质
  static void randomUsePq({
    // 修改成功后回调方法
    required VoidCallback callBack,
    String errorToast = '修改失败，请检查权限是否授予',
  }) async {
    final random = Random().nextInt(FileConfig.allPqFile.length - 1);

    if (SpUtil.containsKey(AppConfig.taskKey)) {
      if (_appController.sdkVersion <= 29) {
        await UseFor10.usePq(FileConfig.allPqFile[random])
            ? callBack()
            : showToast(errorToast);
      } else if (await SharedStorage.checkUriGrant(UriConfig.mainUri)) {
        await UseFor11.usePq(FileConfig.allPqFile[random])
            ? callBack()
            : showToast(errorToast);
      } else {
        AppDialog.directoryDialog();
      }
    } else {
      AppDialog.taskDialog();
    }
  }
}
