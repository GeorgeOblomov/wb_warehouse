import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'prices_request_dto.g.dart';

@immutable
@JsonSerializable(createFactory: false, explicitToJson: true)
class PricesRequestDto {
  final int nmId;
  final num price;

  const PricesRequestDto({required this.nmId, required this.price});

  Map<String, dynamic> toJson() => _$PricesRequestDtoToJson(this);
}
