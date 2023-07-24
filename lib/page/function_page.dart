import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:remixicon_updated/remixicon_updated.dart';
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
            infoBar(),
            diversifyBar(),
            modelBar(),
            moreBar(),
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

  Widget infoBar() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(children: [
              const Icon(Remix.pie_chart_2_line),
              const SizedBox(width: 10),
              Expanded(
                child: Text('画质总数：${FileConfig.allPqFile.length}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(fontSize: 15)),
              ),
            ]),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10)),
            child: Row(children: [
              const Icon(Remix.magic_line),
              const SizedBox(width: 10),
              Expanded(
                child: Text('超广角总数：${FunctionConfig.wideAngle.length}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(fontSize: 15)),
              ),
            ]),
          ),
        ),
      ]),
    );
  }

  Widget diversifyBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: List.generate(FunctionConfig.diversifyData.length, (index) {
          return OnInk(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            onTap: () => onDiversify(index),
            margin: EdgeInsets.only(
                left: 10,
                right: 10,
                bottom:
                    index == FunctionConfig.diversifyData.length - 1 ? 0 : 10),
            padding: const EdgeInsets.all(15),
            child: Row(children: [
              Hero(
                tag: 'diversify$index',
                child:
                    Image.asset(AssetsConfig.diversify, height: 45, width: 45),
              ),
              const SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            ]),
          );
        }),
      ),
    );
  }

  Widget modelBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: List.generate(FunctionConfig.modelData.length, (index) {
          return OnInk(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            onTap: () => onModel(index),
            margin: EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: index == FunctionConfig.modelData.length - 1 ? 0 : 10),
            padding: const EdgeInsets.all(15),
            child: Row(children: [
              Hero(
                tag: 'model$index',
                child: Image.asset(AssetsConfig.model, height: 45, width: 45),
              ),
              const SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            ]),
          );
        }),
      ),
    );
  }

  Widget moreBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: List.generate(FunctionConfig.moreData.length, (index) {
          return OnInk(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            onTap: () => onMore(index),
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            padding: const EdgeInsets.all(15),
            child: Row(children: [
              Hero(
                tag: 'more$index',
                child: Image.asset(
                    index == 0
                        ? AssetsConfig.modelImitate
                        : index == 1
                            ? AssetsConfig.wideAngle
                            : AssetsConfig.random,
                    height: 45,
                    width: 45),
              ),
              const SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(FunctionConfig.moreData[index]['title'],
                    style: const TextStyle(fontSize: 15)),
                Text(FunctionConfig.moreData[index]['subtitle'],
                    style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontStyle: FontStyle.italic)),
              ]),
              const Spacer(),
              index == 2
                  ? Image.asset(AssetsConfig.arrow, height: 20, width: 20)
                  : const Icon(Remix.arrow_right_s_line,
                      color: Colors.grey, size: 20),
            ]),
          );
        }),
      ),
    );
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

  void onMore(int index) async {
    switch (index) {
      case 0:
        Get.toNamed('/modelimitate');
        break;
      case 1:
        Get.toNamed('/wideangle');
        break;
      case 2:
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
    }
  }
}
