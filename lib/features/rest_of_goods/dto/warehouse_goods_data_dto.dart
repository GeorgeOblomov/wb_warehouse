import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/warehouse_goods_card_dto.dart';

part 'warehouse_goods_data_dto.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class WarehouseGoodsDataDto {
  final Iterable<WarehouseGoodsCardDto> cards;

  const WarehouseGoodsDataDto({required this.cards});

  factory WarehouseGoodsDataDto.fromJson(Map<String, dynamic> json) => _$WarehouseGoodsDataDtoFromJson(json);
}
