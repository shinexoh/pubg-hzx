import 'package:get/get.dart';

import 'package:huazhixia/widgets/widgets.dart';

//修改功能的弹窗封装
class UseDialog {
  ///修改画质弹窗
  static void usePqDialog({
    required String filePath,
    String title = '温馨提示',
    String subTitle = '确定要修改此画质？如出现问题请前往首页重置画质！',
    String buttonTitle = '修改',
  }) {
    DialogStyle.mainDialog(
      title: title,
      subTitle: subTitle,
      okButtonTitle: buttonTitle,
      onCanceButton: () => Get.back(),
      onOkButton: () {},
    );
  }

  ///解锁画质帧率弹窗
  static void useDlDialog(String title) {
    DialogStyle.mainDialog(
      title: title,
      subTitle: '确定要解锁画质+120帧？如出现问题请前往首页重置画质！',
      okButtonTitle: '解锁',
      onCanceButton: () => Get.back(),
      onOkButton: () {},
    );
  }

  ///解锁超高音质弹窗
  static void useTqDialog(String title) {
    DialogStyle.mainDialog(
      title: title,
      subTitle: '确定要解锁超高音质？如出现问题请前往首页重置音质！',
      okButtonTitle: '解锁',
      onCanceButton: () => Get.back(),
      onOkButton: () {},
    );
  }
}
