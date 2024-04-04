import 'package:provider/provider.dart';

import '../../app/app.dart';
import '../../controller/controller.dart';
import '../../config/config.dart';
import '../../widgets/widgets.dart';
import '../../utils/utils.dart';

// 修改功能的弹窗封装
class UseDialog {
  static final _sdkVersion =
      navigatorKey.currentContext!.read<AppController>().sdkVersion;

  /// 修改画质弹窗
  static void usePqDialog({
    required String filePath,
    String title = '温馨提示',
    String content = '确定要修改此画质？如出现问题请前往首页重置画质！',
    String buttonText = '修改',
  }) {
    DialogStyle.mainDialog(
      title: title,
      content: content,
      mainButtonText: buttonText,
      onMainButton: () async {
        navigatorKey.currentState!.pop();

        if (SpUtil.containsKey(AppConfig.taskKey)) {
          if (_sdkVersion <= 29) {
            await UseFor10.usePq(filePath)
                ? showSnackBar('修改成功，请重启游戏')
                : showSnackBar('修改失败，请检查权限是否授予');
          } else if (await SharedStorage.checkUriGrant(UriConfig.mainUri)) {
            await UseFor11.usePq(filePath)
                ? showSnackBar('修改成功，请重启游戏')
                : showSnackBar('修改失败，请检查权限是否授予');
          } else {
            AppDialog.directoryDialog();
          }
        } else {
          AppDialog.taskDialog();
        }
      },
    );
  }

  /// 解锁画质帧率弹窗
  static void useDlDialog(String title) {
    DialogStyle.mainDialog(
      title: title,
      content: '一旦解锁画质+120帧将会持续有效，期间修改其他画质功能会导致无效果，需要重置画质后即可修改其他画质功能！',
      mainButtonText: '解锁',
      onMainButton: () async {
        navigatorKey.currentState!.pop();

        if (SpUtil.containsKey(AppConfig.taskKey)) {
          if (_sdkVersion <= 29) {
            await UseFor10.useDl()
                ? showSnackBar('解锁画质成功，请重启游戏')
                : showSnackBar('解锁画质失败，请检查权限是否授予');
          } else if (await SharedStorage.checkUriGrant(UriConfig.mainUri)) {
            await UseFor11.useDl()
                ? showSnackBar('解锁画质成功，请重启游戏')
                : showSnackBar('解锁画质失败，请检查权限是否授予');
          } else {
            AppDialog.directoryDialog();
          }
        } else {
          AppDialog.taskDialog();
        }
      },
    );
  }

  /// 解锁超高音质弹窗
  static void useTqDialog(String title) {
    DialogStyle.mainDialog(
      title: title,
      content: '确定要解锁超高音质？如出现问题请前往首页重置音质！',
      mainButtonText: '解锁',
      onMainButton: () async {
        navigatorKey.currentState!.pop();

        if (SpUtil.containsKey(AppConfig.taskKey)) {
          if (_sdkVersion <= 29) {
            await UseFor10.useTq()
                ? showSnackBar('解锁音质成功，请重启游戏')
                : showSnackBar('解锁音质失败，请检查权限是否授予');
          } else if (await SharedStorage.checkUriGrant(UriConfig.mainUri)) {
            await UseFor11.useTq()
                ? showSnackBar('解锁音质成功，请重启游戏')
                : showSnackBar('解锁音质失败，请检查权限是否授予');
          } else {
            AppDialog.directoryDialog();
          }
        } else {
          AppDialog.taskDialog();
        }
      },
    );
  }
}
