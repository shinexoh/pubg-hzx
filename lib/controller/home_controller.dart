import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:device_apps/device_apps.dart';
import 'package:oktoast/oktoast.dart';

import 'package:huazhixia/controller/controller.dart';
import 'package:huazhixia/util/util.dart';
import 'package:huazhixia/config/config.dart';
import 'package:huazhixia/widgets/widgets.dart';

class HomeController extends GetxController {
  final _appController = Get.find<AppController>();

  //分享
  void onShare() => Share.share(AppConfig.shareContent);

  //启动游戏
  void onOpenGame() async {
    if (!await DeviceApps.openApp('com.tencent.tmgp.pubgmhd')) {
      showToast('启动失败，请手动启动');
    }
  }

  //切换游戏版本
  void onGameVer() {
    DialogStyle.mainDialog(
      subTitle: '暂不支持切换游戏版本',
      showCanceButton: false,
      onOkButton: () => Get.back(),
    );
  }

  //快捷修改
  void onQuick(int index) {
    UseDialog.usePqDialog(
      filePath: FileConfig.quickFile[index],
      title: FunctionConfig.quickData[index],
    );
  }

  //其他功能
  void onOther(int index) {
    switch (index) {
      case 0:
        UseDialog.useDlDialog(FunctionConfig.otherData[index]);
        break;
      case 1:
        UseDialog.useTqDialog(FunctionConfig.otherData[index]);
        break;
      case 2:
        if (SpUtil.containsKey(AppConfig.taskKey)) {
          Clipboard.setData(const ClipboardData(text: '3044-2867-9345-7278'));
          showToast('复制成功');
        } else {
          AppDialog.taskDialog();
        }
        break;
    }
  }

  //重置功能
  void onRestore(int index) async {
    switch (index) {
      case 0:
        if (_appController.androidVersion.value <= 10) {
          await UseFor10.restorePq() && await UseFor10.restoreDl()
              ? showToast('重置画质成功，重启游戏后生效')
              : showToast('重置画质失败，请检查权限是否授予');
        } else if (await SharedStorage.checkUriGrant(UriConfig.mainUri)) {
          await UseFor11.restorePq() && await UseFor11.restoreDl()
              ? showToast('重置画质成功，重启游戏后生效')
              : showToast('重置画质失败，请检查权限是否授予');
        } else {
          AppDialog.gameDirectoryDialog();
        }
        break;
      case 1:
        if (_appController.androidVersion.value <= 10) {
          await UseFor10.restoreTq()
              ? showToast('重置音质成功，重启游戏后生效')
              : showToast('重置音质失败，请检查权限是否授予');
        } else if (await SharedStorage.checkUriGrant(UriConfig.mainUri)) {
          await UseFor11.restoreTq()
              ? showToast('重置音质成功，重启游戏后生效')
              : showToast('重置音质失败，请检查权限是否授予');
        } else {
          AppDialog.gameDirectoryDialog();
        }
        break;
    }
  }
}
