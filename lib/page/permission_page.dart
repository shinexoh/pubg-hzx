import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';

import 'package:huazhixia/controller/controller.dart';
import 'package:huazhixia/config/config.dart';
import 'package:huazhixia/widgets/widgets.dart';
import 'package:huazhixia/util/util.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({super.key});

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage>
    with WidgetsBindingObserver {
  //存储权限状态
  final permissionGranted = false.obs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    AppUtil.setStatusBarDark();
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            messageText: const Text('存储权限授予成功，开启你的旅程吧！',
                style: TextStyle(color: Colors.black87)));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.1),
              Image.asset(
                AssetsConfig.permission,
                height: Get.height * 0.2,
                width: double.infinity,
                filterQuality: FilterQuality.high,
              ),
              const SizedBox(height: 20),
              const Text('请授予存储权限',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              const Text('由于画质侠需要手机“存储权限”才能修改画质，为了你的正常使用，请授予画质侠权限！',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.grey)),
              const Spacer(),
              Obx(() => AnimatedButton(
                    text: permissionGranted.value ? '进入画质侠' : '立即授予',
                    height: 45,
                    isFixedHeight: false,
                    color: Colors.blue,
                    pressEvent: onGrant,
                  )),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
