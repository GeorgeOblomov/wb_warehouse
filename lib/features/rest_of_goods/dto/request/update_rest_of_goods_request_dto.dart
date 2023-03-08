import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/rest_of_goods_stock_dto.dart';

part 'update_rest_of_goods_request_dto.g.dart';

@immutable
@JsonSerializable(
  createFactory: false,
  explicitToJson: true,
)
class UpdateRestOfGoodsRequestDto {
  final List<RestOfGoodsStockDto> stocks;

  const UpdateRestOfGoodsRequestDto({required this.stocks});

  Map<String, dynamic> toJson() => _$UpdateRestOfGoodsRequestDtoToJson(this);
}
