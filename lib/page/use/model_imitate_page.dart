import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';

import '../../app/app.dart';
import '../../utils/utils.dart';
import '../../config/config.dart';
import '../../widgets/widgets.dart';

class ModelImitatePage extends StatefulWidget {
  const ModelImitatePage({super.key});

  @override
  State<ModelImitatePage> createState() => _ModelImitatePageState();
}

class _ModelImitatePageState extends State<ModelImitatePage> {
  final FocusScopeNode _focusScopeNode = FocusScopeNode();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _resController = TextEditingController();
  final TextEditingController _hertzController = TextEditingController();
  final TextEditingController _cpuController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (SpUtil.getList(AppConfig.modelImitateKey) != null) {
      final List<String> content = SpUtil.getList(AppConfig.modelImitateKey)!;

      _brandController.text = content[0];
      _modelController.text = content[1];
      _resController.text = content[2];
      _hertzController.text = content[3];
      _cpuController.text = content[4];
    }
  }

  @override
  void dispose() {
    _focusScopeNode.dispose();
    _brandController.dispose();
    _modelController.dispose();
    _resController.dispose();
    _hertzController.dispose();
    _cpuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        // 使用 FocusScope 组件管理子组件的焦点
        child: FocusScope(
          node: _focusScopeNode,
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
      ),
    );
  }

  Widget headBar() {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Hero(
            tag: ModalRoute.of(context)!.settings.arguments.toString(),
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
                fontSize: 20, letterSpacing: 1.2, fontWeight: FontWeight.bold),
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
              controller: _brandController,
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
                  controller: _modelController,
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
                  controller: _resController,
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
                  controller: _hertzController,
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
                  controller: _cpuController,
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
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('使用教程',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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
      ElevatedButton(
        onPressed: onStart,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          fixedSize: const Size(double.maxFinite, 45),
        ),
        child: const Text('开始模拟'),
      ),
      const SizedBox(height: 10),
      ElevatedButton(
        onPressed: onStart,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepOrange,
          fixedSize: const Size(double.maxFinite, 45),
        ),
        child: const Text('开始模拟（兼容模式）'),
      ),
      const SizedBox(height: 10),
      Row(children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onSaveArguments,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.teal,
              fixedSize: const Size(double.maxFinite, 45),
            ),
            child: const Text('保存参数'),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            onPressed: onClearArguments,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.purple,
              fixedSize: const Size(double.maxFinite, 45),
            ),
            child: const Text('清除已保存参数'),
          ),
        ),
      ])
    ]);
  }

  // 开始模拟
  void onStart([bool isCompatible = false]) async {
    if (_brandController.text.isEmpty ||
        _modelController.text.isEmpty ||
        _resController.text.isEmpty ||
        _hertzController.text.isEmpty ||
        _cpuController.text.isEmpty) {
      showSnackBar('请先输入完整参数');
      return;
    }
    _focusScopeNode.unfocus();

    if (await AppUtil.checkDlFile()) {
      AppDialog.dlRestoreDialog();
    } else {
      await DialogStyle.loadingDialog(
        loadingDuration: const Duration(milliseconds: 1500),
        loadingColor: isCompatible ? Colors.deepOrange : Colors.blue,
      );

      AppUtil.randomUsePq(
        errorToast: '模拟失败，请检查权限是否授予',
        callBack: () {
          DialogStyle.mainDialog(
            title: '模拟成功',
            content: '机型画质模拟成功，是否立即启动游戏？',
            mainButtonText: '启动游戏',
            onMainButton: () async {
              navigatorKey.currentState!.pop();
              if (!await DeviceApps.openApp('com.tencent.tmgp.pubgmhd')) {
                showSnackBar('启动游戏失败，请手动启动');
              }
            },
          );
        },
      );
    }
  }

  // 保存参数
  void onSaveArguments() {
    if (_brandController.text.isEmpty ||
        _modelController.text.isEmpty ||
        _resController.text.isEmpty ||
        _hertzController.text.isEmpty ||
        _cpuController.text.isEmpty) {
      showSnackBar('请先输入完整参数');
    } else {
      _focusScopeNode.unfocus();

      SpUtil.addList(AppConfig.modelImitateKey, [
        _brandController.text,
        _modelController.text,
        _resController.text,
        _hertzController.text,
        _cpuController.text,
      ]);
      showSnackBar('保存成功');
    }
  }

  // 清除已保存参数
  void onClearArguments() {
    _focusScopeNode.unfocus();

    if (SpUtil.containsKey(AppConfig.modelImitateKey)) {
      SpUtil.remove(AppConfig.modelImitateKey);
      showSnackBar('清除成功');
    } else {
      showSnackBar('未发现已保存的参数');
    }
  }
}
