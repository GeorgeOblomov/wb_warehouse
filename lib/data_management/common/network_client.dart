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

  Future<Map<String, Object>> get({
    required String path,
    required NetworkClientType type,
    Map<String, Object?>? payload,
  }) async {
    _dio.options.baseUrl = _getBaseUrl(type);

    final options = Options(headers: _getRequestHeaders(type));
    try {
      final response = await _dio.get<String>(path, data: payload ?? {}, options: options);
      final result = response.data != null && response.data!.isNotEmpty
          ? Map<String, Object>.from(json.decode(response.data!) as Map)
          : <String, Object>{};

      return result;
    } on DioError {
      rethrow;
    }
  }

  Future<Map<String, Object>> post({
    required String path,
    required NetworkClientType type,
    Map<String, Object?>? payload,
  }) async {
    _dio.options.baseUrl = _getBaseUrl(type);
    final options = Options(headers: _getRequestHeaders(type));
    try {
      final response = await _dio.post<String>(path, data: payload ?? {}, options: options);
      final result = response.data != null && response.data!.isNotEmpty
          ? Map<String, Object>.from(json.decode(response.data!) as Map)
          : <String, Object>{};

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
}
