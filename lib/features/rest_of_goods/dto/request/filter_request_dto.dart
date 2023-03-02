import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'filter_request_dto.g.dart';

@immutable
@JsonSerializable(
  createFactory: false,
)
class FilterRequestDto {
  final int withPhoto;

  const FilterRequestDto({required this.withPhoto});

  Map<String, dynamic> toJson() => _$FilterRequestDtoToJson(this);
}
