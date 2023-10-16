import 'package:flutter/material.dart';
import 'package:remixicon_updated/remixicon_updated.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../device_page.dart';
import '../function_page.dart';
import '../home/home_page.dart';
import '../user_page.dart';

import 'main_logic.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with MainLogic {
  // 界面索引
  int _pageIndex = 0;

  // 界面列表
  List<Widget> get _pageBody =>
      const [HomePage(), FunctionPage(), DevicePage(), UserPage()];

  // 底部导航Item
  List<SalomonBottomBarItem> get _items => [
        SalomonBottomBarItem(
          icon: const Icon(Remix.home_5_line),
          activeIcon: const Icon(Remix.home_5_fill),
          selectedColor: Colors.blue,
          unselectedColor: Colors.black54,
          title: const Text('首页'),
        ),
        SalomonBottomBarItem(
          icon: const Icon(Remix.compass_3_line),
          activeIcon: const Icon(Remix.compass_3_fill),
          selectedColor: Colors.pink,
          unselectedColor: Colors.black54,
          title: const Text('功能'),
        ),
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

  @override
  void initState() {
    super.initState();

    Future(() {
      checkTask();
      checkStorage();
      checkDirectory();
    });

    checkUpdate();
    showAppTips();
    statistics();
    restoreFile();
    printInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.grey.shade200, blurRadius: 10)
        ]),
        child: SalomonBottomBar(
          currentIndex: _pageIndex,
          backgroundColor: Colors.white,
          curve: Curves.bounceOut,
          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
          onTap: (index) => onTap(index),
          items: _items,
        ),
      ),
      body: IndexedStack(index: _pageIndex, children: _pageBody),
    );
  }

  // 底部导航切换界面
  void onTap(int index) => setState(() => _pageIndex = index);
}
