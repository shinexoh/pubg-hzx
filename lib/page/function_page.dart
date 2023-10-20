import 'package:flutter/material.dart';
import 'package:remixicon_updated/remixicon_updated.dart';

import '../app/app.dart';
import '../utils/utils.dart';
import '../config/config.dart';
import '../widgets/widgets.dart';

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
                fontSize: 22, letterSpacing: 0.8, fontWeight: FontWeight.bold)),
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
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(FunctionConfig.diversifyData[index]['title'],
                          style: const TextStyle(fontSize: 15)),
                      Text(FunctionConfig.diversifyData[index]['subtitle'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                            letterSpacing: 0.8,
                          )),
                    ]),
              ),
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
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(FunctionConfig.modelData[index]['title'],
                          style: const TextStyle(fontSize: 15)),
                      Text(FunctionConfig.modelData[index]['subtitle'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                            letterSpacing: 0.8,
                          )),
                    ]),
              ),
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
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(FunctionConfig.moreData[index]['title'],
                          style: const TextStyle(fontSize: 15)),
                      Text(FunctionConfig.moreData[index]['subtitle'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                            letterSpacing: 0.8,
                          )),
                    ]),
              ),
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
    index == 0
        ? navigatorKey.currentState!
            .pushNamed('/exclusive', arguments: 'diversify$index')
        : navigatorKey.currentState!
            .pushNamed('/highopti', arguments: 'diversify$index');
  }

  void onModel(int index) {
    switch (index) {
      case 0:
        navigatorKey.currentState!
            .pushNamed('/lowmodel', arguments: 'model$index');
        break;
      case 1:
        navigatorKey.currentState!
            .pushNamed('/mediummodel', arguments: 'model$index');
        break;
      case 2:
        navigatorKey.currentState!
            .pushNamed('/highmodel', arguments: 'model$index');
        break;
    }
  }

  void onMore(int index) async {
    switch (index) {
      case 0:
        navigatorKey.currentState!
            .pushNamed('/modelimitate', arguments: 'more$index');
        break;
      case 1:
        navigatorKey.currentState!
            .pushNamed('/wideangle', arguments: 'more$index');
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
              navigatorKey.currentState!.pop();
              AppUtil.randomUsePq(callBack: () => showSnackBar('修改成功，请重启游戏'));
            },
          );
        }
        break;
    }
  }
}
