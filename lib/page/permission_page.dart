import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:huazhixia/util/util.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({super.key});

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {
  //存储权限状态
  final permissionGranted = false.obs;
  //是否可跳过
  final canSkip = false.obs;

  @override
  void initState() {
    super.initState();
  }

  //检查是否安卓11+可跳过
  void checkAndroid11() {
    final androidVersion = double.parse(DeviceInfo.androidVersion);
    if (androidVersion >= 11) canSkip.value = true;
  }

  //点击授予按钮
  void onGrant() {
    permissionGranted.value ? Get.offNamed('/') : requestPermission();
  }

  //请求权限
  void requestPermission() async {}

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: Colors.white);
  }
}
