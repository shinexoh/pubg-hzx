import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:get/get.dart';

import 'package:huazhixia/controller/controller.dart';
import 'package:huazhixia/config/config.dart';
import 'package:huazhixia/util/util.dart';
import 'dialog_style.dart';

//一些常用的弹窗封装
class AppDialog {
  ///授予游戏目录弹窗
  static void gameDirectoryDialog() {
    DialogStyle.mainDialog(
      title: '温馨提示',
      subTitle:
          '从安卓11开始，你需要授予【游戏目录】权限才能修改画质。点击【立即授予】跳转到授予界面，然后直接点击底部【使用此文件夹】即可完成授予！',
      showCanceButton: false,
      okButtonTitle: '立即授予',
      onOkButton: () async {
        final grantUri = await SharedStorage.grantDirectory(UriConfig.mainUri);
        if (grantUri == GrantUriState.success) {
          Get
            ..back()
            ..find<AppController>().setDirectoryState(true);
          showToast('授予成功');
        } else if (grantUri == GrantUriState.error) {
          showToast('授予文件夹错误，请重新授予');
        } else {
          showToast('未选择授予文件夹，请重新授予');
        }
      },
    );
  }

  ///提示任务弹窗
  static void taskDialog() {
    // DialogStyle.mainDialog(
    //   title: '未知错误',
    //   subTitle: '发生未知错误，请尝试重启画质侠，如问题还不能解决请联系作者反馈！',
    //   showCanceButton: false,
    //   onOkButton: () {
    //     Get.back();
    //   },
    // );

    DialogStyle.mainDialog(
      title: '画质侠未激活！',
      subTitle: '画质侠会员未激活，为了你的正常使用，请立即激活！',
      showCanceButton: false,
      okButtonTitle: '我要激活',
      onOkButton: () => Get.toNamed('/cardpass'),
    );
  }

  ///存储权限被拒绝弹窗
  static void storageDialog() {
    DialogStyle.mainDialog(
      title: '你已拒绝权限',
      subTitle:
          '由于画质侠需要【文件存储权限】才能修改画质，为保证你的正常使用，请点击【手动授予】跳转到设置，手动给画质侠授予【文件存储权限】',
      showCanceButton: false,
      okButtonTitle: '手动授予',
      onOkButton: () {
        Get.back();
        AppUtil.openAppSettings();
      },
    );
  }

  ///应用维护弹窗
  static void pauseDialog(String title, String subTitle) {
    Get.dialog(
        WillPopScope(
            onWillPop: () async {
              SystemNavigator.pop();
              return true;
            },
            child: AlertDialog(
              title: Text(title),
              content: Text(subTitle),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              actions: [
                TextButton(
                    onPressed: () => SystemNavigator.pop(),
                    child: const Text('退出')),
              ],
            )),
        barrierDismissible: false);
  }

  ///应用更新弹窗
  static void updateDialog({
    required String title,
    required String subTitle,
    required String url,
    required bool isForce,
  }) {
    Get.dialog(
        WillPopScope(
            onWillPop: () async {
              if (isForce) {
                SystemNavigator.pop();
                return true;
              }
              return true;
            },
            child: AlertDialog(
              title: Text(title),
              content: Text(subTitle),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              actions: [
                TextButton(
                  onPressed: () => isForce ? SystemNavigator.pop() : Get.back(),
                  child: Text(isForce ? '退出' : '取消'),
                ),
                TextButton(
                    onPressed: () => AppUtil.openUrl(url),
                    child: const Text('前往更新'))
              ],
            )),
        barrierDismissible: isForce ? false : true);
  }
}
