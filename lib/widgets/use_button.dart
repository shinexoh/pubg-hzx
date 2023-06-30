import 'package:flutter/material.dart';

import 'on_ink.dart';

//修改界面的按钮封装
class UseButton extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry? margin;
  final GestureTapCallback onTap;

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
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Text('OpenGL',
                        style: TextStyle(color: Colors.green, fontSize: 13))),
                const SizedBox(width: 5),
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Text('120帧率',
                        style: TextStyle(color: Colors.blue, fontSize: 13))),
              ])
            ],
          ),
          OnInk(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              onTap: onTap,
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade200)),
                  child: const Text('点击修改',
                      style: TextStyle(color: Colors.blue, fontSize: 13)))),
        ],
      ),
    );
  }
}
