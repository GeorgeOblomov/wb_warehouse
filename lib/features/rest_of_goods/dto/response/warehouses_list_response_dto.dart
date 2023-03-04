import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'warehouses_list_response_dto.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class WarehousesListResponseDto {
  final int id;
  final String name;

  const WarehousesListResponseDto({
    required this.id,
    required this.name,
  });

  factory WarehousesListResponseDto.fromJson(Map<String, dynamic> json) => _$WarehousesListResponseDtoFromJson(json);
}
