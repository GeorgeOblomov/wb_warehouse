import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'warhouses_list_response_dto.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class WarhousesListResponseDto {
  final int id;
  final String name;

  const WarhousesListResponseDto({
    required this.id,
    required this.name,
  });

  factory WarhousesListResponseDto.fromJson(Map<String, dynamic> json) => _$WarhousesListResponseDtoFromJson(json);
}
