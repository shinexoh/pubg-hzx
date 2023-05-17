import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:device_apps/device_apps.dart';
import 'package:oktoast/oktoast.dart';

import 'package:huazhixia/config/config.dart';

class HomeController extends GetxController {
  //分享
  void onShare() => Share.share(AppConfig.shareContent);

  //启动游戏
  void onOpenGame() async {
    if (!await DeviceApps.openApp('com.tencent.tmgp.pubgmhd')) {
      showToast('启动失败，请手动启动');
    }
  }

  //切换游戏版本
  void onGameVer() => showToast('暂不支持');
}
