import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wb_warehouse/data_management/server_error/i_server_error.dart';

part 'marketplace_type_error.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class MarketplaceTypeError extends ServerError {
  final String code;
  final String message;
  final Object? data;

  MarketplaceTypeError({
    required this.code,
    required this.message,
    required this.data,
  }) : super(userMessage: message);

  factory MarketplaceTypeError.fromJson(Map<String, dynamic> json) => _$MarketplaceTypeErrorFromJson(json);
}
