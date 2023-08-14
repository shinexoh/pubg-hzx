import 'package:flutter/material.dart';

class CommonCard extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final String? imagePath;
  final String title;
  final TextStyle? titleStyle;
  final String? subTitle;
  final TextStyle? subTitleStyle;
  final Widget child;

  const CommonCard({
    super.key,
    this.margin,
    this.imagePath,
    required this.title,
    this.titleStyle,
    this.subTitle,
    this.subTitleStyle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(children: [
        if (imagePath != null) Image.asset(imagePath!, height: 45, width: 45),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: titleStyle ??
                    const TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
              ),
              if (subTitle != null)
                Text(subTitle!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: subTitleStyle ??
                        const TextStyle(
                            color: Colors.grey, fontStyle: FontStyle.normal)),
            ],
          ),
        ),
        const SizedBox(width: 10),
        child
      ]),
    );
  }
}
