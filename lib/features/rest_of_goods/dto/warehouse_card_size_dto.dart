import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'warehouse_card_size_dto.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class WarehouseCardSizeDto {
  final int price;
  final Iterable<String> skus;

  const WarehouseCardSizeDto({required this.price, required this.skus});

  factory WarehouseCardSizeDto.fromJson(Map<String, dynamic> json) => _$WarehouseCardSizeDtoFromJson(json);
}
