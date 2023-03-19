import 'package:wb_warehouse/data_management/common/data_error.dart';

abstract class RequestResult {}

class RequestSuccess<T> extends RequestResult {
  final T data;

  RequestSuccess({required this.data});
}

class RequestFail extends RequestResult {
  final DataError error;

  RequestFail({required this.error});
}
