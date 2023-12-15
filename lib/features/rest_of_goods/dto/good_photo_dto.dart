import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'good_photo_dto.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class GoodPhotoDto {
  @JsonKey(name: 'big')
  final String photoUrl;

  const GoodPhotoDto({required this.photoUrl});

  factory GoodPhotoDto.fromJson(Map<String, dynamic> json) => _$GoodPhotoDtoFromJson(json);
}
