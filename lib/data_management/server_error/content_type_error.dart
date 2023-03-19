import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wb_warehouse/data_management/server_error/i_server_error.dart';

part 'content_type_error.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class ContentTypeError extends ServerError {
  final dynamic data;
  final bool error;
  final String errorText;
  final String additionalErrors;

  ContentTypeError({
    required this.data,
    required this.error,
    required this.errorText,
    required this.additionalErrors,
  }) : super(userMessage: errorText);

  factory ContentTypeError.fromJson(Map<String, dynamic> json) => _$ContentTypeErrorFromJson(json);
}
