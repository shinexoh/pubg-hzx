import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:oktoast/oktoast.dart';
import 'package:get/get.dart';

import 'page/main_page.dart';
import 'page/permission_page.dart';
import 'page/use/exclusive_page.dart';
import 'page/use//highopti_page.dart';
import 'page/use/low_model_page.dart';
import 'page/use/medium_model_page.dart';
import 'page/use/high_model_page.dart';

import 'package:huazhixia/theme/app_theme.dart';
import 'package:huazhixia/server/http_client.dart';
import 'package:huazhixia/util/util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDev();

  await Permission.storage.status != PermissionStatus.granted
      ? runApp(const MyApp('/permission'))
      : runApp(const MyApp('/'));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      position: ToastPosition.bottom,
      duration: const Duration(seconds: 3),
      child: GetMaterialApp(
        title: '画质侠',
        debugShowCheckedModeBanner: false,
        color: Colors.transparent,
        theme: AppTheme.themeData,
        initialRoute: initialRoute,
        getPages: [
          GetPage(name: '/', page: () => const MainPage()),
          GetPage(name: '/permission', page: () => const PermissionPage()),
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

//初始化实例
Future<void> initDev() async {
  HttpClient.getInstance();
  await SpUtil.getInstance();
  await DeviceInfo.getInstance();
}
