// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_goods_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseGoodsResponseDto _$WarehouseGoodsResponseDtoFromJson(
        Map<String, dynamic> json) =>
    WarehouseGoodsResponseDto(
      data:
          WarehouseGoodsDataDto.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] as bool,
      errorText: json['errorText'] as String,
    );
