import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rest_of_goods_stock_dto.g.dart';

@immutable
@JsonSerializable()
class RestOfGoodsStockDto {
  @JsonKey(name: 'sku')
  final String barcode;
  final int amount;

  const RestOfGoodsStockDto({required this.barcode, required this.amount});

  factory RestOfGoodsStockDto.fromJson(Map<String, dynamic> json) => _$RestOfGoodsStockDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RestOfGoodsStockDtoToJson(this);
}
