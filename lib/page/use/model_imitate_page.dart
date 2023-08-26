import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:device_apps/device_apps.dart';
import 'package:oktoast/oktoast.dart';

import '../../util/util.dart';
import '../../config/config.dart';
import '../../widgets/widgets.dart';

class ModelImitatePage extends StatefulWidget {
  const ModelImitatePage({super.key});

  @override
  State<ModelImitatePage> createState() => _ModelImitatePageState();
}

class _ModelImitatePageState extends State<ModelImitatePage> {
  TextEditingController brandController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController resController = TextEditingController();
  TextEditingController hertzController = TextEditingController();
  TextEditingController cpuController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (SpUtil.getList(AppConfig.modelImitateKey) != null) {
      final List<String> content = SpUtil.getList(AppConfig.modelImitateKey)!;

      brandController.text = content[0];
      modelController.text = content[1];
      resController.text = content[2];
      hertzController.text = content[3];
      cpuController.text = content[4];
    }
  }

  @override
  void dispose() {
    super.dispose();

    brandController.dispose();
    modelController.dispose();
    resController.dispose();
    hertzController.dispose();
    cpuController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          headBar(),
          const SizedBox(height: 30),
          brandBar(),
          const SizedBox(height: 10),
          modelBar(),
          const SizedBox(height: 10),
          resBar(),
          const SizedBox(height: 10),
          hertzBar(),
          const SizedBox(height: 10),
          cpuBar(),
          const SizedBox(height: 15),
          buttonBar(),
          const SizedBox(height: 15),
          infoBar(),
        ]),
      ),
    );
  }

  Widget headBar() {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Hero(
            tag: 'more0',
            child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage(AssetsConfig.modelImitate)),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade300, blurRadius: 30),
                    ])),
          ),
          const SizedBox(height: 5),
          const Text(
            '机型画质模拟',
            style: TextStyle(
                fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget brandBar() {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.only(left: 12, top: 8),
              child: Text('设备品牌',
                  style: TextStyle(fontSize: 15, color: Colors.grey))),
          TextField(
              controller: brandController,
              style: const TextStyle(fontSize: 15),
              selectionHeightStyle: BoxHeightStyle.includeLineSpacingMiddle,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              )),
        ],
      ),
    );
  }

  Widget modelBar() {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.only(left: 12, top: 8),
              child: Text('设备机型',
                  style: TextStyle(fontSize: 15, color: Colors.grey))),
          Row(children: [
            Expanded(
              child: TextField(
                  controller: modelController,
                  style: const TextStyle(fontSize: 15),
                  selectionHeightStyle: BoxHeightStyle.includeLineSpacingMiddle,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  )),
            ),
            const Text('机型', style: TextStyle(color: Colors.grey)),
            const SizedBox(width: 12),
          ]),
        ],
      ),
    );
  }

  Widget resBar() {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.only(left: 12, top: 8),
              child: Text('屏幕分辨率',
                  style: TextStyle(fontSize: 15, color: Colors.grey))),
          Row(children: [
            Expanded(
              child: TextField(
                  controller: resController,
                  style: const TextStyle(fontSize: 15),
                  keyboardType: TextInputType.phone,
                  selectionHeightStyle: BoxHeightStyle.includeLineSpacingMiddle,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  )),
            ),
            const Text('像素', style: TextStyle(color: Colors.grey)),
            const SizedBox(width: 12),
          ]),
        ],
      ),
    );
  }

  Widget hertzBar() {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.only(left: 12, top: 8),
              child: Text('刷新率',
                  style: TextStyle(fontSize: 15, color: Colors.grey))),
          Row(children: [
            Expanded(
              child: TextField(
                  controller: hertzController,
                  style: const TextStyle(fontSize: 15),
                  keyboardType: TextInputType.number,
                  selectionHeightStyle: BoxHeightStyle.includeLineSpacingMiddle,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  )),
            ),
            const Text('赫兹', style: TextStyle(color: Colors.grey)),
            const SizedBox(width: 12),
          ]),
        ],
      ),
    );
  }

  Widget cpuBar() {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.only(left: 12, top: 8),
              child: Text('处理器型号',
                  style: TextStyle(fontSize: 15, color: Colors.grey))),
          Row(children: [
            Expanded(
              child: TextField(
                  controller: cpuController,
                  style: const TextStyle(fontSize: 15),
                  selectionHeightStyle: BoxHeightStyle.includeLineSpacingMiddle,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  )),
            ),
            const Text('麒麟/骁龙/联发科', style: TextStyle(color: Colors.grey)),
            const SizedBox(width: 12),
          ]),
        ],
      ),
    );
  }

  Widget infoBar() {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('使用教程',
                style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('''
1.设备品牌、例如（小米）
2.设备机型、例如（小米9）
3.屏幕分辨率、高度*宽度、例如（2880*1440）
4.刷新率、例如（90）
5.设备的处理器型号、例如（骁龙835）
注意：实际模拟后的画质可能会有误差，如出现误差请再次模拟！''',
                style: TextStyle(fontSize: 13, color: Colors.grey)),
          ],
        ));
  }

  Widget buttonBar() {
    return Column(children: [
      AnimatedButton(
        text: '开始模拟',
        height: 45,
        isFixedHeight: false,
        color: Colors.blue,
        pressEvent: onStart,
      ),
      const SizedBox(height: 10),
      AnimatedButton(
        text: '开始模拟（兼容模式）',
        height: 45,
        isFixedHeight: false,
        color: Colors.deepOrange,
        pressEvent: onStartCompatible,
      ),
      const SizedBox(height: 10),
      Row(children: [
        Expanded(
            child: AnimatedButton(
          text: '保存参数',
          height: 45,
          isFixedHeight: false,
          color: Colors.teal,
          pressEvent: saveArguments,
        )),
        const SizedBox(width: 10),
        Expanded(
            child: AnimatedButton(
          text: '清除已保存参数',
          height: 45,
          isFixedHeight: false,
          color: Colors.purple,
          pressEvent: clearArguments,
        )),
      ])
    ]);
  }

  //开始模拟
  void onStart() async {
    if (brandController.text.isEmpty ||
        modelController.text.isEmpty ||
        resController.text.isEmpty ||
        hertzController.text.isEmpty ||
        cpuController.text.isEmpty) {
      showToast('请先输入完整参数');
    } else {
      FocusScope.of(context).unfocus();

      if (await AppUtil.checkDlFile()) {
        AppDialog.dlRestoreDialog();
      } else {
        await DialogStyle.loadingDialog(
            autoHideDuration: const Duration(milliseconds: 1500),
            dismissible: false);

        AppUtil.randomUsePq(
          errorToast: '模拟失败，请检查权限是否授予',
          callBack: () {
            DialogStyle.mainDialog(
              dialogType: DialogType.success,
              title: '模拟成功',
              subTitle: '机型画质模拟成功，是否立即启动游戏？',
              okButtonTitle: '启动游戏',
              onOkButton: () async {
                Navigator.pop(context);
                if (!await DeviceApps.openApp('com.tencent.tmgp.pubgmhd')) {
                  showToast('启动失败，请手动启动');
                }
              },
            );
          },
        );
      }
    }
  }

  //兼容模式模拟
  void onStartCompatible() async {
    if (brandController.text.isEmpty ||
        modelController.text.isEmpty ||
        resController.text.isEmpty ||
        hertzController.text.isEmpty ||
        cpuController.text.isEmpty) {
      showToast('请先输入完整参数');
    } else {
      FocusScope.of(context).unfocus();

      if (await AppUtil.checkDlFile()) {
        AppDialog.dlRestoreDialog();
      } else {
        await DialogStyle.loadingDialog(
            autoHideDuration: const Duration(milliseconds: 1500),
            dismissible: false,
            loadingColor: Colors.deepOrange);

        AppUtil.randomUsePq(
          errorToast: '模拟失败，请检查权限是否授予',
          callBack: () {
            DialogStyle.mainDialog(
              dialogType: DialogType.success,
              title: '模拟成功',
              subTitle: '机型画质模拟成功，是否立即启动游戏？',
              okButtonTitle: '启动游戏',
              onOkButton: () async {
                Navigator.pop(context);
                if (!await DeviceApps.openApp('com.tencent.tmgp.pubgmhd')) {
                  showToast('启动失败，请手动启动');
                }
              },
            );
          },
        );
      }
    }
  }

  //保存参数
  void saveArguments() {
    if (brandController.text.isEmpty ||
        modelController.text.isEmpty ||
        resController.text.isEmpty ||
        hertzController.text.isEmpty ||
        cpuController.text.isEmpty) {
      showToast('请先输入完整参数');
    } else {
      FocusScope.of(context).unfocus();

      SpUtil.addList(AppConfig.modelImitateKey, [
        brandController.text,
        modelController.text,
        resController.text,
        hertzController.text,
        cpuController.text,
      ]);
      showToast('保存成功');
    }
  }

  //清除已保存参数
  void clearArguments() {
    FocusScope.of(context).unfocus();

    if (SpUtil.containsKey(AppConfig.modelImitateKey)) {
      SpUtil.remove(AppConfig.modelImitateKey);
      showToast('清除成功');
    } else {
      showToast('未发现已保存的参数');
    }
  }
}
