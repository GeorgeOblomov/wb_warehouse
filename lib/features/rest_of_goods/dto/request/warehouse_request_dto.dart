import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/request/warehouse_goods_request_dto.dart';

part 'warehouse_request_dto.g.dart';

@immutable
@JsonSerializable(
  createFactory: false,
  explicitToJson: true,
)
class WarehouseRequestDto {
  final WarehouseGoodsRequestDto sort;

  const WarehouseRequestDto({required this.sort});

  Map<String, dynamic> toJson() => _$WarehouseRequestDtoToJson(this);
}
