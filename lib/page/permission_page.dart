import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:huazhixia/controller/app_controller.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../app/app.dart';
import '../config/config.dart';
import '../widgets/widgets.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({super.key});

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage>
    with WidgetsBindingObserver {
  final _appController = navigatorKey.currentContext!.read<AppController>();

  // 存储权限状态
  final ValueNotifier<bool> _permissionIsGranted = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    _permissionIsGranted.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      if (await Permission.storage.status == PermissionStatus.granted) {
        _permissionIsGranted.value = true;
        _appController.setStorageState(true);
        DialogStyle.mainDialog(
          subTitle: '存储权限授予成功，开始你的旅程吧！',
          showCanceButton: false,
          okButtonTitle: '开始旅程',
          onOkButton: () =>
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
        );
      }
    }
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
                    return AnimatedButton(
                      text: permissionIsGranted ? '进入画质侠' : '立即授予',
                      height: 45,
                      isFixedHeight: false,
                      color: Colors.blue,
                      pressEvent: onGrant,
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
        ? Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false)
        : requestPermission();
  }

  // 请求权限
  void requestPermission() async {
    final request = await Permission.storage.request();

    if (request.isGranted) {
      _permissionIsGranted.value = true;
      _appController.setStorageState(true);
    } else if (request.isDenied) {
      final newRequest = await Permission.storage.request();

      if (newRequest.isGranted) {
        _permissionIsGranted.value = true;
        _appController.setStorageState(true);
      } else {
        AppDialog.storageDialog();
      }
    } else {
      AppDialog.storageDialog();
    }
  }
}
