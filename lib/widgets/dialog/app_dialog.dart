import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:device_apps/device_apps.dart';

import '../../app/app.dart';
import '../../utils/utils.dart';
import '../../config/config.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';

// 一些常用的弹窗封装
class AppDialog {
  static final _appController =
      navigatorKey.currentContext!.read<AppController>();

  /// 授予游戏目录弹窗
  static void directoryDialog() {
    DialogStyle.mainDialog(
      title: '温馨提示',
      content:
          '从安卓11开始，你需要授予【游戏目录】权限才能修改画质。点击【立即授予】跳转到授予界面，然后直接点击底部【使用此文件夹】完成授予！\n\n注意：授予前请确保游戏更新至最新版本，否则将不会跳转到【游戏目录】进行授予！',
      showCancelButton: false,
      mainButtonText: '立即授予',
      onMainButton: () async {
        navigatorKey.currentState!.pop();
        final grantUri = await SharedStorage.grantDirectory(UriConfig.mainUri);

        if (grantUri == GrantUriState.success) {
          _appController.setDirectoryState(true);
          showSnackBar('授予成功');
        } else if (grantUri == GrantUriState.error) {
          showSnackBar('授予文件夹错误，请重新授予');
        } else {
          showSnackBar('未选择授予文件夹，请重新授予');
        }
      },
    );
  }

  /// 提示任务弹窗
  static void taskDialog() {
    // DialogStyle.mainDialog(
    //   title: '未知错误',
    //   subTitle: '发生未知错误，请尝试重启画质侠，如问题还不能解决请联系作者反馈！',
    //   showCanceButton: false,
    //   onOkButton: () => navigatorKey.currentState!.pop(),
    // );

    DialogStyle.mainDialog(
        title: '画质侠未激活！',
        content: '画质侠会员未激活，为了你的正常使用，请立即激活！',
        showCancelButton: false,
        mainButtonText: '我要激活',
        onMainButton: () {
          navigatorKey.currentState!
            ..pop()
            ..pushNamed('/keypass');
        });
  }

  /// 存储权限被拒绝弹窗
  static void permissionDeniedDialog() {
    DialogStyle.mainDialog(
      title: '你已拒绝权限',
      content: '由于画质侠需要【文件存储权限】才能修改画质，请点击【手动授予】跳转到设置，手动给画质侠授予【文件存储权限】',
      showCancelButton: false,
      mainButtonText: '手动授予',
      onMainButton: () {
        navigatorKey.currentState!.pop();
        AppUtil.openAppSettings();
      },
    );
  }

  /// 应用更新弹窗
  static void updateDialog({
    required String title,
    required String subTitle,
    required String url,
    required bool isForce,
  }) {
    final BuildContext context = navigatorKey.currentContext!;

    showGeneralDialog(
      context: context,
      // 如果isForce是true时，不允许关闭弹窗。
      barrierDismissible: isForce ? false : true,
      transitionDuration: const Duration(milliseconds: 300),
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return AnimationTransition.scale(animation, child);
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return PopScope(
            // 如果isForce是true时，点击返回键直接退出应用而不是关闭弹窗。
            canPop: isForce ? false : true,
            onPopInvoked: (didPop) {
              if (!didPop) SystemNavigator.pop();
            },
            child: AlertDialog(
              title: Text(title),
              content: Text(subTitle),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              actions: [
                TextButton(
                  onPressed: () {
                    isForce
                        ? SystemNavigator.pop()
                        : navigatorKey.currentState!.pop();
                  },
                  child: Text(isForce ? '退出' : '取消'),
                ),
                FilledButton(
                    onPressed: () => AppUtil.openUrl(url),
                    child: const Text('前往更新'))
              ],
            ));
      },
    );
  }

  /// 重置画质后重启游戏弹窗
  static void restoreDialog() {
    DialogStyle.mainDialog(
      title: '重置成功',
      content: '重置后需重启游戏才能生效，否则修改其他画质功能将导致无效，进入游戏5秒左右即可退出，请立即重启！',
      mainButtonText: '重启游戏',
      showCancelButton: false,
      onMainButton: () async {
        navigatorKey.currentState!.pop();
        if (!await DeviceApps.openApp('com.tencent.tmgp.pubgmhd')) {
          showSnackBar('重启游戏失败，请手动重启');
        }
      },
    );
  }

  /// 提示存在解锁文件重置画质
  static void dlRestoreDialog() {
    DialogStyle.mainDialog(
      title: '温馨提示',
      content: '检测到你使用过“解锁画质+120帧”，你需要重置画质并重启游戏才能修改其他画质功能！',
      mainButtonText: '重置画质',
      showCancelButton: false,
      onMainButton: () async {
        navigatorKey.currentState!.pop();

        if (_appController.sdkVersion <= 29) {
          await UseFor10.restorePq() && await UseFor10.restoreDl()
              ? AppDialog.restoreDialog()
              : showSnackBar('重置画质失败，请检查权限是否授予');
        } else if (await SharedStorage.checkUriGrant(UriConfig.mainUri)) {
          await UseFor11.restorePq() && await UseFor11.restoreDl()
              ? AppDialog.restoreDialog()
              : showSnackBar('重置画质失败，请检查权限是否授予');
        } else {
          AppDialog.directoryDialog();
        }
      },
    );
  }
}
