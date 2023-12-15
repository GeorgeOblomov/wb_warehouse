import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/good_photo_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/warehouse_goods_size_dto.dart';

part 'warehouse_goods_card_dto.g.dart';

@immutable
@JsonSerializable(createToJson: false)
class WarehouseGoodsCardDto {
  final int nmID;
  final int imtID;
  final String subjectName;
  final List<GoodPhotoDto> photos;
  final Iterable<WarehouseGoodsSizeDto> sizes;
  final String vendorCode;

  const WarehouseGoodsCardDto({
    required this.nmID,
    required this.imtID,
    required this.subjectName,
    required this.photos,
    required this.sizes,
    required this.vendorCode,
  });

  factory WarehouseGoodsCardDto.fromJson(Map<String, dynamic> json) => _$WarehouseGoodsCardDtoFromJson(json);
}
