import 'package:flutter/material.dart';

import 'on_ink.dart';

class OutlinedTextButton extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final VoidCallback onTap;

  const OutlinedTextButton({
    super.key,
    required this.title,
    this.titleColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OnInk(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade200)),
        child: Text(
          title,
          style: TextStyle(color: titleColor ?? Colors.blue, fontSize: 13),
        ),
      ),
    );
  }
}
