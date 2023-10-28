import 'package:dio/dio.dart';

import '../utils/utils.dart';

import 'http_interceptor.dart';

class HttpClient {
  late final Dio dio;

  static HttpClient? _instance;

  HttpClient._() {
    dio = Dio()
      ..options = BaseOptions(
        // 连接超时时间
        connectTimeout: const Duration(seconds: 10),
        // 接收超时时间
        receiveTimeout: const Duration(seconds: 10),
        // 发送超时时间
        sendTimeout: const Duration(seconds: 10),
      )
      // 添加拦截器
      ..interceptors.add(HttpInterceptor());
  }

  static HttpClient get instance {
    _instance ??= HttpClient._();
    return _instance!;
  }

  /// Get请求
  /// * [path] 请求地址
  /// * [queryParameters] 请求参数
  /// * [cancelToken] 取消请求Token
  /// * [responseType] 响应类型
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ResponseType responseType = ResponseType.json,
  }) async {
    if (!await AppUtil.checkNetConnectivity()) return null;
    Response response;
    try {
      response = await dio.get(
        path,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: Options(responseType: responseType),
      );
      return response.data;
    } catch (e) {
      return null;
    }
  }

  /// Post请求
  /// * [path] 请求地址
  /// * [queryParameters] 请求参数
  /// * [cancelToken] 取消请求Token
  /// * [responseType] 响应类型
  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ResponseType responseType = ResponseType.json,
  }) async {
    if (!await AppUtil.checkNetConnectivity()) return null;
    Response response;
    try {
      response = await dio.post(
        path,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: Options(responseType: responseType),
      );
      return response.data;
    } catch (e) {
      return null;
    }
  }

  /// 取消请求
  ///
  /// 单个CancelToken可用于多个请求，如CancelToken被取消了，使用该CancelToken的请求都会取消
  void cancelRequest(CancelToken cancelToken) => cancelToken.cancel();
}
