import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:get/get.dart';

import 'package:huazhixia/config/config.dart';
import 'package:huazhixia/widgets/widgets.dart';

class MediumModelPage extends StatelessWidget {
  const MediumModelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('中端机'),
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Remix.arrow_left_line)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: List.generate(FunctionConfig.mediumModel.length, (index) {
            return UseButton(
              title: FunctionConfig.mediumModel[index],
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              onTap: () => onUse(index),
            );
          }),
        ),
      ),
    );
  }

  void onUse(int index) {
    UseDialog.usePqDialog(filePath: FileConfig.mediumModelFile[index]);
  }
}
