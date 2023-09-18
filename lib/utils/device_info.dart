import 'package:device_info_plus/device_info_plus.dart';
import 'package:battery_plus/battery_plus.dart';

// 封装设备信息和电量
class DeviceInfo {
  static DeviceInfo? _instance;

  DeviceInfo._();

  static late AndroidDeviceInfo _androidDeviceInfo;
  static late int _batteryLevel;

  static Future<DeviceInfo> getInstance() async {
    if (_instance == null) {
      _instance = DeviceInfo._();

      _androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
      _batteryLevel = await Battery().batteryLevel;
    }
    return _instance!;
  }

  /// 手机品牌
  static String get brand => _androidDeviceInfo.brand;

  /// 手机型号
  static String get model => _androidDeviceInfo.model;

  /// CPU信息
  static String get cpu => _androidDeviceInfo.board;

  /// 安卓版本号
  static String get androidVersion => _androidDeviceInfo.version.release;

  /// 安卓SDK版本号
  static int get sdkVersion => _androidDeviceInfo.version.sdkInt;

  /// 屏幕高度
  static int get screenHeight =>
      _androidDeviceInfo.displayMetrics.heightPx.toInt();

  /// 屏幕宽度
  static int get screenWidth =>
      _androidDeviceInfo.displayMetrics.widthPx.toInt();

  /// 设备大小（英寸）
  static double get sizeInches => double.parse(
      _androidDeviceInfo.displayMetrics.sizeInches.toStringAsFixed(1));

  /// 设备硬件名称
  static String get hardwareName => _androidDeviceInfo.hardware;

  /// Xdpi
  static double get xDpi =>
      double.parse(_androidDeviceInfo.displayMetrics.xDpi.toStringAsFixed(2));

  /// Ydpi
  static double get yDpi =>
      double.parse(_androidDeviceInfo.displayMetrics.yDpi.toStringAsFixed(2));

  /// 获取当前电量值
  static int get batteryLevel => _batteryLevel;
}
