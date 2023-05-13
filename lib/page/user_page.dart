import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:get/get.dart';

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
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
              onLongPress: onUserInfo,
              child: Row(children: [
                Image.asset(AssetsConfig.vip, height: 28, width: 28),
                const SizedBox(width: 15),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('画质侠用户', style: TextStyle(fontSize: 16)),
                      // Text('当前状态：普通用户',
                      //     style: TextStyle(fontSize: 13, color: Colors.grey)),
                    ]),
                const Spacer(),
                const Icon(Remix.arrow_right_s_line,
                    color: Colors.grey, size: 20),
              ])),
          // const SizedBox(height: 15),
          // OnInk(
          //     color: Colors.white,
          //     borderRadius: const BorderRadius.only(
          //         topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          //     padding: const EdgeInsets.all(15),
          //     onTap: () {},
          //     child: Row(children: [
          //       Image.asset(AssetsConfig.theme, height: 28, width: 28),
          //       const SizedBox(width: 15),
          //       const Text('主题风格', style: TextStyle(fontSize: 16)),
          //       const Spacer(),
          //       const Text('浅色主题',
          //           style: TextStyle(fontSize: 13, color: Colors.grey)),
          //     ])),
          // OnInk(
          //     color: Colors.white,
          //     borderRadius: const BorderRadius.only(
          //         bottomLeft: Radius.circular(10),
          //         bottomRight: Radius.circular(10)),
          //     padding: const EdgeInsets.all(15),
          //     onTap: () {},
          //     child: Row(children: [
          //       Image.asset(AssetsConfig.language, height: 28, width: 28),
          //       const SizedBox(width: 15),
          //       const Text('切换语言', style: TextStyle(fontSize: 16)),
          //       const Spacer(),
          //       const Text('简体中文',
          //           style: TextStyle(fontSize: 13, color: Colors.grey)),
          //     ])),
          const SizedBox(height: 15),
          OnInk(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              padding: const EdgeInsets.all(15),
              onTap: onUseHelp,
              child: Row(children: [
                Image.asset(AssetsConfig.useHelp, height: 28, width: 28),
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
                Image.asset(AssetsConfig.download, height: 28, width: 28),
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
                Image.asset(AssetsConfig.contactAuthor, height: 28, width: 28),
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
                Image.asset(AssetsConfig.share, height: 25, width: 25),
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
                const Text('关于应用', style: TextStyle(fontSize: 16)),
                const Spacer(),
                const Icon(Remix.arrow_right_s_line,
                    color: Colors.grey, size: 20),
              ])),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  void onUserInfo() {}

  void onTheme() {}

  void onLanguage() {}

  void onUseHelp() {}

  void onDownload() {}

  void onQQ() {}

  void onShare() {}

  void onCheckUpdate() {}

  void onAbout() => showLicensePage(
        context: Get.context!,
        applicationIcon: const FlutterLogo(size: 50),
        applicationName: '画质侠',
        applicationVersion: AppConfig.appVersion,
      );
}
