import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:remixicon/remixicon.dart';
import 'package:get/get.dart';

class CardPassPage extends StatefulWidget {
  const CardPassPage({super.key});

  @override
  State<CardPassPage> createState() => _CardPassPageState();
}

class _CardPassPageState extends State<CardPassPage> {
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: Material(
                color: const Color.fromRGBO(26, 26, 26, 0.9),
                borderRadius: BorderRadius.circular(15),
                elevation: 4,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('VIP',
                          style: TextStyle(
                              height: 1.25,
                              letterSpacing: 5,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(242, 219, 168, 1))),
                      Text('激活画质侠体验所有画质功能',
                          style: TextStyle(
                              color: Color.fromRGBO(242, 219, 168, 1),
                              letterSpacing: 2.5)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade200, blurRadius: 10)
                  ]),
              child: const TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  hintText: '请输入卡密',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            AnimatedButton(
              height: 45,
              text: '激活卡密',
              color: Colors.blue,
              isFixedHeight: false,
              pressEvent: () {
                Get.changeThemeMode(ThemeMode.light);
              },
            ),
            const SizedBox(height: 10),
            AnimatedButton(
              height: 45,
              text: '没有卡密？点击购买',
              isFixedHeight: false,
              color: Colors.orange,
              pressEvent: () {
                Get.changeThemeMode(ThemeMode.dark);
              },
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text('享受权益', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
