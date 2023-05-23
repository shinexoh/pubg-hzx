import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:get/get.dart';

import 'package:huazhixia/controller/controller.dart';
import 'package:huazhixia/util/util.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final mainController = Get.put(MainController());

  @override
  void initState() {
    super.initState();
    mainController.checkTask();
    mainController.checkStorage();
    mainController.checkDirectory();
    mainController.checkUpdate();
    mainController.checkPause();

    //设置Dark状态栏样式
    AppUtil.setStatusBarDark();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: mainController.pageIndex.value,
            items: mainController.items,
            selectedItemColor: Colors.blue,
            type: BottomNavigationBarType.fixed,
            onTap: (index) => mainController.onTap(index),
          ),
          body: IndexedStack(
            index: mainController.pageIndex.value,
            children: mainController.pageBody,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: on,
            backgroundColor: Colors.blue,
            child: const Icon(Remix.tools_line, color: Colors.white),
          ),
        ));
  }

  void on() {
    final appController = Get.find<AppController>();
    prints('存储权限:${appController.storageState}');
    prints('目录权限:${appController.directoryState}');
    prints('任务状态:${appController.taskState}');
    prints('安卓版本:${appController.androidVersion}');
  }
}
