import 'package:flutter/material.dart';
import 'package:huazhixia/page/main/main_logic.dart';
import 'package:remixicon_updated/remixicon_updated.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:get/get.dart';

import '../device_page.dart';
import '../function_page.dart';
import '../home/home_page.dart';
import '../user_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with MainLogic {
  //界面索引
  var pageIndex = 0.obs;

  //界面列表
  List<Widget> get pageBody =>
      const [HomePage(), FunctionPage(), DevicePage(), UserPage()];

  //底部导航Item
  List<SalomonBottomBarItem> get items => [
        SalomonBottomBarItem(
            icon: const Icon(Remix.home_5_line),
            activeIcon: const Icon(Remix.home_5_fill),
            selectedColor: Colors.blue,
            unselectedColor: Colors.black54,
            title: const Text('首页')),
        SalomonBottomBarItem(
            icon: const Icon(Remix.compass_3_line),
            activeIcon: const Icon(Remix.compass_3_fill),
            selectedColor: Colors.pink,
            unselectedColor: Colors.black54,
            title: const Text('功能')),
        SalomonBottomBarItem(
          icon: const Icon(Remix.dvd_line),
          activeIcon: const Icon(Remix.dvd_fill),
          selectedColor: Colors.green,
          unselectedColor: Colors.black54,
          title: const Text('设备'),
        ),
        SalomonBottomBarItem(
          icon: const Icon(Remix.user_smile_line),
          activeIcon: const Icon(Remix.user_smile_fill),
          selectedColor: Colors.orange,
          unselectedColor: Colors.black54,
          title: const Text('我的'),
        ),
      ];

  //底部导航切换界面
  void onTap(int index) => pageIndex.value = index;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          bottomNavigationBar: DecoratedBox(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(color: Colors.grey.shade200, blurRadius: 10)
            ]),
            child: SalomonBottomBar(
              backgroundColor: Colors.white,
              curve: Curves.bounceOut,
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
              currentIndex: pageIndex.value,
              onTap: (index) => onTap(index),
              items: items,
            ),
          ),
          body: IndexedStack(index: pageIndex.value, children: pageBody),
        ));
  }
}
