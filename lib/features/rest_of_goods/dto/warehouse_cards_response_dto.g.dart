// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_cards_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseCardsDataDto _$WarehouseCardsDataDtoFromJson(Map<String, dynamic> json) => WarehouseCardsDataDto(
      imtID: json['imtID'] as int,
      nmID: json['nmID'] as int,
      vendorCode: json['vendorCode'] as String,
      mediaFiles: (json['mediaFiles'] as List<dynamic>).map((e) => e as String),
      sizes: (json['sizes'] as List<dynamic>).map((e) => WarehouseCardSizeDto.fromJson(e as Map<String, dynamic>)),
      characteristics: (json['characteristics'] as List<dynamic>).map((e) => e as Map<String, dynamic>),
    );
