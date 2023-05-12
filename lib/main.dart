import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:get/get.dart';

import 'theme/theme.dart';

import 'page/main_page.dart';
import 'page/storage_page.dart';
import 'page/use/exclusive_page.dart';
import 'page/use//highopti_page.dart';
import 'page/use/low_model_page.dart';
import 'page/use/medium_model_page.dart';
import 'page/use/high_model_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      position: ToastPosition.bottom,
      duration: const Duration(seconds: 3),
      child: GetMaterialApp(
        title: '画质侠',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData,
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => const MainPage()),
          GetPage(name: '/storage', page: () => const StoragePage()),
          GetPage(name: '/exclusive', page: () => const ExclusivePage()),
          GetPage(name: '/highopti', page: () => const HighOptiPage()),
          GetPage(name: '/lowmodel', page: () => const LowModelPage()),
          GetPage(name: '/mediummodel', page: () => const MediumModelPage()),
          GetPage(name: '/highmodel', page: () => const HighModelPage()),
        ],
        defaultTransition: Transition.cupertino,
        //禁止字体大小跟随系统变化
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!);
        },
      ),
    );
  }
}
