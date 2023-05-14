import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:remixicon/remixicon.dart';
import 'package:get/get.dart';

import 'package:huazhixia/controller/controller.dart';
import 'package:huazhixia/config/config.dart';
import 'package:huazhixia/widgets/widgets.dart';
import 'package:huazhixia/util/util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    AppUtil.setStatusBarDark();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          topAppBar(),
          Expanded(
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gameVerBar(),
                textBar('快捷修改'),
                quickBar(),
                textBar('其他功能'),
                otherBar(),
                textBar('重置功能'),
                restoreBar(),
              ],
            )),
          ),
        ],
      ),
    );
  }

  Widget topAppBar() {
    return Material(
      color: Colors.white,
      elevation: 0.2,
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('画质侠', style: TextStyle(fontSize: 20)),
                  Text('PUBG Picture Quality',
                      style: TextStyle(color: Colors.grey))
                ]),
            Row(children: [
              IconButton(
                  onPressed: homeController.onShare,
                  icon: const Icon(Remix.share_line, color: Colors.black)),
              IconButton(
                  onPressed: homeController.onOpenGame,
                  icon: const Icon(Remix.rocket_line, color: Colors.black)),
            ]),
          ],
        ),
      )),
    );
  }

  Widget gameVerBar() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            FadeInImage(
                height: 48,
                width: 48,
                fadeInDuration: const Duration(milliseconds: 120),
                placeholder: MemoryImage(kTransparentImage),
                image: const AssetImage(AssetsConfig.gameIcon)),
            const SizedBox(width: 10),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('和平精英国服', style: TextStyle(fontSize: 15)),
                  Text('PUBG Mobile',
                      style: TextStyle(color: Colors.grey, fontSize: 12))
                ]),
          ]),
          OnInk(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            onTap: homeController.onGameVer,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade200)),
              child: const Text('切换版本',
                  style: TextStyle(color: Colors.blue, fontSize: 13)),
            ),
          ),
        ],
      ),
    );
  }

  Widget quickBar() {
    return Column(
      children: List.generate(FunctionConfig.quickData.length, (index) {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            left: 10,
            right: 10,
            top: index == 0 ? 10 : 0,
            bottom: index == FunctionConfig.quickData.length - 1 ? 0 : 10,
          ),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                FadeInImage(
                    height: 46,
                    width: 46,
                    fadeInDuration: const Duration(milliseconds: 120),
                    placeholder: MemoryImage(kTransparentImage),
                    image: const AssetImage(AssetsConfig.fun1)),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(FunctionConfig.quickData[index],
                        style: const TextStyle(fontSize: 15)),
                    Row(children: const [
                      Text('官方',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 12,
                              fontStyle: FontStyle.italic)),
                      SizedBox(width: 5),
                      Text('推荐',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              fontStyle: FontStyle.italic)),
                    ])
                  ],
                )
              ]),
              OnInk(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade200)),
                  child: const Text('点击修改',
                      style: TextStyle(color: Colors.blue, fontSize: 13)),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget otherBar() {
    return Column(
      children: List.generate(FunctionConfig.otherData.length, (index) {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            left: 10,
            right: 10,
            top: index == 0 ? 10 : 0,
            bottom: index == FunctionConfig.otherData.length - 1 ? 0 : 10,
          ),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                FadeInImage(
                    height: 45,
                    width: 45,
                    fadeInDuration: const Duration(milliseconds: 120),
                    placeholder: MemoryImage(kTransparentImage),
                    image: const AssetImage(AssetsConfig.fun2)),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(FunctionConfig.otherData[index],
                        style: const TextStyle(fontSize: 15)),
                    Row(children: const [
                      Text('官方',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 12,
                              fontStyle: FontStyle.italic)),
                      SizedBox(width: 5),
                      Text('推荐',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              fontStyle: FontStyle.italic)),
                    ])
                  ],
                )
              ]),
              OnInk(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade200)),
                  child: Text(index < 2 ? '点击解锁' : '点击复制',
                      style: const TextStyle(color: Colors.blue, fontSize: 13)),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget restoreBar() {
    return Column(
      children: List.generate(FunctionConfig.restoreData.length, (index) {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            left: 10,
            right: 10,
            top: index == 0 ? 10 : 0,
            bottom: 10,
          ),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                FadeInImage(
                    height: 45,
                    width: 45,
                    fadeInDuration: const Duration(milliseconds: 120),
                    placeholder: MemoryImage(kTransparentImage),
                    image: const AssetImage(AssetsConfig.fun3)),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(FunctionConfig.restoreData[index],
                        style: const TextStyle(fontSize: 15)),
                    Row(children: const [
                      Text('重置后需重启游戏',
                          style: TextStyle(
                              color: Colors.pink,
                              fontSize: 12,
                              fontStyle: FontStyle.italic)),
                    ])
                  ],
                )
              ]),
              OnInk(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade200)),
                  child: const Text('点击重置',
                      style: TextStyle(color: Colors.blue, fontSize: 13)),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget textBar(String data) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Row(
        children: [
          FadeInImage(
              height: 20,
              width: 20,
              fadeInDuration: const Duration(milliseconds: 120),
              placeholder: MemoryImage(kTransparentImage),
              image: const AssetImage(AssetsConfig.lightning)),
          Text(data, style: const TextStyle(fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }
}
