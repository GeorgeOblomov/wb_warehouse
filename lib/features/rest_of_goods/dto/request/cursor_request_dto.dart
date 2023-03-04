import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cursor_request_dto.g.dart';

@immutable
@JsonSerializable(
  createFactory: false,
)
class CursorRequestDto {
  final int limit;

  const CursorRequestDto({required this.limit});

  Map<String, dynamic> toJson() => _$CursorRequestDtoToJson(this);
}
