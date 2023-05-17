class AppConfig {
  ///应用版本号
  static const String appVersion = '2.0.1';

  //更新版本号
  static final double updateVersion =
      double.parse(appVersion.split('.').join());

  ///任务Key
  static const String taskKey = 'taskKey';

  ///分享应用内容
  static const String shareContent = '和平精英最新画质助手《画质侠》';
}
