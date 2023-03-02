import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'barcodes_request_dto.g.dart';

@immutable
@JsonSerializable(
  createFactory: false,
)
class BarcodesRequestDto {
  final List<String> skus;

  const BarcodesRequestDto({required this.skus});

  Map<String, dynamic> toJson() => _$BarcodesRequestDtoToJson(this);
}
