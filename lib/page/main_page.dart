import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
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

    mainController.checkTask();
    mainController.checkStorage();
    mainController.checkDirectory();
    mainController.checkUpdate();
    mainController.statistics();
    // mainController.checkPause();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          // bottomNavigationBar: BottomNavigationBar(
          //   backgroundColor: Colors.white,
          //   currentIndex: mainController.pageIndex.value,
          //   items: mainController.items,
          //   selectedItemColor: Colors.blue,
          //   type: BottomNavigationBarType.fixed,
          //   onTap: (index) => mainController.onTap(index),
          // ),
          bottomNavigationBar: DecoratedBox(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(color: Colors.grey.shade200, blurRadius: 10)
            ]),
            child: SalomonBottomBar(
              backgroundColor: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
              currentIndex: mainController.pageIndex.value,
              onTap: (index) => mainController.onTap(index),
              items: mainController.items,
            ),
          ),
          body: IndexedStack(
            index: mainController.pageIndex.value,
            children: mainController.pageBody,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            shape: const CircleBorder(),
            onPressed: () => Get.toNamed('/cardpass'),
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ));
  }
}
