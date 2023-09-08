import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:oktoast/oktoast.dart';

import 'app/app.dart';
import 'server/server.dart';
import 'controller/controller.dart';
import 'utils/utils.dart';

import 'page/main/main_page.dart';
import 'page/permission_page.dart';
import 'page/use_help_page.dart';
import 'page/key_pass_page.dart';
import 'page/use/model_imitate_page.dart';
import 'page/use/wide_angle_page.dart';
import 'page/use/exclusive_page.dart';
import 'page/use/high_opti_page.dart';
import 'page/use/low_model_page.dart';
import 'page/use/medium_model_page.dart';
import 'page/use/high_model_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 强制竖屏
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // 设置Dark风格状态栏
  AppUtil.setStatusBarDark();

  // 初始化实例
  HttpClient.getInstance();
  await SpUtil.getInstance();
  await DeviceInfo.getInstance();

  // 初始化状态类
  final AppController appController = AppController();
  appController.setSdkVersion(DeviceInfo.sdkVersion);

  // 检查网络是否可用
  if (!await AppUtil.checkNetAvailability()) return;

  // 初始路由界面
  String initialRoute = '/';

  // 设备<=安卓10并且权限未授予则跳转授予界面
  if (DeviceInfo.sdkVersion <= 29 &&
      await Permission.storage.status != PermissionStatus.granted) {
    initialRoute = '/permission';
  }

  runApp(
    ChangeNotifierProvider.value(
      value: appController,
      child: MyApp(initialRoute),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '画质侠',
      color: Colors.white,
      theme: AppTheme.light,
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      initialRoute: initialRoute,

      // 防止 initialRoute 是 /permission 时预先加载 / 路由
      onGenerateInitialRoutes: (initialRoute) {
        if (initialRoute == '/permission') {
          return [
            MaterialPageRoute(builder: (context) => const PermissionPage()),
          ];
        }
        return [
          MaterialPageRoute(builder: (context) => const MainPage()),
        ];
      },
      routes: {
        '/': (context) => const MainPage(),
        '/permission': (context) => const PermissionPage(),
        '/exclusive': (context) => const ExclusivePage(),
        '/highopti': (context) => const HighOptiPage(),
        '/lowmodel': (context) => const LowModelPage(),
        '/mediummodel': (context) => const MediumModelPage(),
        '/highmodel': (context) => const HighModelPage(),
        '/usehelp': (context) => const UseHelpPage(),
        '/keypass': (context) => const KeyPassPage(),
        '/modelimitate': (context) => const ModelImitatePage(),
        '/wideangle': (context) => const WideAnglePage(),
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('zh', 'CN')],
      builder: (context, child) {
        // 禁止字体大小跟随系统变化
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: OKToast(
              duration: const Duration(seconds: 3),
              position: ToastPosition.bottom,
              dismissOtherOnShow: true,
              child: child!,
            ));
      },
    );
  }
}
