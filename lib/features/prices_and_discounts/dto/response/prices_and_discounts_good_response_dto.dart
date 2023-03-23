import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'prices_and_discounts_good_response_dto.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class PricesAndDiscountsGoodResponseDto {
  final int nmID;
  final num price;
  final int discount;
  final num promocode;

  const PricesAndDiscountsGoodResponseDto({
    required this.nmID,
    required this.price,
    required this.discount,
    required this.promocode,
  });

  factory PricesAndDiscountsGoodResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PricesAndDiscountsGoodResponseDtoFromJson(json);
}
