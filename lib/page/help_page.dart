import 'package:flutter/material.dart';
import 'package:remixicon_updated/remixicon_updated.dart';
import 'package:get/get.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('使用帮助'),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Remix.arrow_left_line)),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            ExpansionTile(
                title: Text('画质侠授予权限问题'),
                initiallyExpanded: true,
                collapsedBackgroundColor: Colors.white,
                backgroundColor: Colors.white,
                textColor: Colors.blue,
                iconColor: Colors.blue,
                expandedAlignment: Alignment.centerLeft,
                shape: Border(),
                childrenPadding:
                    EdgeInsets.only(left: 15, right: 15, bottom: 15),
                children: [
                  Text(
                      '安卓10以下机型（包括安卓10）只需要授予“存储权限”\n\n安卓11以上机型（包括安卓11）则需要授予“游戏目录权限”'),
                ]),
            SizedBox(height: 10),
            ExpansionTile(
                title: Text('画质修改失败怎么回事？'),
                collapsedBackgroundColor: Colors.white,
                backgroundColor: Colors.white,
                textColor: Colors.blue,
                iconColor: Colors.blue,
                expandedAlignment: Alignment.centerLeft,
                shape: Border(),
                childrenPadding:
                    EdgeInsets.only(left: 15, right: 15, bottom: 15),
                children: [
                  Text(
                      '可能是你的游戏画质文件已经损坏或异常。\n\n方法一：重置画质，步骤：首页->重置功能->重置画质->重启游戏（需先关闭游戏后台）\n\n方法二：检查“存储权限”或“游戏目录权限”是否已经授予。（更多权限问题请查看上方“画质侠授予权限问题”）'),
                ]),
            SizedBox(height: 10),
            ExpansionTile(
                title: Text('修改画质后没有效果怎么办？'),
                collapsedBackgroundColor: Colors.white,
                backgroundColor: Colors.white,
                textColor: Colors.blue,
                iconColor: Colors.blue,
                expandedAlignment: Alignment.centerLeft,
                shape: Border(),
                childrenPadding:
                    EdgeInsets.only(left: 15, right: 15, bottom: 15),
                children: [
                  Text(
                      '出现修改后没效果时，可能是因为你使用了“解锁画质+120帧”，那么就需要重置画质，重置后在重启游戏，然后就可以回到画质侠修改你需要的画质了（修改前需先退出游戏，否则无效果）'),
                ]),
            SizedBox(height: 10),
            ExpansionTile(
                title: Text('修改了帧率但是不显示？'),
                collapsedBackgroundColor: Colors.white,
                backgroundColor: Colors.white,
                textColor: Colors.blue,
                iconColor: Colors.blue,
                expandedAlignment: Alignment.centerLeft,
                shape: Border(),
                childrenPadding:
                    EdgeInsets.only(left: 15, right: 15, bottom: 15),
                children: [
                  Text(
                      '部分机型修改画质后不显示90/120帧率，但是仍然可以使用90/120。\n\n步骤：启动游戏->打开游戏画面设置->帧数设置（点击极限后面的空白区域就能选择90/120帧率）'),
                ]),
            SizedBox(height: 10),
            ExpansionTile(
                title: Text('万能的解决方法'),
                collapsedBackgroundColor: Colors.white,
                backgroundColor: Colors.white,
                textColor: Colors.blue,
                iconColor: Colors.blue,
                expandedAlignment: Alignment.centerLeft,
                shape: Border(),
                childrenPadding:
                    EdgeInsets.only(left: 15, right: 15, bottom: 15),
                children: [
                  Text(
                      '重置画质->重启游戏->清理游戏后台->回到画质侠修改画质\n\n如问题还不能彻底解决，请卸载重装画质侠，或者联系作者寻求帮助！'),
                ]),
          ],
        ),
      ),
    );
  }
}
