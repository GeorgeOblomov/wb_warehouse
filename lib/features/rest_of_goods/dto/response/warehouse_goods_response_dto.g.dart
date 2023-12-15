// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_goods_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseGoodsResponseDto _$WarehouseGoodsResponseDtoFromJson(
        Map<String, dynamic> json) =>
    WarehouseGoodsResponseDto(
      cards: (json['cards'] as List<dynamic>)
          .map((e) => WarehouseGoodsCardDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
