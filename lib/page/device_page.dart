import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remixicon_updated/remixicon_updated.dart';

import '../app/app.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';
import '../controller/controller.dart';

class DevicePage extends StatelessWidget {
  const DevicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topAppBar(),
            permissionBar(),
            deviceInfoBar(),
          ],
        ),
      ),
    );
  }

  Widget topAppBar() {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 20),
        child: Text('设备',
            style: TextStyle(
                fontSize: 22, letterSpacing: 1, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget permissionBar() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Selector<AppController, bool>(
            selector: (_, appController) => appController.storageState,
            builder: (context, storageState, child) => OnInk(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              onTap: storageState ? null : onStorage,
              child: Row(children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Remix.folder_line,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                const Text('存储权限', style: TextStyle(fontSize: 16)),
                const Spacer(),
                Text(storageState ? '已授予' : '点击授予',
                    style: const TextStyle(color: Colors.grey, fontSize: 16)),
              ]),
            ),
          ),
          Selector<AppController, bool>(
            selector: (_, appController) => appController.directoryState,
            builder: (context, directoryState, child) => OnInk(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              onTap: directoryState ? null : onDirectory,
              child: Row(children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Remix.folder_lock_line,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                const Text('游戏目录权限', style: TextStyle(fontSize: 16)),
                const Spacer(),
                Text(directoryState ? '已授予' : '点击授予',
                    style: const TextStyle(color: Colors.grey, fontSize: 16)),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget deviceInfoBar() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(children: [
        // 手机品牌
        Row(children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Remix.information_line,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 10),
          const Text('手机品牌', style: TextStyle(fontSize: 16)),
          const Spacer(),
          Text(DeviceInfo.brand,
              style: const TextStyle(color: Colors.grey, fontSize: 16)),
        ]),
        const SizedBox(height: 20),
        // 手机型号
        Row(children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.indigoAccent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Remix.smartphone_line,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 10),
          const Text('手机型号', style: TextStyle(fontSize: 16)),
          const Spacer(),
          Text(DeviceInfo.model,
              style: const TextStyle(color: Colors.grey, fontSize: 16)),
        ]),
        const SizedBox(height: 20),
        // 安卓版本
        Row(children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Remix.android_line,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 10),
          const Text('安卓版本', style: TextStyle(fontSize: 16)),
          const Spacer(),
          Text(DeviceInfo.androidVersion,
              style: const TextStyle(color: Colors.grey, fontSize: 16)),
        ]),
        const SizedBox(height: 20),
        // SDK版本
        Row(children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Remix.bug_2_line,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 10),
          const Text('SDK版本', style: TextStyle(fontSize: 16)),
          const Spacer(),
          Text(DeviceInfo.sdkVersion.toString(),
              style: const TextStyle(color: Colors.grey, fontSize: 16)),
        ]),
        const SizedBox(height: 20),
        // 分辨率
        Row(children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Remix.tablet_line,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 10),
          const Text('分辨率', style: TextStyle(fontSize: 16)),
          const Spacer(),
          Text('${DeviceInfo.screenHeight}×${DeviceInfo.screenWidth}',
              style: const TextStyle(color: Colors.grey, fontSize: 16)),
        ]),
        const SizedBox(height: 20),
        // 处理器
        Row(children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Remix.cpu_line,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 10),
          const Text('处理器', style: TextStyle(fontSize: 16)),
          const Spacer(),
          Text(DeviceInfo.cpu,
              style: const TextStyle(color: Colors.grey, fontSize: 16)),
        ]),
        const SizedBox(height: 20),
        // 电量
        Row(children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Remix.battery_2_charge_line,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 10),
          const Text('当前电量', style: TextStyle(fontSize: 16)),
          const Spacer(),
          Text(
              DeviceInfo.batteryLevel == 100
                  ? '已充满'
                  : '${DeviceInfo.batteryLevel}%',
              style: const TextStyle(color: Colors.grey, fontSize: 16)),
        ]),
      ]),
    );
  }

  void onStorage() {
    navigatorKey.currentState!.pushNamed('/permission');
  }

  void onDirectory() => AppDialog.directoryDialog();
}
