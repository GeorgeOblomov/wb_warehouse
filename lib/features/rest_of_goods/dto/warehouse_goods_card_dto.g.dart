// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_goods_card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseGoodsCardDto _$WarehouseGoodsCardDtoFromJson(Map<String, dynamic> json) => WarehouseGoodsCardDto(
      nmID: json['nmID'] as int,
      imtID: json['imtID'] as int,
      subjectName: json['subjectName'] as String,
      photos: (json['photos'] as List<dynamic>).map((e) => GoodPhotoDto.fromJson(e as Map<String, dynamic>)).toList(),
      sizes: (json['sizes'] as List<dynamic>).map((e) => WarehouseGoodsSizeDto.fromJson(e as Map<String, dynamic>)),
      vendorCode: json['vendorCode'] as String,
    );
