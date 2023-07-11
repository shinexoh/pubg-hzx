import 'package:flutter/material.dart';

import 'package:huazhixia/config/config.dart';
import 'on_ink.dart';

//修改界面的按钮封装
class UseButton extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry? margin;
  final VoidCallback onTap;

  const UseButton({
    super.key,
    required this.title,
    this.margin,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 10)],
      ),
      child: OnInk(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
        padding: const EdgeInsets.all(15),
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 15)),
                const SizedBox(height: 5),
                Row(children: [
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5)),
                      child: const Text('120FPS',
                          style: TextStyle(color: Colors.blue, fontSize: 13))),
                  const SizedBox(width: 5),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                          color: Colors.pink.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5)),
                      child: const Text('SV优化',
                          style: TextStyle(color: Colors.pink, fontSize: 13))),
                  const SizedBox(width: 5),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5)),
                      child: const Text('OpenGL',
                          style: TextStyle(color: Colors.green, fontSize: 13))),
                ]),
              ],
            ),
            Image.asset(AssetsConfig.arrow, height: 20, width: 20),
          ],
        ),
      ),
    );
  }
}
