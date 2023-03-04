import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'warehouse_goods_size_dto.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class WarehouseGoodsSizeDto {
  final String techSize;
  final Iterable<String> skus;

  const WarehouseGoodsSizeDto({required this.techSize, required this.skus});

  factory WarehouseGoodsSizeDto.fromJson(Map<String, dynamic> json) => _$WarehouseGoodsSizeDtoFromJson(json);
}
