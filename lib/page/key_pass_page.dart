import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:remixicon_updated/remixicon_updated.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../app/app.dart';
import '../server/server.dart';
import '../controller/controller.dart';
import '../config/config.dart';
import '../widgets/widgets.dart';
import '../utils/utils.dart';

class KeyPassPage extends StatefulWidget {
  const KeyPassPage({super.key});

  @override
  State<KeyPassPage> createState() => _KeyPassPageState();
}

class _KeyPassPageState extends State<KeyPassPage> {
  final _appController = navigatorKey.currentContext!.read<AppController>();
  final _textEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('卡密激活'),
        leading: IconButton(
            onPressed: () => navigatorKey.currentState!.pop(),
            icon: const Icon(Remix.arrow_left_line)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vipBar(),
            const SizedBox(height: 20),
            cardPassTextField(),
            const SizedBox(height: 20),
            buttonBar(),
            const SizedBox(height: 20),
            infoBar(),
            const SizedBox(height: 30),
            enjoyBar(),
          ],
        ),
      ),
    );
  }

  Widget vipBar() {
    return SizedBox(
      width: double.infinity,
      child: Material(
        elevation: 4,
        color: const Color.fromRGBO(26, 26, 26, 0.9),
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'VIP',
              style: TextStyle(
                fontSize: 24,
                color: Color.fromRGBO(252, 162, 86, 1),
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                height: 1.2,
                letterSpacing: 5,
              ),
            ),
            Selector<AppController, bool>(
                selector: (_, appController) => appController.taskState,
                builder: (context, taskState, child) => Text(
                      taskState ? '您已成功激活画质侠会员' : '激活画质侠享受更多画质功能',
                      style: const TextStyle(
                          fontSize: 13,
                          color: Color.fromRGBO(252, 162, 86, 1),
                          letterSpacing: 2),
                    )),
          ]),
        ),
      ),
    );
  }

  Widget cardPassTextField() {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 10)],
      ),
      child: TextField(
          controller: _textEditingController,
          selectionHeightStyle: BoxHeightStyle.includeLineSpacingMiddle,
          decoration: const InputDecoration(
            hintText: '请输入激活卡密',
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          )),
    );
  }

  Widget buttonBar() {
    return Column(
      children: [
        AnimatedButton(
            height: 45,
            text: '激活卡密',
            color: Colors.blue,
            isFixedHeight: false,
            pressEvent: onUse),
        const SizedBox(height: 10),
        AnimatedButton(
            height: 45,
            text: '没有卡密？点击购买',
            isFixedHeight: false,
            color: Colors.orange,
            pressEvent: onBuy)
      ],
    );
  }

  Widget infoBar() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '温馨提示',
                  style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  '没有卡密请点击【购买卡密】前往购买，购买时请填写有效手机号接收卡密短信，收到卡密后回到画质侠输入并激活即可。',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ]),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: onQQ,
              style: TextButton.styleFrom(foregroundColor: Colors.blue),
              child: const Text('联系作者', style: TextStyle(fontSize: 13))),
        ),
      ],
    );
  }

  Widget enjoyBar() {
    const List<Map> getRightsData = [
      {'icon': Remix.a24_hours_line, 'title': '24小时专属客服'},
      {'icon': Remix.gamepad_line, 'title': '解锁画质+120帧率'},
      {'icon': Remix.honor_of_kings_line, 'title': '专属画质修改功能'},
      {'icon': Remix.flashlight_line, 'title': '高优化画质修改功能'},
      {'icon': Remix.device_line, 'title': '机型画质模拟器'},
      {'icon': Remix.space_ship_line, 'title': '修改自动注入OpenGL+SV优化'},
      {'icon': Remix.leaf_line, 'title': '优先体验画质侠内测版'},
      {'icon': Remix.fire_line, 'title': '以及更多画质侠功能'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('享受权益', style: TextStyle(fontSize: 20)),
        const SizedBox(height: 20),
        Column(
          children: List.generate(getRightsData.length, (index) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  bottom: index == getRightsData.length - 1 ? 0 : 10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade200, blurRadius: 10)
                  ]),
              child: Row(children: [
                Icon(
                  getRightsData[index]['icon'],
                  color: const Color.fromRGBO(207, 166, 78, 1),
                  size: 26,
                ),
                const SizedBox(width: 10),
                Text(getRightsData[index]['title']),
              ]),
            );
          }),
        )
      ],
    );
  }

  // 激活卡密
  void onUse() async {
    if (_textEditingController.text.isEmpty) {
      showToast('请输入卡密');
      return;
    }

    FocusScope.of(context).unfocus();
    DialogStyle.loadingDialog(dismissible: false);

    final httpKeyPass = await HttpClient.get(Api.keyPass);

    if (httpKeyPass.isOk) {
      navigatorKey.currentState!.pop();

      final List<String> keyPassList = httpKeyPass.data.split('\n');
      if (keyPassList.contains(_textEditingController.text.toUpperCase())) {
        SpUtil.addString(AppConfig.taskKey, '');
        _appController.setTaskState(true);

        DialogStyle.mainDialog(
          title: '激活成功',
          subTitle:
              '画质侠激活成功！注意：一张卡密只能激活一台设备，如果在另一台设备激活同一张卡密，那么原设备将会失效，请勿将卡密泄露给他人！',
          showCanceButton: false,
          onOkButton: () => navigatorKey.currentState!.pop(),
        );
      } else {
        showToast('卡密不存在');
      }
    } else {
      navigatorKey.currentState!.pop();

      DialogStyle.mainDialog(
        subTitle: '网络连接错误，请检查网络或重启画质侠后重试！',
        showCanceButton: false,
        onOkButton: () => navigatorKey.currentState!.pop(),
      );
    }
  }

  // 购买卡密
  void onBuy() {
    FocusScope.of(context).unfocus();
    AppUtil.openUrl('http://shinex.haihaihai.cc/');
  }

  // 联系客服
  void onQQ() {
    FocusScope.of(context).unfocus();
    AppUtil.openQQ(653143454);
  }
}
