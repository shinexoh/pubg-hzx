import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../app/app.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';

import 'permission_page.dart';

mixin PermissionLogic on State<PermissionPage>, WidgetsBindingObserver {
  final _appController = navigatorKey.currentContext!.read<AppController>();

  // 存储权限状态
  final ValueNotifier<bool> permissionIsGranted = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    permissionIsGranted.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      if (await Permission.storage.status == PermissionStatus.granted) {
        permissionIsGranted.value = true;
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

  // 点击授予按钮
  void onGrant() {
    permissionIsGranted.value
        ? Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false)
        : requestPermission();
  }

  // 请求权限
  void requestPermission() async {
    final request = await Permission.storage.request();

    if (request.isGranted) {
      permissionIsGranted.value = true;
      _appController.setStorageState(true);
    } else if (request.isDenied) {
      final newRequest = await Permission.storage.request();

      if (newRequest.isGranted) {
        permissionIsGranted.value = true;
        _appController.setStorageState(true);
      } else {
        AppDialog.storageDialog();
      }
    } else {
      AppDialog.storageDialog();
    }
  }
}
