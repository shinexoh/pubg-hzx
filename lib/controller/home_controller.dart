import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:device_apps/device_apps.dart';
import 'package:oktoast/oktoast.dart';
import 'package:get/get.dart';

import 'package:huazhixia/controller/controller.dart';
import 'package:huazhixia/util/util.dart';
import 'package:huazhixia/config/config.dart';
import 'package:huazhixia/widgets/widgets.dart';

class HomeController extends GetxController {
  final _appController = Get.find<AppController>();

  final title = ''.obs;
  final subTitle = ''.obs;

  //初始化标题与副标题
  void initTitle() {
    final nowDate = DateTime.now().hour;

    if (nowDate >= 6 && nowDate < 11) {
      title.value = '早上好';
      subTitle.value = '一日之计在于晨，一年之计在于春。';
    } else if (nowDate >= 11 && nowDate < 13) {
      title.value = '中午好';
      subTitle.value = '享受中午的阳光，感受生命的活力！';
    } else if (nowDate >= 13 && nowDate < 19) {
      title.value = '下午好';
      subTitle.value = '下午时分，加强学习，充实自己！';
    } else if (nowDate >= 19 && nowDate < 24) {
      title.value = '晚上好';
      subTitle.value = '每个宁静的夜晚都是思考的好时机。';
    } else {
      title.value = '凌晨好';
      subTitle.value = '夜深了，放下手机，早点休息。';
    }
  }

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
  void onQuick(int index) async {
    if (await AppUtil.checkDlFile()) {
      AppDialog.dlRestoreDialog();
    } else {
      UseDialog.usePqDialog(
        filePath: FileConfig.quickFile[index],
        title: FunctionConfig.quickData[index],
      );
    }
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
          DialogStyle.mainDialog(
            subTitle: '灵敏度分享码复制成功！请进入游戏大厅->设置->灵敏度设置->云端方案管理->搜索方案->粘贴分享码使用即可！',
            showCanceButton: false,
            onOkButton: () => Get.back(),
          );
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
        if (_appController.sdkVersion.value <= 29) {
          await UseFor10.restorePq() && await UseFor10.restoreDl()
              ? AppDialog.restoreDialog()
              : showToast('重置画质失败，请检查权限是否授予');
        } else if (await SharedStorage.checkUriGrant(UriConfig.mainUri)) {
          await UseFor11.restorePq() && await UseFor11.restoreDl()
              ? AppDialog.restoreDialog()
              : showToast('重置画质失败，请检查权限是否授予');
        } else {
          AppDialog.directoryDialog();
        }
        break;
      case 1:
        if (_appController.sdkVersion.value <= 29) {
          await UseFor10.restoreTq()
              ? showToast('重置音质成功')
              : showToast('重置音质失败，请检查权限是否授予');
        } else if (await SharedStorage.checkUriGrant(UriConfig.mainUri)) {
          await UseFor11.restoreTq()
              ? showToast('重置音质成功')
              : showToast('重置音质失败，请检查权限是否授予');
        } else {
          AppDialog.directoryDialog();
        }
        break;
      case 2:
        if (_appController.sdkVersion.value <= 29) {
          UseFor10.restorePq();
          UseFor10.restoreDl();
          UseFor10.restoreTq();

          AppDialog.restoreDialog();
        } else if (await SharedStorage.checkUriGrant(UriConfig.mainUri)) {
          UseFor11.restorePq();
          UseFor11.restoreDl();
          UseFor11.restoreTq();

          AppDialog.restoreDialog();
        } else {
          AppDialog.directoryDialog();
        }
        break;
    }
  }
}
