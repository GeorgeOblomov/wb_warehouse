import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:surf_logger/surf_logger.dart';
import 'package:wb_warehouse/data_management/common/api_tokens.dart';
import 'package:wb_warehouse/data_management/common/data_error.dart';
import 'package:wb_warehouse/data_management/common/request_result.dart';
import 'package:wb_warehouse/data_management/server_error/content_type_error.dart';
import 'package:wb_warehouse/data_management/server_error/i_server_error.dart';
import 'package:wb_warehouse/data_management/server_error/marketplace_type_error.dart';
import 'package:wb_warehouse/utils/constants.dart';

const authorizationHeaderName = 'Authorization';

enum NetworkClientType {
  standart,
  statistics,
  ads,
}

enum ErrorType { content, marketplace }

class NetworkClient {
  final Dio _dio;

  NetworkClient() : _dio = Dio() {
    _initDio();
  }

  Future<RequestResult> get<T>({
    required String path,
    required NetworkClientType type,
    required ErrorType errorType,
    dynamic payload,
  }) async {
    _dio.options.baseUrl = _getBaseUrl(type);
    final options = Options(headers: _getRequestHeaders(type));

    RequestResult result;
    try {
      final response = await _dio.get<String>(path, data: payload ?? {}, options: options);
      result = RequestSuccess(data: _getResponseResult(response.data));

      return result;
    } on DioException catch (e, _) {
      result = _handleError(e, StackTrace.current, errorType);
    }

    return result;
  }

  Future<RequestResult> post<T>({
    required String path,
    required NetworkClientType type,
    required ErrorType errorType,
    dynamic payload,
  }) async {
    _dio.options.baseUrl = _getBaseUrl(type);
    final options = Options(headers: _getRequestHeaders(type));

    RequestResult result;
    try {
      final response = await _dio.post<String>(path, data: payload ?? {}, options: options);
      result = RequestSuccess(data: _getResponseResult(response.data));

      return result;
    } on DioException catch (e, _) {
      result = _handleError(e, StackTrace.current, errorType);
    }

    return result;
  }

  Future<RequestResult> put<T>({
    required String path,
    required NetworkClientType type,
    required ErrorType errorType,
    dynamic payload,
  }) async {
    _dio.options.baseUrl = _getBaseUrl(type);
    final options = Options(headers: _getRequestHeaders(type));

    RequestResult result;
    try {
      final response = await _dio.put<String>(path, data: payload ?? {}, options: options);
      result = RequestSuccess(data: _getResponseResult(response.data));

      return result;
    } on DioException catch (e, _) {
      result = _handleError(e, StackTrace.current, errorType);
    }

    return result;
  }

  Future<RequestResult> patch<T>({
    required String path,
    required NetworkClientType type,
    required ErrorType errorType,
    dynamic payload,
  }) async {
    _dio.options.baseUrl = _getBaseUrl(type);
    final options = Options(headers: _getRequestHeaders(type));

    RequestResult result;
    try {
      final response = await _dio.put<String>(path, data: payload ?? {}, options: options);
      result = RequestSuccess(data: _getResponseResult(response.data));

      return result;
    } on DioException catch (e, _) {
      result = _handleError(e, StackTrace.current, errorType);
    }

    return result;
  }

  void _initDio() {
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        try {
          // ignore: avoid_print
          print('outgoing: ${options.path}, ${json.encode(options.data)}');
        } catch (e) {
          // ignore: avoid_print
          print('outgoing: ${options.path}');
        }

        return handler.next(options);
      },
      onResponse: (response, handler) {
        // ignore: avoid_print
        print('received: ${response.statusCode}, $response, ${response.data}');

        return handler.next(response);
      },
    ));
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

  RequestResult _handleError(DioException e, StackTrace trace, ErrorType errorType) {
    ServerError? serverError;
    try {
      if (e.response?.data is String) {
        serverError = _getServerErrorFromJson(
          Map<String, dynamic>.from(json.decode(e.response!.data as String) as Map<dynamic, dynamic>),
          errorType,
        );
      }
    } catch (e) {
      Logger.d(e.toString());
    }

    if (e.response == null) {
      return RequestFail(
        error: DataError(
          errorCode: ErrorCode.serverUnreachable,
          message: serverError?.userMessage,
        ),
      );
    }

    switch (e.response!.statusCode) {
      case 400:
        final dataError = DataError(
          errorCode: ErrorCode.badRequest,
          message: serverError?.userMessage,
        );

        return RequestFail(error: dataError);
      case 401:
        final dataError = DataError(
          errorCode: ErrorCode.unauthorized,
          message: serverError?.userMessage,
        );

        return RequestFail(error: dataError);
      case 403:
        return RequestFail(
          error: DataError(
            errorCode: ErrorCode.permissionDenied,
            message: serverError?.userMessage,
          ),
        );
      case 404:
        return RequestFail(
          error: DataError(
            errorCode: ErrorCode.notFound,
            message: serverError?.userMessage,
          ),
        );
      case 500:
        return RequestFail(
          error: DataError(
            errorCode: ErrorCode.internalServerError,
            message: serverError?.userMessage,
          ),
        );
      case 502:
      case 503:
      case 504:
        return RequestFail(
          error: DataError(
            errorCode: ErrorCode.serverUnavailable,
            message: serverError?.userMessage,
          ),
        );
      default:
        return RequestFail(
          error: DataError(
            errorCode: ErrorCode.serverError,
          ),
        );
    }
  }

  ServerError _getServerErrorFromJson(Map<String, dynamic> json, ErrorType errorType) {
    switch (errorType) {
      case ErrorType.content:
        return ContentTypeError.fromJson(json);
      case ErrorType.marketplace:
        return MarketplaceTypeError.fromJson(json);
    }
  }
}
