import 'dart:async';
import 'package:flutter/material.dart';

import 'simple_text_dialog.dart';
import '../animation_transition.dart';
import '../../app/app.dart';

const Duration _dialogTransitionDuration = Duration(milliseconds: 300);

// 弹窗样式的封装
class DialogStyle {
  /// 主要的弹窗样式
  static void mainDialog({
    String? title,
    String? content,
    String mainButtonText = '确定',
    Color mainButtonColor = Colors.blue,
    Color mainButtonForegroundColor = Colors.white,
    GestureTapCallback? onMainButton,
    bool showCancelButton = true,
  }) {
    showGeneralDialog(
      context: navigatorKey.currentContext!,
      transitionDuration: _dialogTransitionDuration,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(navigatorKey.currentContext!)
          .modalBarrierDismissLabel,
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return AnimationTransition.scale(animation, child);
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return SimpleTextDialog(
          title: title,
          content: content,
          mainButtonText: mainButtonText,
          mainButtonColor: mainButtonColor,
          mainButtonForegroundColor: mainButtonForegroundColor,
          onMainButton: onMainButton,
          showCancelButton: showCancelButton,
        );
      },
    );
  }

  /// 加载中弹窗
  ///
  /// 如 [loadingDuration] 不为null则使用await等待时间结束自动关闭弹窗
  static Future<void> loadingDialog({
    Duration? loadingDuration,
    bool barrierDismissible = false,
    Color loadingColor = Colors.blue,
  }) async {
    Timer? timer;
    await showGeneralDialog(
      context: navigatorKey.currentContext!,
      transitionDuration: _dialogTransitionDuration,
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(navigatorKey.currentContext!)
          .modalBarrierDismissLabel,
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return AnimationTransition.scale(animation, child);
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        if (loadingDuration != null) {
          timer = Timer(loadingDuration, () {
            final NavigatorState navigatorState = navigatorKey.currentState!;
            if (navigatorState.canPop()) {
              navigatorState.pop();
            }
          });
        }
        return Center(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            padding: const EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: IntrinsicHeight(
              child: Center(
                child: CircularProgressIndicator(color: loadingColor),
              ),
            ),
          ),
        );
      },
    ).then((value) {
      if (timer != null) timer!.cancel();
    });
  }
}
