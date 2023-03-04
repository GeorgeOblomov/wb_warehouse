// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_goods_card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseGoodsCardDto _$WarehouseGoodsCardDtoFromJson(
        Map<String, dynamic> json) =>
    WarehouseGoodsCardDto(
      sizes: (json['sizes'] as List<dynamic>).map(
          (e) => WarehouseGoodsSizeDto.fromJson(e as Map<String, dynamic>)),
      mediaFiles: (json['mediaFiles'] as List<dynamic>).map((e) => e as String),
      vendorCode: json['vendorCode'] as String,
    );
