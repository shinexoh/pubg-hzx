import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../../config/config.dart';
import '../../widgets/widgets.dart';

import 'home_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeLogic {
  @override
  void initState() {
    super.initState();
    initTitle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          topAppBar(),
          infoBar(),
          textBar('快捷修改'),
          quickBar(),
          textBar('性能优化'),
          powerBar(),
          textBar('其他功能'),
          otherBar(),
          textBar('重置功能'),
          restoreBar(),
        ]),
      ),
    );
  }

  Widget topAppBar() {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListenableBuilder(
                listenable: Listenable.merge([title, subTitle]),
                builder: (context, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title.value,
                        style: const TextStyle(
                          fontSize: 22,
                          letterSpacing: 0.8,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(subTitle.value,
                        style: const TextStyle(
                          color: Colors.grey,
                          letterSpacing: 0.8,
                        )),
                  ],
                ),
              ),
              IconButton(
                  onPressed: onOpenGame, icon: const Icon(Remix.rocket_line)),
            ],
          )),
    );
  }

  Widget infoBar() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Row(children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10)),
              child: const Row(children: [
                Icon(Remix.wireless_charging_line),
                SizedBox(width: 10),
                Expanded(
                  child: Text('服务器：正常',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontSize: 15)),
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
              child: const Row(children: [
                Icon(Remix.compasses_2_line),
                SizedBox(width: 10),
                Expanded(
                  child: Text('文件修改：正常',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontSize: 15)),
                ),
              ]),
            ),
          ),
        ]),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10)),
          child: const Row(children: [
            Icon(Remix.chat_smile_2_line),
            SizedBox(width: 10),
            Expanded(
              child: Text('如出现问题请及时反馈，祝你玩的开心！',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15)),
            ),
          ]),
        ),
      ]),
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(children: [
            Image.asset(AssetsConfig.quick, height: 45, width: 45),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FunctionConfig.quickData[index]['title'],
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(FunctionConfig.quickData[index]['subtitle'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          letterSpacing: 0.6,
                        )),
                  ]),
            ),
            OutlinedTextButton(title: '点击修改', onTap: () => onQuick(index)),
          ]),
        );
      }),
    );
  }

  Widget powerBar() {
    return Column(
      children: List.generate(FunctionConfig.powerData.length, (index) {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            left: 10,
            right: 10,
            top: index == 0 ? 10 : 0,
            bottom: index == FunctionConfig.powerData.length - 1 ? 0 : 10,
          ),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(children: [
            Image.asset(AssetsConfig.power, height: 45, width: 45),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FunctionConfig.powerData[index]['title'],
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(FunctionConfig.powerData[index]['subtitle'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          letterSpacing: 0.6,
                        )),
                  ]),
            ),
            OutlinedTextButton(
                title: index == 0
                    ? '点击修复'
                    : index == 1
                        ? '注入优化'
                        : '点击下载',
                onTap: () => onPower(index))
          ]),
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(children: [
            Image.asset(AssetsConfig.other, height: 45, width: 45),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FunctionConfig.otherData[index]['title'],
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(FunctionConfig.otherData[index]['subtitle'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          letterSpacing: 0.6,
                        )),
                  ]),
            ),
            OutlinedTextButton(
              title: index <= 1 ? '点击解锁' : '点击复制',
              onTap: () => onOther(index),
            )
          ]),
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(children: [
            Image.asset(AssetsConfig.restore, height: 45, width: 45),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FunctionConfig.restoreData[index]['title'],
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(FunctionConfig.restoreData[index]['subtitle'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.pink,
                          fontSize: 12,
                          letterSpacing: 0.6,
                        )),
                  ]),
            ),
            OutlinedTextButton(
                title: index <= 1 ? '点击重置' : '重置所有',
                onTap: () => onRestore(index))
          ]),
        );
      }),
    );
  }

  Widget textBar(String data, {bool showNewTag = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: Row(
        children: [
          Image.asset(AssetsConfig.lightning, height: 20, width: 20),
          Text(
            data,
            style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
          ),
          const SizedBox(width: 5),
          showNewTag
              ? const Text('[New]',
                  style: TextStyle(
                      color: Colors.pink, fontStyle: FontStyle.italic))
              : const SizedBox(),
        ],
      ),
    );
  }
}
