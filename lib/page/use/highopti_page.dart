import 'package:flutter/material.dart';
import 'package:remixicon_updated/remixicon_updated.dart';

// 下面注释的import代码有问题，用这种方式import的话就报错导入失败，而其他在此文件夹里的dart文件使用这种方式导入就没问题，应该是bug。

// import '../../util/util.dart';
// import '../../config/config.dart';
// import '../../widgets/widgets.dart';

import 'package:huazhixia/util/util.dart';
import 'package:huazhixia/config/config.dart';
import 'package:huazhixia/widgets/widgets.dart';

class HighOptiPage extends StatelessWidget {
  const HighOptiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          headBar(),
          const SizedBox(height: 30),
          itemBar(),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        backgroundColor: const Color.fromRGBO(251, 135, 115, 1),
        shape: const CircleBorder(),
        child: const Icon(Remix.arrow_left_line, color: Colors.white),
      ),
    );
  }

  Widget headBar() {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Hero(
            tag: 'diversify1',
            child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage(AssetsConfig.diversify)),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 30)
                  ],
                )),
          ),
          const SizedBox(height: 5),
          const Text(
            '高优化修改',
            style: TextStyle(
                fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget itemBar() {
    return Column(
      children: List.generate(FunctionConfig.highOptimize.length, (index) {
        return UseButton(
          title: FunctionConfig.highOptimize[index],
          margin: EdgeInsets.only(
            bottom: index == FunctionConfig.highOptimize.length - 1 ? 0 : 15,
          ),
          onTap: () => onUse(index),
        );
      }),
    );
  }

  void onUse(int index) async {
    await AppUtil.checkDlFile()
        ? AppDialog.dlRestoreDialog()
        : UseDialog.usePqDialog(filePath: FileConfig.highoptiFile[index]);
  }
}
