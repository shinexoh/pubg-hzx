import 'package:flutter/material.dart';

import '../config/config.dart';
import 'color_text_card.dart';
import 'on_ink.dart';

// 修改界面的按钮封装
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
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 5),
                  const Row(children: [
                    ColorTextCard(color: Colors.blue, text: '120FPS'),
                    SizedBox(width: 5),
                    ColorTextCard(color: Colors.pink, text: 'SV优化'),
                    SizedBox(width: 5),
                    ColorTextCard(color: Colors.green, text: 'OpenGL'),
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
  }
}
