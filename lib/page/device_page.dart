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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topAppBar(),
            deviceInfoBar(),
            permissionBar(),
            reportBar(),
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

  Widget deviceInfoBar() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(
        //   color: Colors.grey.withOpacity(0.15),
        //   strokeAlign: BorderSide.strokeAlignOutside,
        // ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              DeviceInfoCard(
                  color: Colors.blue,
                  icons: Remix.box_3_line,
                  title: '设备品牌',
                  devceInfo: DeviceInfo.brand),
              DeviceInfoCard(
                  color: Colors.orange,
                  icons: Remix.smartphone_line,
                  title: '设备型号',
                  devceInfo: DeviceInfo.model),
              DeviceInfoCard(
                  color: Colors.green,
                  icons: Remix.android_line,
                  title: '安卓版本',
                  devceInfo: DeviceInfo.androidVersion),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              DeviceInfoCard(
                  color: Colors.blueGrey,
                  icons: Remix.bug_2_line,
                  title: 'SDK版本',
                  devceInfo: DeviceInfo.sdkVersion.toString()),
              DeviceInfoCard(
                  color: Colors.deepOrange,
                  icons: Remix.device_line,
                  title: '分辨率',
                  devceInfo:
                      '${DeviceInfo.screenHeight}×${DeviceInfo.screenWidth}'),
              DeviceInfoCard(
                  color: Colors.pink,
                  icons: Remix.cpu_line,
                  title: '处理器',
                  devceInfo: DeviceInfo.cpu),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              DeviceInfoCard(
                  color: const Color.fromRGBO(238, 75, 134, 1.0),
                  icons: Remix.phone_find_line,
                  title: '设备大小',
                  devceInfo: DeviceInfo.sizeInches.toString()),
              DeviceInfoCard(
                  color: Colors.indigo,
                  icons: Remix.server_line,
                  title: '硬件名称',
                  devceInfo: DeviceInfo.hardwareName.toString()),
              DeviceInfoCard(
                  color: Colors.purple,
                  icons: Remix.mouse_line,
                  title: 'DPi',
                  devceInfo: '${DeviceInfo.xDpi}×${DeviceInfo.yDpi}')
            ],
          ),
        ],
      ),
    );
  }

  Widget permissionBar() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(
        //   color: Colors.grey.withOpacity(0.15),
        //   strokeAlign: BorderSide.strokeAlignOutside,
        // ),
      ),
      child: Column(children: [
        Selector<AppController, bool>(
          selector: (_, appController) => appController.storageState,
          builder: (context, storageState, child) => OnInk(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            onTap: storageState ? null : onStorage,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Remix.folder_line, color: Colors.white),
                ),
                const SizedBox(width: 10),
                const Text(
                  '应用存储权限',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
                const Spacer(),
                Text(
                  storageState ? '已授予' : '点击授予',
                  style: const TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
        Selector<AppController, bool>(
          selector: (_, appController) => appController.directoryState,
          builder: (context, directoryState, child) => OnInk(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            onTap: directoryState ? null : onDirectory,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child:
                      const Icon(Remix.folder_lock_line, color: Colors.white),
                ),
                const SizedBox(width: 10),
                const Text(
                  '游戏目录权限',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
                const Spacer(),
                Text(
                  directoryState ? '已授予' : '点击授予',
                  style: const TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget reportBar() {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
            onPressed: onReport,
            style: TextButton.styleFrom(foregroundColor: Colors.blue),
            child: const Text('信息有误？点击报告')),
      ),
    );
  }

  void onStorage() {
    navigatorKey.currentState!.pushNamed('/permission');
  }

  void onDirectory() => AppDialog.directoryDialog();

  void onReport() => showSnackBar('报告成功');
}
