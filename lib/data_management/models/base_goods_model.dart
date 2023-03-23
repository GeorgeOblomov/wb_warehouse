import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';
import 'package:wb_warehouse/common/base_row_data.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/response/rest_of_goods_response_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/response/warehouse_cards_response_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/repositories/rest_of_goods_repository.dart';
import 'package:wb_warehouse/utils/card_characteristics.dart';
import 'package:wb_warehouse/utils/constants.dart';

abstract class BaseGoodsModel extends ElementaryModel {
  final RestOfGoodsRepository _repository;

  BaseGoodsModel(this._repository);

  Future<List<BaseRowData>> getGoodsTableData();

  @protected
  Future<WarehouseCardsResponseDto> getWarehouseCards(Iterable<String> vendorCodes) async {
    final warehouseCardsDtos = <WarehouseCardsResponseDto>[];
    final requestChunks = partition(vendorCodes, restOfGoodsCardsAmount);

    for (var requestChunk in requestChunks) {
      final warehouseCardsDto = await _repository.getWarehouseCards(requestChunk);
      warehouseCardsDtos.add(warehouseCardsDto);
    }

    final data = warehouseCardsDtos.expand((e) => e.data);

    return WarehouseCardsResponseDto(
      data: data,
      error: warehouseCardsDtos.last.error,
      errorText: warehouseCardsDtos.last.errorText,
    );
  }

  @protected
  String getMainPictureUrl(Iterable<String> urls) {
    final mainPictureRegExp = RegExp(r'^.+1.jpg$');

    return urls.firstWhere((url) => mainPictureRegExp.hasMatch(url), orElse: () => '');
  }

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
