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
            Material(
                color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [topAppBar(), userInfoBar()])),
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

  Widget userInfoBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: GestureDetector(
        onLongPress: onUserInfo,
        child: ListTile(
          leading: Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 10)
                  ]),
              child: Image.asset(AssetsConfig.lightning)),
          title:
              const Text('画质侠用户', style: TextStyle(fontSize: 18, height: 1.0)),
          subtitle: const Text('大吉大利，今晚吃鸡！'),
        ),
      ),
    );
  }

  Widget optionBar() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 15, bottom: 15),
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 10)]),
      child: Column(
        children: [
          OnInk(
            color: Colors.white,
            padding: const EdgeInsets.all(18),
            onTap: onUseHelp,
            child: Row(children: [
              Image.asset(AssetsConfig.useHelp, height: 25, width: 25),
              const SizedBox(width: 15),
              const Text('使用帮助', style: TextStyle(fontSize: 15)),
              const Spacer(),
              const Icon(Remix.arrow_right_s_line,
                  color: Colors.grey, size: 22),
            ]),
          ),
          OnInk(
            color: Colors.white,
            padding: const EdgeInsets.all(18),
            onTap: onQQ,
            child: Row(children: [
              Image.asset(AssetsConfig.contactAuthor, height: 25, width: 25),
              const SizedBox(width: 15),
              const Text('联系作者', style: TextStyle(fontSize: 15)),
              const Spacer(),
              const Icon(Remix.arrow_right_s_line,
                  color: Colors.grey, size: 22),
            ]),
          ),
          OnInk(
            color: Colors.white,
            padding: const EdgeInsets.all(18),
            onTap: onShareApp,
            child: Row(children: [
              Image.asset(AssetsConfig.share, height: 25, width: 25),
              const SizedBox(width: 15),
              const Text('分享应用', style: TextStyle(fontSize: 15)),
              const Spacer(),
              const Icon(Remix.arrow_right_s_line,
                  color: Colors.grey, size: 22),
            ]),
          ),
          OnInk(
            color: Colors.white,
            padding: const EdgeInsets.all(18),
            onTap: onCheckUpdate,
            child: Row(children: [
              Image.asset(AssetsConfig.checkUpdate, height: 25, width: 25),
              const SizedBox(width: 15),
              const Text('检查更新', style: TextStyle(fontSize: 15)),
              const Spacer(),
              const Icon(Remix.arrow_right_s_line,
                  color: Colors.grey, size: 22),
            ]),
          ),
          OnInk(
            color: Colors.white,
            padding: const EdgeInsets.all(18),
            onTap: onAbout,
            child: Row(children: [
              Image.asset(AssetsConfig.about, height: 25, width: 25),
              const SizedBox(width: 15),
              const Text('关于应用', style: TextStyle(fontSize: 15)),
              const Spacer(),
              const Icon(Remix.arrow_right_s_line,
                  color: Colors.grey, size: 22),
            ]),
          ),
        ],
      ),
    );
  }

  void onUserInfo() {}

  void onUseHelp() {}

  void onQQ() {}

  void onShareApp() {}

  void onCheckUpdate() {}

  void onAbout() => showLicensePage(
      context: Get.context!,
      applicationIcon: const FlutterLogo(size: 50),
      applicationName: '画质侠',
      applicationVersion: AppConfig.appVersion);
}
