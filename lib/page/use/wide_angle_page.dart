import 'package:flutter/material.dart';
import 'package:remixicon_updated/remixicon_updated.dart';

import '../../app/app.dart';
import '../../utils/utils.dart';
import '../../config/config.dart';
import '../../widgets/widgets.dart';

class WideAnglePage extends StatelessWidget {
  const WideAnglePage({super.key});

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
        backgroundColor: const Color.fromRGBO(255, 65, 85, 1),
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
                      image: AssetImage(AssetsConfig.wideAngle)),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 30)
                  ],
                )),
          ),
          const SizedBox(height: 5),
          const Text(
            '超广角专区',
            style: TextStyle(
                fontSize: 20, letterSpacing: 1.2, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
            '超广角因稳定性正处于阶段性测试阶段，为了逐步完善功能，我们将会在每日根据用户的设备信息发放体验资格，如收到资格的用户出现问题请及时反馈！',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget itemBar() {
    return Column(
      children: List.generate(FunctionConfig.wideAngle.length, (index) {
        return UseButton(
          title: FunctionConfig.wideAngle[index],
          margin: EdgeInsets.only(
            bottom: index == FunctionConfig.wideAngle.length - 1 ? 0 : 15,
          ),
          isWideAngle: true,
          onTap: () => onUse(index),
        );
      }),
    );
  }

  void onUse(int index) {
    if (SpUtil.containsKey(AppConfig.taskKey)) {
      DialogStyle.mainDialog(
        subTitle: '很遗憾，您的设备 [${DeviceInfo.model}] 因测试时出现黑屏闪退状况，请耐心等待设备适配与功能完善！',
        showCanceButton: false,
        onOkButton: () => navigatorKey.currentState!.pop(),
      );
    } else {
      AppDialog.taskDialog();
    }
  }
}
