import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/warehouse_card_size_dto.dart';

part 'warehouse_cards_response_dto.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class WarehouseCardsDataDto {
  final int imtID;
  final int nmID;
  final String vendorCode;
  final Iterable<String> mediaFiles;
  final Iterable<WarehouseCardSizeDto> sizes;
  final Iterable<Map<String, dynamic>> characteristics;

  const WarehouseCardsDataDto({
    required this.imtID,
    required this.nmID,
    required this.vendorCode,
    required this.mediaFiles,
    required this.sizes,
    required this.characteristics,
  });

  factory WarehouseCardsDataDto.fromJson(Map<String, dynamic> json) => _$WarehouseCardsDataDtoFromJson(json);
}
