import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:huazhixia/controller/controller.dart';

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
    // mainController.checkUpdate();
    // mainController.checkPause();
    mainController.checkTask();
    mainController.checkStorage();
    mainController.checkDirectory();
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
        ));
  }
}
