import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:get/get.dart';

import 'package:huazhixia/config/config.dart';
import 'package:huazhixia/widgets/widgets.dart';

class FunPage extends StatelessWidget {
  const FunPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topAppBar(),
            diversifyBar(),
            modelBar(),
          ],
        ),
      ),
    );
  }

  Widget topAppBar() {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 20),
        child: Text('功能',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget diversifyBar() {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: List.generate(FunctionConfig.diversifyData.length, (index) {
            return OnInk(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              margin: EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: index == 0 ? 10 : 0,
              ),
              padding: const EdgeInsets.all(15),
              onTap: () => onDiversify(index),
              child: Row(
                children: [
                  FadeInImage(
                      height: 45,
                      width: 45,
                      fadeInDuration: const Duration(milliseconds: 120),
                      placeholder: MemoryImage(kTransparentImage),
                      image: const AssetImage(AssetsConfig.fun4)),
                  const SizedBox(width: 10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(FunctionConfig.diversifyData[index]['title'],
                            style: const TextStyle(fontSize: 15)),
                        Text(FunctionConfig.diversifyData[index]['subtitle'],
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontStyle: FontStyle.italic)),
                      ]),
                  const Spacer(),
                  const Icon(Remix.arrow_right_s_line,
                      color: Colors.grey, size: 20),
                ],
              ),
            );
          }),
        ));
  }

  Widget modelBar() {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: List.generate(FunctionConfig.modelData.length, (index) {
            return OnInk(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              margin: EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: index <= 1 ? 10 : 0,
              ),
              padding: const EdgeInsets.all(15),
              onTap: () => onModel(index),
              child: Row(
                children: [
                  FadeInImage(
                      height: 45,
                      width: 45,
                      fadeInDuration: const Duration(milliseconds: 120),
                      placeholder: MemoryImage(kTransparentImage),
                      image: const AssetImage(AssetsConfig.fun5)),
                  const SizedBox(width: 10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(FunctionConfig.modelData[index]['title'],
                            style: const TextStyle(fontSize: 15)),
                        Text(FunctionConfig.modelData[index]['subtitle'],
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontStyle: FontStyle.italic)),
                      ]),
                  const Spacer(),
                  const Icon(Remix.arrow_right_s_line,
                      color: Colors.grey, size: 20),
                ],
              ),
            );
          }),
        ));
  }

  void onDiversify(int index) {
    index == 0 ? Get.toNamed('/exclusive') : Get.toNamed('/highopti');
  }

  void onModel(int index) {
    switch (index) {
      case 0:
        Get.toNamed('/lowmodel');
        break;
      case 1:
        Get.toNamed('/mediummodel');
        break;
      case 2:
        Get.toNamed('/highmodel');
        break;
    }
  }
}
