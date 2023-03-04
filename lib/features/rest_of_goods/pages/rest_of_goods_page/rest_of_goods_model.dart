import 'package:elementary/elementary.dart';
import 'package:quiver/iterables.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/response/rest_of_goods_response_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/response/warehouse_cards_response_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/table_data/rest_of_goods_row_data.dart';
import 'package:wb_warehouse/features/rest_of_goods/repositories/rest_of_goods_repository.dart';
import 'package:wb_warehouse/utils/card_characteristics.dart';
import 'package:wb_warehouse/utils/constants.dart';

class RestOfGoodsModel extends ElementaryModel {
  final RestOfGoodsRepository _repository;

  RestOfGoodsModel(this._repository);

  Future<Iterable<RestOfGoodsRowData>> getWarehouseGoodsTableData() async {
    final warehouseGoods = await _repository.getWarehouseGoods();
    final vendorCodes = warehouseGoods.data.cards.map((card) => card.vendorCode);
    final barcodes = warehouseGoods.data.cards.map((card) => card.sizes.first.skus.first);

    final warehouseCardsDto = await _getWarehouseCards(vendorCodes);
    final restOfGoods = await _repository.getRestOfGoods(barcodes);

    final rowData = warehouseCardsDto.data.map((card) {
      final barcode = card.sizes.first.skus.first;

      return RestOfGoodsRowData(
        pictureUrl: _getMainPictureUrl(card.mediaFiles),
        name: _getName(card.characteristics),
        supplierArticle: card.vendorCode,
        barcode: barcode,
        quantity: _getQuantity(restOfGoods, barcode),
      );
    });

    return rowData;
  }

  Future<WarehouseCardsResponseDto> _getWarehouseCards(Iterable<String> vendorCodes) async {
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

  String _getMainPictureUrl(Iterable<String> urls) {
    final mainPictureRegExp = RegExp(r'^.+1.jpg$');

    return urls.firstWhere((url) => mainPictureRegExp.hasMatch(url), orElse: () => '');
  }

  String _getName(Iterable<Map<String, dynamic>> characteristics) {
    return characteristics.firstWhere((characteristic) {
      return characteristic.entries.first.key == CardCharacteristics.name;
    })[CardCharacteristics.name];
  }

  int _getQuantity(RestOfGoodsResponseDto restOfGoodsResponseDto, String sku) {
    try {
      return restOfGoodsResponseDto.stocks.firstWhere((stock) => stock.barcode == sku).amount;
    } catch (_) {
      return 0;
    }
  }
}
