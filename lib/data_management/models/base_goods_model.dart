import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:wb_warehouse/common/base_row_data.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/response/rest_of_goods_response_dto.dart';
import 'package:wb_warehouse/utils/card_characteristics.dart';

abstract class BaseGoodsModel extends ElementaryModel {
  BaseGoodsModel();

  Future<List<BaseRowData>> getGoodsTableData();

  @protected
  String getName(Iterable<Map<String, dynamic>> characteristics) {
    return characteristics.firstWhere((characteristic) {
      return characteristic.entries.first.key == CardCharacteristics.name;
    })[CardCharacteristics.name];
  }

  @protected
  int getQuantity(RestOfGoodsResponseDto restOfGoodsResponseDto, String sku) {
    try {
      return restOfGoodsResponseDto.stocks.firstWhere((stock) => stock.barcode == sku).amount;
    } catch (_) {
      return 0;
    }
  }
}
