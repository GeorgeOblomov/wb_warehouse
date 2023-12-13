// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewDto _$ReviewDtoFromJson(Map<String, dynamic> json) => ReviewDto(
      id: json['id'] as String,
      userName: json['userName'] as String,
      text: json['text'] as String,
      productValuation: json['productValuation'] as int,
      createdDate: json['createdDate'] as String,
      productDetails: ReviewGoodDto.fromJson(
          json['productDetails'] as Map<String, dynamic>),
    );
