import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  /// 浅色主题
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Colors.blue,
        ),
        scaffoldBackgroundColor: Colors.grey.shade100,
        cardColor: Colors.white,
        splashFactory: InkSparkle.splashFactory,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: Colors.black87,
            letterSpacing: 0.8,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),

        // 文本选择光标等颜色配置
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.blue,
          selectionHandleColor: Colors.blue,
          selectionColor: Colors.blue.shade200,
        ),

        // SnackBar样式配置
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),

        // 路由跳转动画样式配置
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),

        // 文本按钮样式配置
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.blue),
        ),
      );
}
