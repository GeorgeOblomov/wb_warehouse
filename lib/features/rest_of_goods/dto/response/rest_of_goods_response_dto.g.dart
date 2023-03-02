// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_of_goods_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestOfGoodsResponseDto _$RestOfGoodsResponseDtoFromJson(
        Map<String, dynamic> json) =>
    RestOfGoodsResponseDto(
      stocks: (json['stocks'] as List<dynamic>)
          .map((e) => RestOfGoodsStockDto.fromJson(e as Map<String, dynamic>)),
    );
