import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wb_warehouse/features/reviews/dto/response/review_good_dto.dart';

part 'review_dto.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class ReviewDto {
  final String id;
  final String userName;
  final String text;
  final int productValuation;
  final String createdDate;
  final ReviewGoodDto productDetails;

  const ReviewDto({
    required this.id,
    required this.userName,
    required this.text,
    required this.productValuation,
    required this.createdDate,
    required this.productDetails,
  });

  factory ReviewDto.fromJson(Map<String, dynamic> json) => _$ReviewDtoFromJson(json);
}
