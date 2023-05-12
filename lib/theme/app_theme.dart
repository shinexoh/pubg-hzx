import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  ///MaterialApp主题配置
  static final ThemeData themeData = ThemeData(
    useMaterial3: true,
    // primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.grey.shade100,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      foregroundColor: Colors.black87,
      titleTextStyle: TextStyle(fontSize: 20, color: Colors.black87),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
  );
}
