import 'dart:io';
import 'package:dio/dio.dart';

import 'http_client_interceptor.dart';

class HttpClient {
  static HttpClient? _instance;

  static late Dio _dio;

  HttpClient._() {
    _dio = Dio();
    _dio.options = BaseOptions(
      // 连接超时时间
      connectTimeout: const Duration(seconds: 10),
      // 接收超时时间
      receiveTimeout: const Duration(seconds: 10),
      // 发送超时时间
      sendTimeout: const Duration(seconds: 10),
    );
    // 添加拦截器
    _dio.interceptors.add(HttpClientInterceptor());
  }

  static HttpClient getInstance() => _instance ??= HttpClient._();

  static Future<HttpData> get(String url) async {
    Response response;
    try {
      response = await _dio.get(url);
      if (response.statusCode == HttpStatus.ok) {
        return HttpData(isOk: true, data: response.data);
      } else {
        return HttpData(
          isOk: false,
          errorMsg: '请求失败，状态码：${response.statusCode}',
        );
      }
    } catch (e) {
      return HttpData(isOk: false, errorMsg: '请求错误：$e');
    }
  }
}

class HttpData {
  bool isOk;
  dynamic data;
  String? errorMsg;

  HttpData({
    required this.isOk,
    this.data,
    this.errorMsg,
  });
}
