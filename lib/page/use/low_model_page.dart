import 'package:flutter/material.dart';
import 'package:remixicon_updated/remixicon_updated.dart';

import '../../app/app.dart';
import '../../utils/utils.dart';
import '../../config/config.dart';
import '../../widgets/widgets.dart';

class LowModelPage extends StatelessWidget {
  const LowModelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          headBar(context),
          const SizedBox(height: 30),
          itemBar(),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigatorKey.currentState!.pop(),
        backgroundColor: const Color.fromRGBO(0, 179, 254, 1),
        shape: const CircleBorder(),
        child: const Icon(Remix.arrow_left_line, color: Colors.white),
      ),
    );
  }

  Widget headBar(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Hero(
            tag: ModalRoute.of(context)!.settings.arguments.toString(),
            child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage(AssetsConfig.model)),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 30)
                  ],
                )),
          ),
          const SizedBox(height: 5),
          const Text(
            '低端机',
            style: TextStyle(
                fontSize: 20, letterSpacing: 1.2, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget itemBar() {
    return Column(
      children: List.generate(FunctionConfig.lowModel.length, (index) {
        return UseButton(
          title: FunctionConfig.lowModel[index],
          margin: EdgeInsets.only(
            bottom: index == FunctionConfig.lowModel.length - 1 ? 0 : 15,
          ),
          onTap: () => onUse(index),
        );
      }),
    );
  }

  void onUse(int index) async {
    await AppUtil.checkDlFile()
        ? AppDialog.dlRestoreDialog()
        : UseDialog.usePqDialog(filePath: FileConfig.lowModelFile[index]);
  }
}
