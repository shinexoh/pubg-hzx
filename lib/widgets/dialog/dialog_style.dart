import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';

//弹窗样式的封装
class DialogStyle {
  ///主要的弹窗样式
  static void mainDialog({
    String? title,
    String? subTitle,
    String canceButtonTitle = '取消',
    String okButtonTitle = '确定',
    bool dismissible = true,
    bool showCanceButton = true,
    GestureTapCallback? onCanceButton,
    GestureTapCallback? onOkButton,
  }) {
    AwesomeDialog(
      context: Get.context!,
      title: title,
      desc: subTitle,
      dialogType: DialogType.noHeader,
      descTextStyle: const TextStyle(fontSize: 15),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      dialogBorderRadius: BorderRadius.circular(15),
      dismissOnTouchOutside: dismissible,
      btnCancel: showCanceButton != false
          ? AnimatedButton(
              text: canceButtonTitle,
              isFixedHeight: false,
              color: Colors.pink,
              buttonTextStyle: const TextStyle(color: Colors.white),
              pressEvent: onCanceButton ?? () {},
            )
          : null,
      btnOk: AnimatedButton(
        text: okButtonTitle,
        isFixedHeight: false,
        color: Colors.blue,
        buttonTextStyle: const TextStyle(color: Colors.white),
        pressEvent: onOkButton ?? () {},
      ),
    ).show();
  }
}
