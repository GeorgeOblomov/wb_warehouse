import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'prices_and_discounts_good_response_dto.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class PricesAndDiscountsGoodResponseDto {
  final int nmId;
  final num price;
  final int discount;
  final num promoCode;

  const PricesAndDiscountsGoodResponseDto({
    required this.nmId,
    required this.price,
    required this.discount,
    required this.promoCode,
  });

  factory PricesAndDiscountsGoodResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PricesAndDiscountsGoodResponseDtoFromJson(json);
}
