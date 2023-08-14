import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huazhixia/page/permission/permission_page.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:huazhixia/controller/controller.dart';
import 'package:huazhixia/widgets/widgets.dart';

mixin PermissionLogic on State<PermissionPage>, WidgetsBindingObserver {
  //存储权限状态
  var permissionGranted = false.obs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      if (await Permission.storage.status == PermissionStatus.granted) {
        permissionGranted.value = true;
        Get.find<AppController>().setStorageState(true);

        Get.snackbar('', '',
            titleText: const Text('恭喜你！',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            messageText: const Text('存储权限授予成功，开启你的旅程吧！',
                style: TextStyle(color: Colors.black)));
      }
    }
  }

  //点击授予按钮
  void onGrant() {
    permissionGranted.value ? Get.offAllNamed('/') : requestPermission();
  }

  //请求权限
  void requestPermission() async {
    final request = await Permission.storage.request();

    if (request.isGranted) {
      permissionGranted.value = true;
      Get.find<AppController>().setStorageState(true);
    } else if (request.isDenied) {
      final newRequest = await Permission.storage.request();

      if (newRequest.isGranted) {
        permissionGranted.value = true;
        Get.find<AppController>().setStorageState(true);
      } else {
        AppDialog.storageDialog();
      }
    } else {
      AppDialog.storageDialog();
    }
  }
}
