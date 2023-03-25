import 'package:wb_warehouse/data_management/models/base_goods_model.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/table_data/rest_of_goods_row_data.dart';
import 'package:wb_warehouse/features/rest_of_goods/repositories/rest_of_goods_repository.dart';

class RestOfGoodsModel extends BaseGoodsModel {
  final RestOfGoodsRepository _restOfGoodsRepository;

  RestOfGoodsModel(this._restOfGoodsRepository) : super(_restOfGoodsRepository);

  @override
  Future<List<RestOfGoodsRowData>> getGoodsTableData() async {
    final warehouseGoods = await _restOfGoodsRepository.getWarehouseGoods();
    final vendorCodes = warehouseGoods.data.cards.map((card) => card.vendorCode);
    final barcodes = warehouseGoods.data.cards.map((card) => card.sizes.first.skus.first);

    final warehouseCardsDto = await getWarehouseCards(vendorCodes);
    final restOfGoods = await _restOfGoodsRepository.getRestOfGoods(barcodes);

    final rowData = warehouseCardsDto.data.map((card) {
      final barcode = card.sizes.first.skus.first;

      return RestOfGoodsRowData(
        pictureUrl: getMainPictureUrl(card.mediaFiles),
        name: getName(card.characteristics),
        supplierArticle: card.vendorCode,
        barcode: barcode,
        quantity: getQuantity(restOfGoods, barcode),
      );
    });

    return rowData.toList();
  }
}
