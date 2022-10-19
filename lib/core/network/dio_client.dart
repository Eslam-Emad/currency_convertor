import 'dart:io';

import 'package:currency_converter/core/network/cache_options_manager.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';

import '../../service_locator.dart';
import 'app_interceptors.dart';

/// Handle Http Request
class DioClient {
  static Dio instanceDio() {
    Dio dio = sl();
    dio.interceptors.add(AppInterceptors());

    /// this interceptor for caching specific hand to hand with [CacheOptionsManager]
    dio.interceptors.add(DioCacheInterceptor(
        options: CacheOptionsManager.instance.cacheOptionsSource));
    // dio.interceptors.add(PrettyDioLogger(
    //     requestHeader: true,
    //     requestBody: true,
    //     responseBody: true,
    //     responseHeader: false,
    //     error: true,
    //     compact: true,
    //     maxWidth: 90));
    if (!kIsWeb) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }
    return dio;
  }

  Future<Response> post(String path,
      {data,
      queryParameters,
      headers,
      formData,
      Options? options,
      Function(int, int)? onReceiveProgress}) async {
    return instanceDio().post(path,
        onReceiveProgress: onReceiveProgress,
        data: data ?? FormData.fromMap(formData),
        queryParameters: queryParameters,
        options: options ?? Options(headers: headers));
  }

  Future<Response> put(String path,
      {data,
      queryParameters,
      headers,
      Options? options,
      Function(int, int)? onReceiveProgress}) async {
    return instanceDio().put(path,
        data: data,
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
        options: options ?? Options(headers: headers));
  }

  Future<Response> patch(String path,
      {data,
      queryParameters,
      headers,
      Options? options,
      Function(int, int)? onReceiveProgress}) async {
    return instanceDio().patch(path,
        data: data,
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
        options: options ?? Options(headers: headers));
  }

  Future<Response> get(String path,
      {dynamic queryParameters,
      token,
      headers,
      Options? options,
      Function(int, int)? onReceiveProgress}) async {
    return instanceDio().get(path,
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
        options: options ?? Options(headers: headers));
  }

  static Future<Response> delete(String path,
      {queryParameters, token, headers, Options? options}) {
    return instanceDio().delete(path,
        queryParameters: queryParameters,
        options: options ?? Options(headers: headers));
  }
}
