import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  ///MaterialApp主题配置
  static ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        scaffoldBackgroundColor: Colors.grey.shade100,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark),
        ),

        //文本选择光标等颜色配置
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.blue,
          selectionHandleColor: Colors.blue,
          selectionColor: Colors.blue.shade200,
        ),
      );
}
