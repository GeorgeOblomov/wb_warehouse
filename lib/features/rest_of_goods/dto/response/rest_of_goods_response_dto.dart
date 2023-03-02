import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/rest_of_goods_stock_dto.dart';

part 'rest_of_goods_response_dto.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class RestOfGoodsResponseDto {
  final Iterable<RestOfGoodsStockDto> stocks;

  const RestOfGoodsResponseDto({required this.stocks});

  factory RestOfGoodsResponseDto.fromJson(Map<String, dynamic> json) => _$RestOfGoodsResponseDtoFromJson(json);
}
