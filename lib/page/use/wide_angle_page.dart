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
                fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
            '超广角因稳定性正处于内测阶段，为了逐步完善功能，我们将会在每日根据用户的设备信息发放体验资格，如收到资格的用户出现问题请及时反馈！',
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
        return Container(
          margin: EdgeInsets.only(
            bottom: index == FunctionConfig.wideAngle.length - 1 ? 0 : 15,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 10)],
          ),
          child: OnInk(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
            padding: const EdgeInsets.all(15),
            onTap: () => onUse(index),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FunctionConfig.wideAngle[index],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 5),
                      const Row(children: [
                        ColorTextCard(color: Colors.grey, text: '内测中'),
                        SizedBox(width: 5),
                        ColorTextCard(color: Colors.green, text: '无黑边'),
                      ]),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset(AssetsConfig.arrow, height: 20, width: 20),
              ],
            ),
          ),
        );
      }),
    );
  }

  void onUse(int index) {
    if (SpUtil.containsKey(AppConfig.taskKey)) {
      DialogStyle.mainDialog(
        subTitle: '很遗憾，您的设备 [${DeviceInfo.model}] 未获得资格，请等待下次资格发放！',
        showCanceButton: false,
        onOkButton: () => navigatorKey.currentState!.pop(),
      );
    } else {
      AppDialog.taskDialog();
    }
  }
}
