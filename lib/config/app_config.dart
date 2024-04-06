class AppConfig {
  /// 应用版本号
  static const String appVersion = '2.2.5';

  /// 更新版本号
  static final double updateVersion =
      double.parse(appVersion.split('.').join());

  /// 任务Key
  // static const String taskKey = 'TaskKey';
  static const String taskKey = 'CardPassKey';

  /// 机型模拟参数Key
  static const String modelImitateKey = 'ModelImitateKey';

  /// 画质侠下载地址
  static const String appDownload = 'https://rcls.lanzoub.com/b0d9qtief';

  /// 分享应用内容
  static const String shareContent = '《画质侠》和平精英最强画质助手：$appDownload';

  /// 画质侠介绍
  static const String appIntro =
      '画质侠是专为和平精英玩家量身打造的画质修改器。我们致力于提供简洁高效的服务，以协助玩家获得更加优质的游戏体验。';
}
