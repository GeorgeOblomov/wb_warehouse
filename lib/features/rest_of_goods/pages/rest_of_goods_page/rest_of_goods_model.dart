import 'package:elementary/elementary.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/table_data/rest_of_goods_row_data.dart';
import 'package:wb_warehouse/features/rest_of_goods/repositories/rest_of_goods_repository.dart';

class RestOfGoodsModel extends ElementaryModel {
  final RestOfGoodsRepository _repository;

  RestOfGoodsModel(this._repository);

  Future<Iterable<RestOfGoodsRowData>> getWarehouseGoodsTableData() async {
    await _repository.getWarehouses();
    // final warehouseGoods = await _repository.getWaregouseGoods();
    // final restOfGoods = await _repository.getRestOfGoods();

    return [];
  }
}
