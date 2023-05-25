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
              icon: const Icon(Remix.arrow_left_line))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedButton(
              text: '激活卡密',
              height: 45,
              isFixedHeight: false,
              color: Colors.blue,
              pressEvent: () {},
            ),
            const SizedBox(height: 15),
            AnimatedButton(
              text: '没有卡密？点击购买',
              height: 45,
              isFixedHeight: false,
              color: Colors.orange,
              pressEvent: () {},
            )
          ],
        ),
      ),
    );
  }
}
