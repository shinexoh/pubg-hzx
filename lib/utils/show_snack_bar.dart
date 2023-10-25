import 'package:flutter/material.dart';

import '../app/app.dart';

/// 显示SnackBar
/// * [msg] 提示内容
/// * [label] SnackBarAction的label内容
/// * [onPressed] SnackBarAction的点击事件
void showSnackBar(String msg, {String? label, VoidCallback? onPressed}) {
  final SnackBar snackBar = SnackBar(
    content: Text(
      msg,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
    dismissDirection: DismissDirection.horizontal,
    action: label != null && onPressed != null
        ? SnackBarAction(label: label, onPressed: onPressed)
        : null,
  );

  scaffoldMessengerKey.currentState!
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
}
