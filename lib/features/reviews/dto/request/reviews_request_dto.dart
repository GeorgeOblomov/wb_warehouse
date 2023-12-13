import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reviews_request_dto.g.dart';

@immutable
@JsonSerializable(createFactory: false, explicitToJson: true)
class ReviewsRequestDto {
  final bool isAnswered;
  final int take;
  final int skip;

  const ReviewsRequestDto({
    required this.isAnswered,
    required this.take,
    required this.skip,
  });

  Map<String, dynamic> toJson() => _$ReviewsRequestDtoToJson(this);
}
