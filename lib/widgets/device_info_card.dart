import 'package:flutter/material.dart';

class DeviceInfoCard extends StatelessWidget {
  final Color color;
  final IconData icons;
  final String title;
  final String devceInfo;

  const DeviceInfoCard({
    super.key,
    required this.color,
    required this.icons,
    required this.title,
    required this.devceInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            child: Icon(icons, color: Colors.white),
          ),
          const SizedBox(height: 3),
          Text(title, style: const TextStyle(fontSize: 13, color: Colors.grey)),
          Text(devceInfo, maxLines: 1, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
