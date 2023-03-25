import 'package:wb_warehouse/data_management/models/base_goods_model.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/choose_good_page/table_data/prices_and_discounts_goods_row_data.dart';
import 'package:wb_warehouse/features/prices_and_discounts/repositories/prices_and_discounts_repository.dart';
import 'package:wb_warehouse/features/rest_of_goods/repositories/rest_of_goods_repository.dart';

class ChooseGoodsModel extends BaseGoodsModel {
  final PricesAndDiscountsRepository _pricesAndDiscountsRepository;
  final RestOfGoodsRepository _restOfGoodsRepository;

  ChooseGoodsModel(this._pricesAndDiscountsRepository, this._restOfGoodsRepository) : super(_restOfGoodsRepository);

  @override
  Future<List<PricesAndDiscountsGoodsRowData>> getGoodsTableData() async {
    final warehouseGoods = await _restOfGoodsRepository.getWarehouseGoods();
    final vendorCodes = warehouseGoods.data.cards.map((card) => card.vendorCode);
    final warehouseCardsDto = await getWarehouseCards(vendorCodes);
    final pricesAndDiscountsDtos = await _pricesAndDiscountsRepository.getPricesAndDiscountsGoods();

    final rowData = warehouseCardsDto.data.map((card) {
      final barcode = card.sizes.first.skus.first;

      final nmID = card.nmID;
      final price = pricesAndDiscountsDtos.singleWhere((e) => e.nmId == nmID).price;
      final discount = pricesAndDiscountsDtos.singleWhere((e) => e.nmId == nmID).discount;

      return PricesAndDiscountsGoodsRowData(
        nmID: nmID,
        pictureUrl: getMainPictureUrl(card.mediaFiles),
        name: getName(card.characteristics),
        barcode: barcode,
        price: price,
        discount: discount,
      );
    }).toList();

    return rowData;
  }
}
