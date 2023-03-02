// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_goods_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseGoodsDataDto _$WarehouseGoodsDataDtoFromJson(
        Map<String, dynamic> json) =>
    WarehouseGoodsDataDto(
      cards: (json['cards'] as List<dynamic>).map(
          (e) => WarehouseGoodsCardDto.fromJson(e as Map<String, dynamic>)),
    );
