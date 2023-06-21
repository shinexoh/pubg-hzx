import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';

import 'package:huazhixia/util/util.dart';

class CardPassPage extends StatelessWidget {
  const CardPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('卡密激活'),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Remix.arrow_left_line)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade200, blurRadius: 10)
                  ],
                ),
                child: const TextField(
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: '请输入激活卡密',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                      border: InputBorder.none,
                    ))),
            const SizedBox(height: 20),
            AnimatedButton(
              height: 45,
              text: '激活卡密',
              color: Colors.blue,
              isFixedHeight: false,
              pressEvent: () {},
            ),
            const SizedBox(height: 10),
            AnimatedButton(
              height: 45,
              text: '没有卡密？点击购买',
              isFixedHeight: false,
              color: Colors.orange,
              pressEvent: () {},
            ),
            infoBar(),
            getRightsBar(),
          ],
        ),
      ),
    );
  }

  Widget infoBar() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          '温馨提示',
          style: TextStyle(
              fontSize: 15, letterSpacing: 1, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          '没有卡密请点击【购买卡密】前往购买，购买成功后请留意短信/邮箱的卡密信息，收到卡密后回到画质侠输入并激活即可。',
          style: TextStyle(fontSize: 13, color: Colors.grey),
        ),
        const SizedBox(height: 5),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: onQQ,
              style: TextButton.styleFrom(foregroundColor: Colors.blue),
              child: const Text('联系作者', style: TextStyle(fontSize: 13))),
        ),
      ]),
    );
  }

  Widget getRightsBar() {
    const List<Map> getRightsData = [
      {'icon': Remix.a24_hours_line, 'title': '24小时专属客服'},
      {'icon': Remix.gamepad_line, 'title': '解锁画质+120帧率'},
      {'icon': Remix.honor_of_kings_line, 'title': '专属画质修改功能'},
      {'icon': Remix.flashlight_line, 'title': '高优化画质修改功能'},
      {'icon': Remix.device_line, 'title': '机型画质模拟器'},
      {'icon': Remix.space_ship_line, 'title': '修改自动注入OpenGL+P1优化'},
      {'icon': Remix.leaf_line, 'title': '优先体验画质侠内测版'},
      {'icon': Remix.fire_line, 'title': '以及更多画质侠功能'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text('享受权益', style: TextStyle(fontSize: 20))),
        Column(
          children: List.generate(getRightsData.length, (index) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                bottom: index == getRightsData.length - 1 ? 0 : 10,
              ),
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

  void onQQ() => AppUtil.openQQ(653143454);
}
