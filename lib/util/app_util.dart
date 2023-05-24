import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:device_apps/device_apps.dart';
import 'package:android_intent_plus/android_intent.dart';

//常用的工具封装
class AppUtil {
  ///调用系统浏览器打开网页
  static void openUrl(String url) async {
    final intent = AndroidIntent(
      action: 'android.intent.action.VIEW',
      data: url,
    );

    if (await intent.canResolveActivity() ?? false) {
      intent.launch();
    } else {
      showToast('打开浏览器失败');
    }
  }

  ///打开QQ名片主页
  static void openQQ(int qq) async {
    final intent = AndroidIntent(
        action: 'android.intent.action.VIEW',
        data: 'mqqapi://card/show_pslcard?card_type=person&uin=$qq');

    if (await intent.canResolveActivity() ?? false) {
      intent.launch();
    } else {
      showToast('打开QQ失败');
    }
  }

  ///打开QQ群主页
  static void openQQGroup(int qqGroup) async {
    final intent = AndroidIntent(
        action: 'android.intent.action.VIEW',
        data: 'mqqapi://card/show_pslcard?card_type=group&uin=$qqGroup');

    if (await intent.canResolveActivity() ?? false) {
      intent.launch();
    } else {
      showToast('打开QQ失败');
    }
  }

  ///打开应用设置界面
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

  ///设置状态栏样式Light
  static void setStatusBarLight() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
  }

  ///设置状态栏样式Dark
  static void setStatusBarDark() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
  }
}
