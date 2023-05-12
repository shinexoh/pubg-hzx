import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

class HomeController extends GetxController {
  void onShare() {}

  void onOpenGame() => showToast('启动游戏');

  void onGameVer() => showToast('暂不支持');
}
