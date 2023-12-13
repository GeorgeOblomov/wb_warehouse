import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wb_warehouse/features/reviews/dto/response/reviews_dto.dart';

part 'reviews_response_dto.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class ReviewsResponseDto {
  final ReviewsDto data;

  const ReviewsResponseDto({
    required this.data,
  });

  factory ReviewsResponseDto.fromJson(Map<String, dynamic> json) => _$ReviewsResponseDtoFromJson(json);
}
