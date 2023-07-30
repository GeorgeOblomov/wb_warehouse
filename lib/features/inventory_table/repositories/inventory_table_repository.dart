import 'package:wb_warehouse/features/inventory_table/data_providers/inventory_table_data_provider.dart';

class InventoryTableRepository {
  final InventoryTableDataProvider inventoryTableDataProvider;

  InventoryTableRepository(this.inventoryTableDataProvider);

  // Future<List<InventoryTable>> getInventoryTable() async {
  //   return inventoryTableDataProvider.getInventoryTable();
  // }
}
