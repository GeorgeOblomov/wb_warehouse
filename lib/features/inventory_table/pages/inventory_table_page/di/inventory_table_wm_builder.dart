import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wb_warehouse/features/inventory_table/pages/inventory_table_page/inventory_table_model.dart';
import 'package:wb_warehouse/features/inventory_table/pages/inventory_table_page/inventory_table_wm.dart';
import 'package:wb_warehouse/features/inventory_table/pages/inventory_table_page/l10n/inventory_table_l10n.dart';
import 'package:wb_warehouse/features/inventory_table/pages/inventory_table_page/navigation/inventory_table_navigator.dart';
import 'package:wb_warehouse/features/inventory_table/repositories/inventory_table_repository.dart';
import 'package:wb_warehouse/features/rest_of_goods/repositories/rest_of_goods_repository.dart';

InventoryTableWm createInventoryTableWm(BuildContext context) {
  return InventoryTableWm(
    InventoryTableL10n(context),
    InventoryTableNavigator(context),
    InventoryTableModel(
      context.read<InventoryTableRepository>(),
      context.read<RestOfGoodsRepository>(),
    ),
  );
}
