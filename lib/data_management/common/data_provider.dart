import 'package:flutter/material.dart';
import 'package:wb_warehouse/data_management/common/network_client.dart';

enum DataProviderType {
  restOfGoods,
}

typedef ApiAccessor<T> = Future<T> Function([Map<String, Object?>? payload]);

abstract class DataProvider {
  final NetworkClient _networkClient;

  DataProvider({required NetworkClient networkClient}) : _networkClient = networkClient;

  @protected
  ApiAccessor<Map<String, Object?>> getApiAccessor(String path, NetworkClientType type) {
    return ([payload]) async {
      return _networkClient.get(path: path, type: type, payload: payload);
    };
  }

  @protected
  ApiAccessor<Map<String, Object?>> postApiAccessor(String path, NetworkClientType type) {
    return ([payload]) async {
      return _networkClient.post(path: path, type: type, payload: payload);
    };
  }
}
