import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'discounts_request_dto.g.dart';

@immutable
@JsonSerializable(createFactory: false, explicitToJson: true)
class DiscountsRequestDto {
  final int nm;
  final num discount;

  const DiscountsRequestDto({required this.nm, required this.discount});

  Map<String, dynamic> toJson() => _$DiscountsRequestDtoToJson(this);
}
