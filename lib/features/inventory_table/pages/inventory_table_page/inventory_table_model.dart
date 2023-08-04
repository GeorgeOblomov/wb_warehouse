import 'package:wb_warehouse/data_management/models/base_goods_model.dart';
import 'package:wb_warehouse/features/inventory_table/pages/inventory_table_page/table_data/inventory_table_data.dart';
import 'package:wb_warehouse/features/inventory_table/repositories/inventory_table_repository.dart';
import 'package:wb_warehouse/features/prices_and_discounts/repositories/prices_and_discounts_repository.dart';
import 'package:wb_warehouse/features/rest_of_goods/repositories/rest_of_goods_repository.dart';

class InventoryTableModel extends BaseGoodsModel {
  final RestOfGoodsRepository _restOfGoodsRepository;
  final PricesAndDiscountsRepository _pricesAndDiscountsRepository;
  // ignore: unused_field
  final InventoryTableRepository _inventoryTableRepository;

  InventoryTableModel(this._inventoryTableRepository, this._pricesAndDiscountsRepository, this._restOfGoodsRepository)
      : super(_restOfGoodsRepository);

  @override
  Future<List<InventoryTableData>> getGoodsTableData() async {
    final warehouseGoods = await _restOfGoodsRepository.getWarehouseGoods();
    final vendorCodes = warehouseGoods.data.cards.map((card) => card.vendorCode);

    final warehouseCardsDto = await getWarehouseCards(vendorCodes);
    final pricesAndDiscountsDtos = await _pricesAndDiscountsRepository.getPricesAndDiscountsGoods();

    final rowData = warehouseCardsDto.data.map((card) {
      final barcode = card.sizes.first.skus.first;
      final nmID = card.nmID;
      final price = pricesAndDiscountsDtos.singleWhere((e) => e.nmId == nmID).price;
      final discount = pricesAndDiscountsDtos.singleWhere((e) => e.nmId == nmID).discount;

      return InventoryTableData(
        pictureUrl: getMainPictureUrl(card.mediaFiles),
        nmId: nmID,
        name: getName(card.characteristics),
        barcode: barcode,
        supplierArticle: card.vendorCode,
        retailPrice: price,
        webSiteDiscount: discount,
      );
    });

    return rowData.toList();
  }
}
