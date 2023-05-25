import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

import 'package:huazhixia/controller/controller.dart';
import 'package:huazhixia/config/config.dart';
import 'package:huazhixia/widgets/widgets.dart';
import 'package:huazhixia/util/util.dart';

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
      onOkButton: () async {
        Get.back();
        final androidVersion = Get.find<AppController>().androidVersion.value;

        if (SpUtil.containsKey(AppConfig.taskKey)) {
          if (androidVersion <= 10) {
            await UseFor10.usePq(filePath)
                ? showToast('修改成功')
                : showToast('修改失败，请检查权限是否授予');
          } else if (await SharedStorage.checkUriGrant(UriConfig.mainUri)) {
            await UseFor11.usePq(filePath)
                ? showToast('修改成功')
                : showToast('修改失败，请检查权限是否授予');
          } else {
            AppDialog.gameDirectoryDialog();
          }
        } else {
          AppDialog.taskDialog();
        }
      },
    );
  }

  ///解锁画质帧率弹窗
  static void useDlDialog(String title) {
    DialogStyle.mainDialog(
      title: title,
      subTitle: '一旦解锁画质+120帧将会持续有效，期间修改其他画质功能会导致无效果，需要重置画质后即可修改其他画质功能！',
      okButtonTitle: '解锁',
      onOkButton: () async {
        Get.back();
        final androidVersion = Get.find<AppController>().androidVersion.value;

        if (SpUtil.containsKey(AppConfig.taskKey)) {
          if (androidVersion <= 10) {
            await UseFor10.useDl()
                ? showToast('解锁画质成功')
                : showToast('解锁画质失败，请检查权限是否授予');
          } else if (await SharedStorage.checkUriGrant(UriConfig.mainUri)) {
            await UseFor11.useDl()
                ? showToast('解锁画质成功')
                : showToast('解锁画质失败，请检查权限是否授予');
          } else {
            AppDialog.gameDirectoryDialog();
          }
        } else {
          AppDialog.taskDialog();
        }
      },
    );
  }

  ///解锁超高音质弹窗
  static void useTqDialog(String title) {
    DialogStyle.mainDialog(
      title: title,
      subTitle: '确定要解锁超高音质？如出现问题请前往首页重置音质！',
      okButtonTitle: '解锁',
      onOkButton: () async {
        Get.back();
        final androidVersion = Get.find<AppController>().androidVersion.value;

        if (SpUtil.containsKey(AppConfig.taskKey)) {
          if (androidVersion <= 10) {
            await UseFor10.useTq()
                ? showToast('解锁音质成功')
                : showToast('解锁音质失败，请检查权限是否授予');
          } else if (await SharedStorage.checkUriGrant(UriConfig.mainUri)) {
            await UseFor11.useTq()
                ? showToast('解锁音质成功')
                : showToast('解锁音质失败，请检查权限是否授予');
          } else {
            AppDialog.gameDirectoryDialog();
          }
        } else {
          AppDialog.taskDialog();
        }
      },
    );
  }
}
