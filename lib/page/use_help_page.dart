import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../../app/app.dart';

class UseHelpPage extends StatelessWidget {
  const UseHelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> useHelpContent = getUseHelpContent();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('使用帮助'),
        leading: IconButton(
            onPressed: () => navigatorKey.currentState!.pop(),
            icon: const Icon(Remix.arrow_left_line)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: List.generate(useHelpContent.length, (index) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                bottom: index == useHelpContent.length - 1 ? 0 : 15,
              ),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                // border: Border.all(
                //   color: Colors.grey.withOpacity(0.15),
                //   strokeAlign: BorderSide.strokeAlignOutside,
                // ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: useHelpContent[index]['color'].withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Remix.quill_pen_line,
                      color: useHelpContent[index]['color'],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(useHelpContent[index]['title'],
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(height: 5),
                        Text(
                          useHelpContent[index]['content'],
                          style:
                              const TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> getUseHelpContent() {
    return [
      {
        'color': Colors.blue,
        'title': '画质侠授予权限问题',
        'content': '安卓10以下机型（包括安卓10）只需要授予“存储权限”、安卓11以上机型（包括安卓11）则需要授予“游戏目录权限”'
      },
      {
        'color': Colors.deepOrange,
        'title': '画质修改失败怎么回事？',
        'content':
            '可能是你的游戏画质文件已经损坏或异常。\n方法一：重置画质，步骤：首页->重置功能->重置画质->重启游戏（需先关闭游戏后台）\n方法二：检查“存储权限”或“游戏目录权限”是否已经授予。（更多权限问题请查看上方“画质侠授予权限问题”）'
      },
      {
        'color': Colors.purple,
        'title': '修改画质后没有效果怎么办？',
        'content':
            '出现修改后没效果时，可能是因为你使用了“解锁画质+120帧”，那么就需要重置画质，重置后在重启游戏，然后就可以回到画质侠修改你需要的画质了（修改前需先退出游戏，否则无效果）'
      },
      {
        'color': Colors.cyan,
        'title': '修改了帧率但是不显示？',
        'content':
            '部分机型修改画质后不显示90/120帧率，但是仍然可以使用90/120。\n步骤：启动游戏->打开游戏画面设置->帧数设置（点击极限后面的空白区域就能选择90/120帧率）'
      },
      {
        'color': Colors.green,
        'title': '万能的解决方法',
        'content':
            '重置画质->重启游戏->清理游戏后台->回到画质侠修改画质\n如问题还不能彻底解决，请卸载重装画质侠，或者联系作者寻求帮助！'
      },
    ];
  }
}
