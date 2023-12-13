import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reply_to_review_request_dto.g.dart';

@immutable
@JsonSerializable(createFactory: false, explicitToJson: true)
class ReplyToReviewRequestDto {
  final String id;
  final String text;

  const ReplyToReviewRequestDto({
    required this.id,
    required this.text,
  });

  Map<String, dynamic> toJson() => _$ReplyToReviewRequestDtoToJson(this);
}
