import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  static SpUtil? _instance;

  SpUtil._();

  static late SharedPreferences _sharedPreferences;

  static Future<SpUtil> getInstance() async {
    if (_instance == null) {
      _instance = SpUtil._();

      _sharedPreferences = await SharedPreferences.getInstance();
    }
    return _instance!;
  }

  ///添加字符串
  static Future<bool> addString(String key, String value) {
    return _sharedPreferences.setString(key, value);
  }

  ///添加字符串List
  static Future<bool> addList(String key, List<String> value) {
    return _sharedPreferences.setStringList(key, value);
  }

  ///查询指定字符串List
  static List<String>? getList(String key) {
    return _sharedPreferences.getStringList(key);
  }

  ///查询是否包含指定Key
  static bool containsKey(String key) => _sharedPreferences.containsKey(key);

  ///查询所有Key
  static Set<String> getAllKey() => _sharedPreferences.getKeys();

  ///删除指定Key
  static Future<bool> remove(String key) => _sharedPreferences.remove(key);

  ///删除所有Key
  static Future<bool> clear() => _sharedPreferences.clear();
}
