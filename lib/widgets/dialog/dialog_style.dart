import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../../app/app.dart';

// 弹窗样式的封装
class DialogStyle {
  /// 主要的弹窗样式
  static void mainDialog({
    String? title,
    String? subTitle,
    DialogType dialogType = DialogType.noHeader,
    String canceButtonTitle = '取消',
    String okButtonTitle = '确定',
    Color canceButtonColor = Colors.pink,
    Color okButtonColor = Colors.blue,
    bool dismissible = true,
    bool showCanceButton = true,
    GestureTapCallback? onCanceButton,
    GestureTapCallback? onOkButton,
  }) {
    AwesomeDialog(
      context: navigatorKey.currentContext!,
      title: title,
      desc: subTitle,
      dialogType: dialogType,
      descTextStyle: const TextStyle(fontSize: 15),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      dialogBorderRadius: BorderRadius.circular(15),
      dismissOnTouchOutside: dismissible,
      btnCancel: showCanceButton
          ? AnimatedButton(
              text: canceButtonTitle,
              isFixedHeight: false,
              color: canceButtonColor,
              buttonTextStyle: const TextStyle(color: Colors.white),
              pressEvent: onCanceButton ??
                  () => Navigator.pop(navigatorKey.currentContext!))
          : null,
      btnOk: AnimatedButton(
        text: okButtonTitle,
        isFixedHeight: false,
        color: okButtonColor,
        buttonTextStyle: const TextStyle(color: Colors.white),
        pressEvent: onOkButton ?? () {},
      ),
    ).show();
  }

  /// 加载中弹窗
  ///
  /// 如 [autoHideDuration] 不为null则使用await等待时间自动关闭
  static Future<void> loadingDialog({
    Duration? autoHideDuration,
    bool dismissible = true,
    Color loadingColor = Colors.blue,
  }) async {
    await AwesomeDialog(
      context: navigatorKey.currentContext!,
      dialogType: DialogType.noHeader,
      bodyHeaderDistance: 0,
      autoHide: autoHideDuration,
      dismissOnTouchOutside: dismissible,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: CircularProgressIndicator(color: loadingColor),
      ),
    ).show();
  }
}
