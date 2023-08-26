import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../../config/config.dart';

import 'permission_logic.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({super.key});

  @override
  State<PermissionPage> createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage>
    with WidgetsBindingObserver, PermissionLogic {
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
                  valueListenable: permissionIsGranted,
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
}
