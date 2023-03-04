import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/warehouse_goods_size_dto.dart';

part 'warehouse_goods_card_dto.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class WarehouseGoodsCardDto {
  final Iterable<WarehouseGoodsSizeDto> sizes;
  final Iterable<String> mediaFiles;
  final String vendorCode;

  const WarehouseGoodsCardDto({
    required this.sizes,
    required this.mediaFiles,
    required this.vendorCode,
  });

  factory WarehouseGoodsCardDto.fromJson(Map<String, dynamic> json) => _$WarehouseGoodsCardDtoFromJson(json);
}
