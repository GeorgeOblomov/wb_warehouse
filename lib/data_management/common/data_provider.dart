import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wb_warehouse/data_management/common/data_error.dart';
import 'package:wb_warehouse/data_management/common/network_client.dart';
import 'package:wb_warehouse/data_management/common/request_result.dart';

enum DataProviderType {
  restOfGoods,
  pricesAndDiscounts,
}

typedef ApiAccessor<T> = Future<T> Function([dynamic payload]);

abstract class DataProvider {
  final NetworkClient _networkClient;

  DataProvider({required NetworkClient networkClient}) : _networkClient = networkClient;

  @protected
  ApiAccessor<T> getApiAccessor<T>(String path, NetworkClientType type, ErrorType errorType) {
    return ([payload]) async {
      final completer = Completer<T>();
      final requestResult = await _networkClient.get<T>(
        path: path,
        type: type,
        errorType: errorType,
        payload: payload,
      );

      handleResponse(requestResult, completer);

      return completer.future;
    };
  }

  @protected
  ApiAccessor<T> postApiAccessor<T>(String path, NetworkClientType type, ErrorType errorType) {
    return ([payload]) async {
      final completer = Completer<T>();
      final requestResult = await _networkClient.post<T>(
        path: path,
        type: type,
        errorType: errorType,
        payload: payload,
      );

      handleResponse(requestResult, completer);

      return completer.future;
    };
  }

  @protected
  ApiAccessor<T> putApiAccessor<T>(String path, NetworkClientType type, ErrorType errorType) {
    return ([payload]) async {
      final completer = Completer<T>();
      final requestResult = await _networkClient.put<T>(
        path: path,
        type: type,
        errorType: errorType,
        payload: payload,
      );

      handleResponse(requestResult, completer);

      return completer.future;
    };
  }

  Future<void> handleResponse<T>(
    RequestResult? dataRequestResult,
    Completer<T> requestCompleter,
  ) async {
    if (dataRequestResult is RequestSuccess) {
      requestCompleter.complete(dataRequestResult.data);
    } else if (dataRequestResult is RequestFail) {
      requestCompleter.completeError(dataRequestResult.error);
      // throw dataRequestResult.error;
    } else {
      requestCompleter.completeError(DataError(errorCode: ErrorCode.unhandledError));
    }
  }
}
