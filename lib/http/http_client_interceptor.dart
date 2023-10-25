import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HttpClientInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('开始请求：${options.uri}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('请求成功：${response.realUri}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    debugPrint('发生错误：${await _errorHandling(err)}');
    super.onError(err, handler);
  }
}

/// 错误处理
Future<String> _errorHandling(DioError error) async {
  switch (error.type) {
    case DioErrorType.badCertificate:
      return '证书有误！';
    case DioErrorType.badResponse:
      return '响应异常，请稍后重试！';
    case DioErrorType.cancel:
      return '请求已被取消，请重新请求！';
    case DioErrorType.connectionError:
      return '连接错误，请检查网络设置！';
    case DioErrorType.connectionTimeout:
      return '网络连接超时，请检查网络设置！';
    case DioErrorType.receiveTimeout:
      return '接收超时，请稍后重试！';
    case DioErrorType.sendTimeout:
      return '发送请求超时，请检查网络设置！';
    case DioErrorType.unknown:
      return '网络异常，请稍后重试！';
    default:
      return "Dio异常";
  }
}
