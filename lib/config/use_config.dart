class UriConfig {
  /// 游戏目录Uri
  static final mainUri = Uri.parse(
      'content://com.android.externalstorage.documents/tree/primary%3AAndroid%2Fdata%2Fcom.tencent.tmgp.pubgmhd%2Ffiles%2FUE4Game%2FShadowTrackerExtra%2FShadowTrackerExtra%2FSaved%2FConfig%2FAndroid');

  /// 画质文件Uri
  static final pqFileUri = Uri.parse(
      '$mainUri/document/primary%3AAndroid%2Fdata%2Fcom.tencent.tmgp.pubgmhd%2Ffiles%2FUE4Game%2FShadowTrackerExtra%2FShadowTrackerExtra%2FSaved%2FConfig%2FAndroid%2F${GameFileName.pqFileName}');

  /// 解锁画质文件Uri
  static final dlFileUri = Uri.parse(
      '$mainUri/document/primary%3AAndroid%2Fdata%2Fcom.tencent.tmgp.pubgmhd%2Ffiles%2FUE4Game%2FShadowTrackerExtra%2FShadowTrackerExtra%2FSaved%2FConfig%2FAndroid%2F${GameFileName.dlFileName}');

  /// 音质文件Uri
  static final tqFileUri = Uri.parse(
      '$mainUri/document/primary%3AAndroid%2Fdata%2Fcom.tencent.tmgp.pubgmhd%2Ffiles%2FUE4Game%2FShadowTrackerExtra%2FShadowTrackerExtra%2FSaved%2FConfig%2FAndroid%2F${GameFileName.tqFileName}');

  // static final mainUri = Uri.parse(
  //     'content://com.android.externalstorage.documents/tree/primary%3AAndroid%2Fdata%2Fmark.via%2Fdemo');

  // static final pqFileUri = Uri.parse(
  //     '$mainUri/document/primary%3AAndroid%2Fdata%2Fmark.via%2Fdemo%2FUserCustom.ini');

  // static final dlFileUri = Uri.parse(
  //     '$mainUri/document/primary%3AAndroid%2Fdata%2Fmark.via%2Fdemo%2FEnjoyCJZC.ini');

  // static final tqFileUri = Uri.parse(
  //     '$mainUri/document/primary%3AAndroid%2Fdata%2Fmark.via%2Fdemo%2FUserSettings.ini');
}

class GameFilePath {
  /// 画质文件路径
  static const String pqFilePath =
      '/storage/emulated/0/Android/data/com.tencent.tmgp.pubgmhd/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/${GameFileName.pqFileName}';

  /// 解锁画质文件路径
  static const String dlFilePath =
      '/storage/emulated/0/Android/data/com.tencent.tmgp.pubgmhd/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/${GameFileName.dlFileName}';

  /// 音质文件路径
  static const String tqFilePath =
      '/storage/emulated/0/Android/data/com.tencent.tmgp.pubgmhd/files/UE4Game/ShadowTrackerExtra/ShadowTrackerExtra/Saved/Config/Android/${GameFileName.tqFileName}';
}

class GameFileName {
  /// 画质文件名
  static const String pqFileName = 'UserCustom.ini';

  /// 解锁画质文件名
  static const String dlFileName = 'EnjoyCJZC.ini';

  /// 音质文件名
  static const String tqFileName = 'UserSettings.ini';

  /// BackUp内容标签
  static const String backUp = '[BackUp DeviceProfile]';
}

// 目录授予状态枚举
enum GrantUriState { success, error, notSelected }
