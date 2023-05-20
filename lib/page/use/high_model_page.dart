import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:get/get.dart';

import 'package:huazhixia/config/config.dart';
import 'package:huazhixia/widgets/widgets.dart';

class HighModelPage extends StatelessWidget {
  const HighModelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('高端机'),
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Remix.arrow_left_line)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: List.generate(FunctionConfig.highModel.length, (index) {
            return UseButton(
              title: FunctionConfig.highModel[index],
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              onTap: () => onUse(index),
            );
          }),
        ),
      ),
    );
  }

  void onUse(int index) {
    UseDialog.usePqDialog(filePath: FileConfig.highModelFile[index]);
  }
}
