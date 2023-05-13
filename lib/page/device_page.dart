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
  final appController = Get.put(AppController());

  final model = ''.obs;
  final androidVersion = ''.obs;
  final sdkVersion = ''.obs;
  final res = ''.obs;
  final cpu = ''.obs;
  final battery = 0.obs;
  final brand = ''.obs;

  @override
  void initState() {
    super.initState();
    initDeviceInfo();
  }

  void initDeviceInfo() async {
    await DeviceInfo.getInstance();

    brand.value = DeviceInfo.brand;
    model.value = DeviceInfo.model;
    androidVersion.value = DeviceInfo.androidVersion;
    sdkVersion.value = DeviceInfo.sdkVersion;
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
                onTap: onStorage,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                shape: BoxShape.circle),
                            child: const Icon(Remix.folder_line)),
                        const SizedBox(width: 10),
                        const Text('存储权限', style: TextStyle(fontSize: 15)),
                      ]),
                      Text(appController.storageState.value ? '已授予' : '点击获取',
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
                onTap: () {},
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                shape: BoxShape.circle),
                            child: const Icon(Remix.folder_lock_line)),
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
                        color: Colors.grey.shade200, shape: BoxShape.circle),
                    child: const Icon(Remix.information_line)),
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
                        color: Colors.grey.shade200, shape: BoxShape.circle),
                    child: const Icon(Remix.smartphone_line)),
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
                        color: Colors.grey.shade200, shape: BoxShape.circle),
                    child: const Icon(Remix.android_line)),
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
                        color: Colors.grey.shade200, shape: BoxShape.circle),
                    child: const Icon(Remix.bug_2_line)),
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
                        color: Colors.grey.shade200, shape: BoxShape.circle),
                    child: const Icon(Remix.tablet_line)),
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
                        color: Colors.grey.shade200, shape: BoxShape.circle),
                    child: const Icon(Remix.cpu_line)),
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
                        color: Colors.grey.shade200, shape: BoxShape.circle),
                    child: const Icon(Remix.battery_2_charge_line)),
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

  void onStorage() => Get.offAllNamed('/storage');
}
