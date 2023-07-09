import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:remixicon/remixicon.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:get/get.dart';

import 'package:huazhixia/util/util.dart';
import 'package:huazhixia/config/config.dart';
import 'package:huazhixia/widgets/widgets.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topAppBar(),
            optionBar(),
          ],
        ),
      ),
    );
  }

  Widget topAppBar() {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 20),
        child: Text('我的',
            style: TextStyle(
                fontSize: 22, letterSpacing: 1, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget optionBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Column(
        children: [
          OnInk(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            padding: const EdgeInsets.all(15),
            onTap: onUserInfo,
            child: Row(children: [
              Image.asset(AssetsConfig.vip, height: 28, width: 28),
              const SizedBox(width: 15),
              const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('画质侠用户', style: TextStyle(fontSize: 16)),
                    // Text('当前状态：普通用户', style: TextStyle(color: Colors.grey)),
                  ]),
              const Spacer(),
              const Icon(Remix.arrow_right_s_line, color: Colors.grey, size: 20)
            ]),
          ),
          const SizedBox(height: 15),
          // OnInk(
          //     color: Colors.white,
          //     borderRadius: const BorderRadius.only(
          //         topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          //     padding: const EdgeInsets.all(15),
          //     onTap: onTheme,
          //     child: Row(children: [
          //       Image.asset(AssetsConfig.theme, height: 28, width: 28),
          //       const SizedBox(width: 15),
          //       const Text('主题风格', style: TextStyle(fontSize: 16)),
          //       const Spacer(),
          //       const Text('浅色模式', style: TextStyle(color: Colors.grey)),
          //     ])),
          OnInk(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              padding: const EdgeInsets.all(15),
              onTap: onFont,
              child: Row(children: [
                Image.asset(AssetsConfig.font, height: 28, width: 28),
                const SizedBox(width: 15),
                const Text('切换字体', style: TextStyle(fontSize: 16)),
                const Spacer(),
                const Text('系统默认', style: TextStyle(color: Colors.grey)),
              ])),
          const SizedBox(height: 15),
          OnInk(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              padding: const EdgeInsets.all(15),
              onTap: onUseHelp,
              child: Row(children: [
                Image.asset(AssetsConfig.useHelp, height: 30, width: 30),
                const SizedBox(width: 15),
                const Text('使用帮助', style: TextStyle(fontSize: 16)),
                const Spacer(),
                const Icon(Remix.arrow_right_s_line,
                    color: Colors.grey, size: 20),
              ])),
          OnInk(
              color: Colors.white,
              padding: const EdgeInsets.all(15),
              onTap: onDownload,
              child: Row(children: [
                Image.asset(AssetsConfig.download, height: 30, width: 30),
                const SizedBox(width: 15),
                const Text('永久下载地址', style: TextStyle(fontSize: 16)),
                const Spacer(),
                const Icon(Remix.arrow_right_s_line,
                    color: Colors.grey, size: 20),
              ])),
          OnInk(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              padding: const EdgeInsets.all(15),
              onTap: onQQ,
              child: Row(children: [
                Image.asset(AssetsConfig.contactAuthor, height: 30, width: 30),
                const SizedBox(width: 15),
                const Text('联系作者', style: TextStyle(fontSize: 16)),
                const Spacer(),
                const Icon(Remix.arrow_right_s_line,
                    color: Colors.grey, size: 20),
              ])),
          const SizedBox(height: 15),
          OnInk(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              padding: const EdgeInsets.all(15),
              onTap: onShare,
              child: Row(children: [
                Image.asset(AssetsConfig.share, height: 26, width: 26),
                const SizedBox(width: 15),
                const Text('分享应用', style: TextStyle(fontSize: 16)),
                const Spacer(),
                const Icon(Remix.arrow_right_s_line,
                    color: Colors.grey, size: 20),
              ])),
          OnInk(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              padding: const EdgeInsets.all(15),
              onTap: onCheckUpdate,
              child: Row(children: [
                Image.asset(AssetsConfig.checkUpdate, height: 28, width: 28),
                const SizedBox(width: 15),
                const Text('检查更新', style: TextStyle(fontSize: 16)),
                const Spacer(),
                const Icon(Remix.arrow_right_s_line,
                    color: Colors.grey, size: 20),
              ])),
          const SizedBox(height: 15),
          OnInk(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              padding: const EdgeInsets.all(15),
              onTap: onAbout,
              child: Row(children: [
                Image.asset(AssetsConfig.about, height: 28, width: 28),
                const SizedBox(width: 15),
                const Text('关于画质侠', style: TextStyle(fontSize: 16)),
                const Spacer(),
                const Icon(Remix.arrow_right_s_line,
                    color: Colors.grey, size: 20),
              ])),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  // Widget vipBar() {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
  //     child: SizedBox(
  //       width: double.infinity,
  //       child: Material(
  //         elevation: 4,
  //         color: const Color.fromRGBO(26, 26, 26, 0.9),
  //         borderRadius: BorderRadius.circular(15),
  //         child: Padding(
  //           padding: const EdgeInsets.all(15),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: const [
  //               Text(
  //                 'VIP',
  //                 style: TextStyle(
  //                     fontSize: 25,
  //                     color: Color.fromRGBO(252, 162, 86, 1),
  //                     fontWeight: FontWeight.bold,
  //                     height: 1.2,
  //                     letterSpacing: 5),
  //               ),
  //               Text(
  //                 '激活画质侠享受更多画质修改功能',
  //                 style: TextStyle(
  //                     fontSize: 13,
  //                     color: Color.fromRGBO(252, 162, 86, 1),
  //                     letterSpacing: 1),
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  void onUserInfo() {
    Get.dialog(Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FadeInImage(
            height: 250,
            placeholder: MemoryImage(kTransparentImage),
            image: const NetworkImage('http://shinex.top/tpss.jpg')),
      ),
    ));
  }

  void onTheme() {
    DialogStyle.mainDialog(
      subTitle: '暂不支持切换主题',
      showCanceButton: false,
      onOkButton: () => Get.back(),
    );
  }

  void onFont() {
    DialogStyle.mainDialog(
      subTitle: '暂不支持切换字体',
      showCanceButton: false,
      onOkButton: () => Get.back(),
    );
  }

  //使用帮助
  void onUseHelp() => Get.toNamed('/help');

  //下载地址
  void onDownload() => AppUtil.openUrl(AppConfig.appDownload);

  //联系作者
  void onQQ() => AppUtil.openQQ(653143454);

  //分享应用
  void onShare() => Share.share(AppConfig.shareContent);

  //检查更新
  void onCheckUpdate() {
    DialogStyle.mainDialog(
      subTitle: '画质侠已是最新版本！',
      showCanceButton: false,
      onOkButton: () => Get.back(),
    );
  }

  //关于画质侠
  void onAbout() {
    DialogStyle.mainDialog(
        title: '关于画质侠',
        subTitle: '画质侠是专为和平精英玩家量身打造的画质助手。我们致力于提供简洁高效的服务，以协助玩家获得更加优质的游戏体验。',
        okButtonTitle: '开源许可',
        onOkButton: () {
          Get.back();
          showLicensePage(
            context: Get.context!,
            applicationIcon:
                Image.asset(AssetsConfig.appIcon, height: 50, width: 50),
            applicationName: '画质侠',
            applicationLegalese:
                '画质侠是专为和平精英玩家量身打造的画质修改器。我们致力于提供简洁高效的服务，以协助玩家获得更加优质的游戏体验。',
            applicationVersion: AppConfig.appVersion,
          );
        });
  }
}
