import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:get/get.dart';

import '../page/home_page.dart';
import '../page/fun_page.dart';
import '../page/device_page.dart';
import '../page/user_page.dart';

class MainController extends GetxController {
  final pageIndex = 0.obs;

  final List<Widget> pageBody = [
    const HomePage(),
    const FunPage(),
    const DevicePage(),
    const UserPage(),
  ];

  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
        label: '首页',
        icon: Icon(Remix.home_5_line),
        activeIcon: Icon(Remix.home_5_fill)),
    BottomNavigationBarItem(
        label: '功能',
        icon: Icon(Remix.compass_3_line),
        activeIcon: Icon(Remix.compass_3_fill)),
    BottomNavigationBarItem(
        label: '设备',
        icon: Icon(Remix.dvd_line),
        activeIcon: Icon(Remix.dvd_fill)),
    BottomNavigationBarItem(
        label: '我的',
        icon: Icon(Remix.user_smile_line),
        activeIcon: Icon(Remix.user_smile_fill)),
  ];

  void onTap(int index) {
    pageIndex.value = index;
  }

  void openGame() {}
}
