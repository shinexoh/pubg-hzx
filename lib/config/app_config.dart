class AppConfig {
  ///应用版本号
  static const String appVersion = '2.0.3';

  ///更新版本号
  static final double updateVersion =
      double.parse(appVersion.split('.').join());

  ///任务Key
  static const String taskKey = 'TaskKey';

  ///画质侠下载地址
  static const String appDownload = 'https://rcls.lanzoub.com/b0d9qtief';

  ///分享应用内容
  static const String shareContent = '《画质侠》和平精英最强画质助手：$appDownload';
}
