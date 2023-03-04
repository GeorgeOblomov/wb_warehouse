import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/warehouse_goods_data_dto.dart';

part 'warehouse_goods_response_dto.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class WarehouseGoodsResponseDto {
  final WarehouseGoodsDataDto data;
  final bool error;
  final String errorText;

  const WarehouseGoodsResponseDto({required this.data, required this.error, required this.errorText});

  factory WarehouseGoodsResponseDto.fromJson(Map<String, dynamic> json) => _$WarehouseGoodsResponseDtoFromJson(json);
}
