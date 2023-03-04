// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_cards_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseCardsResponseDto _$WarehouseCardsResponseDtoFromJson(
        Map<String, dynamic> json) =>
    WarehouseCardsResponseDto(
      data: (json['data'] as List<dynamic>).map(
          (e) => WarehouseCardsDataDto.fromJson(e as Map<String, dynamic>)),
      error: json['error'] as bool,
      errorText: json['errorText'] as String,
    );
