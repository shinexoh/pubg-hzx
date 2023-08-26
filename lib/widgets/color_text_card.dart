import 'package:flutter/material.dart';

// 颜色文本卡片封装
class ColorTextCard extends StatelessWidget {
  final Color color;
  final double? colorOpacity;
  final String text;

  const ColorTextCard({
    super.key,
    required this.color,
    this.colorOpacity,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(colorOpacity ?? 0.2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(text, style: TextStyle(color: color, fontSize: 13)),
    );
  }
}
