import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HttpInterceptor extends Interceptor {
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
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint('发生错误：${_parseError(err)}');
    super.onError(err, handler);
  }
}

/// 解析错误
String _parseError(DioException error) {
  switch (error.type) {
    case DioExceptionType.badCertificate:
      return '证书有误！';
    case DioExceptionType.badResponse:
      return '响应异常，请稍后重试！';
    case DioExceptionType.cancel:
      return '请求已被取消，请重新请求！';
    case DioExceptionType.connectionError:
      return '连接错误，请检查网络设置！';
    case DioExceptionType.connectionTimeout:
      return '网络连接超时，请检查网络设置！';
    case DioExceptionType.receiveTimeout:
      return '接收超时，请稍后重试！';
    case DioExceptionType.sendTimeout:
      return '发送请求超时，请检查网络设置！';
    case DioExceptionType.unknown:
      return '网络异常，请稍后重试！';
    default:
      return "Dio异常";
  }
}
