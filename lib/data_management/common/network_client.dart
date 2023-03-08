import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:wb_warehouse/data_management/common/api_tokens.dart';
import 'package:wb_warehouse/utils/constants.dart';

const authorizationHeaderName = 'Authorization';

enum NetworkClientType {
  standart,
  statistics,
  ads,
}

class NetworkClient {
  final Dio _dio;

  NetworkClient() : _dio = Dio() {
    _initDio();
  }

  Future<T> get<T>({
    required String path,
    required NetworkClientType type,
    Map<String, Object?>? payload,
  }) async {
    _dio.options.baseUrl = _getBaseUrl(type);

    final options = Options(headers: _getRequestHeaders(type));
    try {
      final response = await _dio.get<String>(path, data: payload ?? {}, options: options);
      final result = _getResponseResult(response.data);

      return result;
    } on DioError {
      rethrow;
    }
  }

  Future<T> post<T>({
    required String path,
    required NetworkClientType type,
    Map<String, Object?>? payload,
  }) async {
    _dio.options.baseUrl = _getBaseUrl(type);
    final options = Options(headers: _getRequestHeaders(type));
    try {
      final response = await _dio.post<String>(path, data: payload ?? {}, options: options);
      final result = _getResponseResult(response.data);

      return result;
    } on DioError {
      rethrow;
    }
  }

  Future<T> put<T>({
    required String path,
    required NetworkClientType type,
    Map<String, Object?>? payload,
  }) async {
    _dio.options.baseUrl = _getBaseUrl(type);
    final options = Options(headers: _getRequestHeaders(type));
    try {
      final response = await _dio.put<String>(path, data: payload ?? {}, options: options);
      final result = _getResponseResult(response.data);

      return result;
    } on DioError {
      rethrow;
    }
  }

  void _initDio() {
    _dio.options.receiveTimeout = const Duration(seconds: 30);
  }

  String _getBaseUrl(NetworkClientType type) {
    switch (type) {
      case NetworkClientType.standart:
        return standartEndpoint;
      case NetworkClientType.statistics:
        return statisticsEndpoint;
      case NetworkClientType.ads:
        return adsEndpoint;
    }
  }

  Map<String, dynamic> _getRequestHeaders(NetworkClientType type) {
    final headers = <String, dynamic>{};

    headers[authorizationHeaderName] = _getToken(type);
    headers['Accept'] = 'application/json';
    headers['Content-Type'] = 'application/json';

    return headers;
  }

  String _getToken(NetworkClientType type) {
    switch (type) {
      case NetworkClientType.standart:
        return ApiTokens.standard;
      case NetworkClientType.statistics:
        return ApiTokens.statistics;
      case NetworkClientType.ads:
        return ApiTokens.ads;
    }
  }

  dynamic _getResponseResult(String? data) {
    if (data != null && data.isNotEmpty) {
      final jsonData = json.decode(data);

      return jsonData is Map ? Map<String, dynamic>.from(jsonData) : List.from(jsonData as List);
    }

    return <String, dynamic>{};
  }
}
