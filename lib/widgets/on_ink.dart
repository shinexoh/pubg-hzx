import 'package:flutter/material.dart';

// 点击水波纹组件封装
class OnInk extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final BorderRadius? borderRadius;
  final bool showSplash;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  const OnInk({
    super.key,
    this.margin,
    this.color,
    this.borderRadius,
    this.showSplash = true,
    this.onTap,
    this.onLongPress,
    this.padding,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Material(
        color: color ?? Colors.transparent,
        borderRadius: borderRadius,
        child: InkWell(
            borderRadius: borderRadius,
            splashFactory: showSplash
                ? Theme.of(context).splashFactory
                : NoSplash.splashFactory,
            onTap: onTap,
            onLongPress: onLongPress,
            child: Padding(
              padding: padding ?? EdgeInsets.zero,
              child: child,
            )),
      ),
    );
  }
}
