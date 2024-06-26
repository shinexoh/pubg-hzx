import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../app/app.dart';
import '../config/config.dart';
import '../widgets/widgets.dart';
import '../controller/controller.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({super.key});

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {
  final _appController = navigatorKey.currentContext!.read<AppController>();

  // 存储权限状态
  final ValueNotifier<bool> _permissionIsGranted = ValueNotifier(false);
  // 生命周期监听
  late final AppLifecycleListener _appLifecycleListener;

  @override
  void initState() {
    super.initState();
    // 初始化生命周期监听
    _appLifecycleListener = AppLifecycleListener(
      onResume: () async {
        if (await Permission.storage.status.isGranted) {
          _permissionIsGranted.value = true;
          _appController.setStorageState(true);

          DialogStyle.mainDialog(
            content: '存储权限授予成功，开始你的旅程吧！',
            showCancelButton: false,
            mainButtonText: '开始旅程',
            onMainButton: () => navigatorKey.currentState!
                .pushNamedAndRemoveUntil('/', (route) => false),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _permissionIsGranted.dispose();
    _appLifecycleListener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(height: screenSize.height * 0.12),
              Image.asset(
                AssetsConfig.permission,
                height: screenSize.height * 0.2,
                width: double.infinity,
              ),
              const SizedBox(height: 20),
              const Text('请授予存储权限',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              const Text('由于画质侠需要手机“存储权限”才能修改画质，为了你的正常使用，请授予画质侠权限！',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.grey)),
              const Spacer(),
              ValueListenableBuilder(
                  valueListenable: _permissionIsGranted,
                  builder: (context, permissionIsGranted, child) {
                    return ElevatedButton(
                      onPressed: onGrant,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        fixedSize: const Size(double.maxFinite, 45),
                      ),
                      child: Text(permissionIsGranted ? '进入画质侠' : '立即授予'),
                    );
                  }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // 点击授予按钮
  void onGrant() {
    _permissionIsGranted.value
        ? navigatorKey.currentState!
            .pushNamedAndRemoveUntil('/', (route) => false)
        : requestPermission();
  }

  // 请求权限
  void requestPermission() async {
    final request = await Permission.storage.request();
    if (request.isPermanentlyDenied) {
      AppDialog.permissionDeniedDialog();
      return;
    } else if (request.isDenied) {
      final newRequest = await Permission.storage.request();
      if (!newRequest.isGranted) {
        AppDialog.permissionDeniedDialog();
        return;
      }
    }

    if (await Permission.storage.status.isGranted) {
      _permissionIsGranted.value = true;
      _appController.setStorageState(true);
    }
  }
}
