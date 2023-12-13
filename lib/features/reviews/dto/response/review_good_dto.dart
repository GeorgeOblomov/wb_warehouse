import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_good_dto.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class ReviewGoodDto {
  final int nmId;
  final int imtId;
  final String productName;

  const ReviewGoodDto({
    required this.nmId,
    required this.imtId,
    required this.productName,
  });

  factory ReviewGoodDto.fromJson(Map<String, dynamic> json) => _$ReviewGoodDtoFromJson(json);
}
