import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/request/cursor_request_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/request/filter_request_dto.dart';

part 'warehouse_goods_request_dto.g.dart';

@immutable
@JsonSerializable(
  createFactory: false,
)
class WarehouseGoodsRequestDto {
  final CursorRequestDto cursor;
  final FilterRequestDto filter;

  const WarehouseGoodsRequestDto({required this.cursor, required this.filter});

  Map<String, dynamic> toJson() => _$WarehouseGoodsRequestDtoToJson(this);
}
