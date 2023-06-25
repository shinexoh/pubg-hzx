import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:get/get.dart';

import 'package:huazhixia/widgets/widgets.dart';
import 'package:huazhixia/controller/controller.dart';
import 'package:huazhixia/util/util.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({super.key});

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  final appController = Get.find<AppController>();

  final brand = ''.obs;
  final model = ''.obs;
  final androidVersion = ''.obs;
  final sdkVersion = ''.obs;
  final res = ''.obs;
  final cpu = ''.obs;
  final battery = 0.obs;

  @override
  void initState() {
    super.initState();

    brand.value = DeviceInfo.brand;
    model.value = DeviceInfo.model;
    androidVersion.value = DeviceInfo.androidVersion;
    sdkVersion.value = DeviceInfo.sdkVersion.toString();
    res.value = '${DeviceInfo.screenHeight}×${DeviceInfo.screenWidth}';
    cpu.value = DeviceInfo.cpu;
    battery.value = DeviceInfo.batteryLevel;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
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
        ));
  }

  Widget topAppBar() {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 20),
        child: Text('设备',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget permissionBar() {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.grey.shade200, blurRadius: 10)
            ]),
        child: Column(
          children: [
            OnInk(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                onTap: appController.storageState.value ? null : onStorage,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.orange.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Remix.folder_line,
                                color: Colors.orange)),
                        const SizedBox(width: 10),
                        const Text('存储权限', style: TextStyle(fontSize: 15)),
                      ]),
                      Text(appController.storageState.value ? '已授予' : '点击授予',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 15))
                    ])),
            OnInk(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                onTap: appController.directoryState.value ? null : onDirectory,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Remix.folder_lock_line,
                                color: Colors.blue)),
                        const SizedBox(width: 10),
                        const Text('游戏目录权限', style: TextStyle(fontSize: 15)),
                      ]),
                      Text(appController.directoryState.value ? '已授予' : '点击授予',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 15))
                    ])),
          ],
        ));
  }

  Widget deviceInfoBar() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 10)]),
      child: Column(
        children: [
          //手机品牌
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child:
                        const Icon(Remix.information_line, color: Colors.teal)),
                const SizedBox(width: 10),
                const Text('手机品牌', style: TextStyle(fontSize: 15))
              ]),
              Text(brand.value,
                  style: const TextStyle(color: Colors.grey, fontSize: 15)),
            ],
          ),
          const SizedBox(height: 16),
          //手机型号
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.indigoAccent.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Remix.smartphone_line,
                        color: Colors.indigoAccent)),
                const SizedBox(width: 10),
                const Text('手机型号', style: TextStyle(fontSize: 15))
              ]),
              Text(model.value,
                  style: const TextStyle(color: Colors.grey, fontSize: 15)),
            ],
          ),
          const SizedBox(height: 16),
          //安卓版本
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Remix.android_line, color: Colors.green)),
                const SizedBox(width: 10),
                const Text('安卓版本', style: TextStyle(fontSize: 15))
              ]),
              Text(androidVersion.value,
                  style: const TextStyle(color: Colors.grey, fontSize: 15)),
            ],
          ),
          const SizedBox(height: 16),
          //SDK版本
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.purple.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Remix.bug_2_line, color: Colors.purple)),
                const SizedBox(width: 10),
                const Text('SDK版本', style: TextStyle(fontSize: 15))
              ]),
              Text(sdkVersion.value,
                  style: const TextStyle(color: Colors.grey, fontSize: 15)),
            ],
          ),
          const SizedBox(height: 16),
          //分辨率
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Remix.tablet_line,
                        color: Colors.deepOrange)),
                const SizedBox(width: 10),
                const Text('屏幕分辨率', style: TextStyle(fontSize: 15))
              ]),
              Text(res.value,
                  style: const TextStyle(color: Colors.grey, fontSize: 15)),
            ],
          ),
          const SizedBox(height: 16),
          //处理器
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.pink.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Remix.cpu_line, color: Colors.pink)),
                const SizedBox(width: 10),
                const Text('处理器', style: TextStyle(fontSize: 15))
              ]),
              Text(cpu.value,
                  style: const TextStyle(color: Colors.grey, fontSize: 15)),
            ],
          ),
          const SizedBox(height: 16),
          //电量
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.cyan.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Remix.battery_2_charge_line,
                        color: Colors.cyan)),
                const SizedBox(width: 10),
                const Text('当前电量', style: TextStyle(fontSize: 15))
              ]),
              Text(battery.value == 100 ? '已充满' : '${battery.value}%',
                  style: const TextStyle(color: Colors.grey, fontSize: 15)),
            ],
          ),
        ],
      ),
    );
  }

  void onStorage() => Get.toNamed('/permission');

  void onDirectory() => AppDialog.directoryDialog();
}
