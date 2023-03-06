// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_of_goods_stock_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestOfGoodsStockDto _$RestOfGoodsStockDtoFromJson(Map<String, dynamic> json) =>
    RestOfGoodsStockDto(
      barcode: json['sku'] as String,
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$RestOfGoodsStockDtoToJson(
        RestOfGoodsStockDto instance) =>
    <String, dynamic>{
      'sku': instance.barcode,
      'amount': instance.amount,
    };
