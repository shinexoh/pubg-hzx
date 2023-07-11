import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:remixicon/remixicon.dart';
import 'package:get/get.dart';

import 'package:huazhixia/util/util.dart';
import 'package:huazhixia/config/config.dart';
import 'package:huazhixia/widgets/widgets.dart';

class FunctionPage extends StatelessWidget {
  const FunctionPage({super.key});

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
            randomBar(),
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
            style: TextStyle(
                fontSize: 22, letterSpacing: 1, fontWeight: FontWeight.bold)),
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
                bottom:
                    index == FunctionConfig.diversifyData.length - 1 ? 0 : 10,
              ),
              padding: const EdgeInsets.all(15),
              onTap: () => onDiversify(index),
              child: Row(
                children: [
                  Hero(
                      tag: 'diversify$index',
                      child: Image.asset(AssetsConfig.diversify,
                          height: 45, width: 45)),
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
                bottom: index == FunctionConfig.modelData.length - 1 ? 0 : 10,
              ),
              padding: const EdgeInsets.all(15),
              onTap: () => onModel(index),
              child: Row(
                children: [
                  Hero(
                      tag: 'model$index',
                      child: Image.asset(AssetsConfig.model,
                          height: 45, width: 45)),
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

  Widget randomBar() {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: List.generate(FunctionConfig.randomData.length, (index) {
            return OnInk(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              margin: EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: index == FunctionConfig.randomData.length - 1 ? 0 : 10,
              ),
              padding: const EdgeInsets.all(15),
              onTap: () => onRandom(index),
              child: Row(
                children: [
                  Image.asset(AssetsConfig.random, height: 45, width: 45),
                  const SizedBox(width: 10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(FunctionConfig.randomData[index]['title'],
                            style: const TextStyle(fontSize: 15)),
                        Text(FunctionConfig.randomData[index]['subtitle'],
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontStyle: FontStyle.italic)),
                      ]),
                  const Spacer(),
                  index == 0
                      ? Image.asset(AssetsConfig.arrow, height: 20, width: 20)
                      : const Icon(Remix.arrow_right_s_line,
                          color: Colors.grey, size: 20),
                ],
              ),
            );
          }),
        ));
  }

  void onDiversify(int index) {
    index == 0
        ? Get.toNamed('/exclusive', arguments: 'diversify$index')
        : Get.toNamed('/highopti', arguments: 'diversify$index');
  }

  void onModel(int index) {
    switch (index) {
      case 0:
        Get.toNamed('/lowmodel', arguments: 'model$index');
        break;
      case 1:
        Get.toNamed('/mediummodel', arguments: 'model$index');
        break;
      case 2:
        Get.toNamed('/highmodel', arguments: 'model$index');
        break;
    }
  }

  void onRandom(int index) async {
    switch (index) {
      case 0:
        if (await AppUtil.checkDlFile()) {
          AppDialog.dlRestoreDialog();
        } else {
          DialogStyle.mainDialog(
            title: '随机修改',
            subTitle: '确定要随机修改一项画质？如出现问题请前往首页重置画质！',
            okButtonTitle: '修改',
            onOkButton: () {
              Get.back();
              AppUtil.randomUsePq(callBack: () => showToast('修改成功，请重启游戏'));
            },
          );
        }
        break;
      case 1:
        Get.toNamed('/modelimitate');
        break;
    }
  }
}
