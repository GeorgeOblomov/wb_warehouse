import 'package:wb_warehouse/common/base_row_data.dart';
import 'package:wb_warehouse/data_management/models/base_goods_model.dart';
import 'package:wb_warehouse/features/inventory_table/repositories/inventory_table_repository.dart';
import 'package:wb_warehouse/features/rest_of_goods/repositories/rest_of_goods_repository.dart';

class InventoryTableModel extends BaseGoodsModel {
  final RestOfGoodsRepository _restOfGoodsRepository;
  final InventoryTableRepository _inventoryTableRepository;

  InventoryTableModel(this._inventoryTableRepository, this._restOfGoodsRepository) : super(_restOfGoodsRepository);

  @override
  Future<List<BaseRowData>> getGoodsTableData() {
    throw UnimplementedError();
  }
}
