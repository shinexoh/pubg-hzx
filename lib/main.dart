import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:oktoast/oktoast.dart';
import 'package:get/get.dart';

import 'page/main_page.dart';
import 'page/permission_page.dart';
import 'page/help_page.dart';
import 'page/card_pass_page.dart';
import 'page/model_imitate_page.dart';
import 'page/use/exclusive_page.dart';
import 'page/use//highopti_page.dart';
import 'page/use/low_model_page.dart';
import 'page/use/medium_model_page.dart';
import 'page/use/high_model_page.dart';

import 'package:huazhixia/theme/app_theme.dart';
import 'package:huazhixia/server/http_client.dart';
import 'package:huazhixia/controller/controller.dart';
import 'package:huazhixia/config/config.dart';
import 'package:huazhixia/util/util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //初始化实例
  Get.put(AppController());
  HttpClient.getInstance();
  await SpUtil.getInstance();
  await DeviceInfo.getInstance();

  //初始化安卓SDK版本号
  final sdkVersion = DeviceInfo.sdkVersion;
  Get.find<AppController>().setSdkVersion(sdkVersion);

  //添加任务Key
  SpUtil.addString(AppConfig.taskKey, '');
  // SpUtil.clear();

  //设置Dark风格状态栏
  AppUtil.setStatusBarDark();

  //检查网络后检查安卓10以下存储权限是否授予并跳转指定路由
  if (await AppUtil.checkNetAvailability()) {
    if (sdkVersion <= 29) {
      await Permission.storage.status == PermissionStatus.granted
          ? runApp(const MyApp('/'))
          : runApp(const MyApp('/permission'));
    } else {
      runApp(const MyApp('/'));
    }
  }
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
        color: Colors.white,
        theme: AppTheme.themeData,
        initialRoute: initialRoute,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.cupertino,
        getPages: [
          GetPage(name: '/', page: () => const MainPage()),
          GetPage(name: '/permission', page: () => const PermissionPage()),
          GetPage(name: '/exclusive', page: () => const ExclusivePage()),
          GetPage(name: '/highopti', page: () => const HighOptiPage()),
          GetPage(name: '/lowmodel', page: () => const LowModelPage()),
          GetPage(name: '/mediummodel', page: () => const MediumModelPage()),
          GetPage(name: '/highmodel', page: () => const HighModelPage()),
          GetPage(name: '/help', page: () => const HelpPage()),
          GetPage(name: '/cardpass', page: () => const CardPassPage()),
          GetPage(name: '/modelimitate', page: () => const ModelImitatePage())
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: const [Locale('zh', 'CN')],
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
