// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewsDto _$ReviewsDtoFromJson(Map<String, dynamic> json) => ReviewsDto(
      count: json['countUnanswered'] as int,
      feedbacks: (json['feedbacks'] as List<dynamic>)
          .map((e) => ReviewDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
