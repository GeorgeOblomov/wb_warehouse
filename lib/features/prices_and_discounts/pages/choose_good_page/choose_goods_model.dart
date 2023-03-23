import 'package:wb_warehouse/data_management/models/base_goods_model.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/choose_good_page/table_data/prices_and_discounts_goods_row_data.dart';
import 'package:wb_warehouse/features/prices_and_discounts/repositories/prices_and_discounts_repository.dart';
import 'package:wb_warehouse/features/rest_of_goods/repositories/rest_of_goods_repository.dart';

class ChooseGoodsModel extends BaseGoodsModel {
  // ignore: unused_field
  final PricesAndDiscountsRepository _pricesAndDiscountsRepository;
  final RestOfGoodsRepository _restOfGoodsRepository;

  ChooseGoodsModel(this._pricesAndDiscountsRepository, this._restOfGoodsRepository) : super(_restOfGoodsRepository);

  @override
  Future<List<PricesAndDiscountsGoodsRowData>> getGoodsTableData() async {
    final warehouseGoods = await _restOfGoodsRepository.getWarehouseGoods();
    final vendorCodes = warehouseGoods.data.cards.map((card) => card.vendorCode);
    final warehouseCardsDto = await getWarehouseCards(vendorCodes);

    final rowData = warehouseCardsDto.data.map((card) {
      final barcode = card.sizes.first.skus.first;

      return PricesAndDiscountsGoodsRowData(
        pictureUrl: getMainPictureUrl(card.mediaFiles),
        name: getName(card.characteristics),
        barcode: barcode,
        price: 2,
        discount: 2,
      );
    }).toList();

    return rowData;
  }
}
