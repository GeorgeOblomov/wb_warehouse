import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/warehouse_cards_response_dto.dart';

part 'warehouse_cards_response_dto.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class WarehouseCardsResponseDto {
  final Iterable<WarehouseCardsDataDto> data;
  final bool error;
  final String errorText;

  const WarehouseCardsResponseDto({
    required this.data,
    required this.error,
    required this.errorText,
  });

  factory WarehouseCardsResponseDto.fromJson(Map<String, dynamic> json) => _$WarehouseCardsResponseDtoFromJson(json);
}
