import 'package:wb_warehouse/common/base_row_data.dart';
import 'package:wb_warehouse/common/ui/table_widget/cell/base_cell_widget.dart';
import 'package:wb_warehouse/common/ui/table_widget/cell/check_box_cell_widget.dart';
import 'package:wb_warehouse/common/ui/table_widget/cell/network_image_cell_widget.dart';
import 'package:wb_warehouse/common/ui/table_widget/cell/text_cell_widget.dart';
import 'package:wb_warehouse/common/ui/table_widget/table_widget_data.dart';
import 'package:wb_warehouse/common/wm/base_goods_wm.dart';
import 'package:wb_warehouse/features/inventory_table/pages/inventory_table_page/inventory_table_model.dart';
import 'package:wb_warehouse/features/inventory_table/pages/inventory_table_page/inventory_table_page.dart';
import 'package:wb_warehouse/features/inventory_table/pages/inventory_table_page/l10n/inventory_table_l10n.dart';
import 'package:wb_warehouse/features/inventory_table/pages/inventory_table_page/navigation/inventory_table_navigator.dart';
import 'package:wb_warehouse/features/inventory_table/pages/inventory_table_page/table_data/inventory_table_data.dart';

class InventoryTableWm extends BaseGoodsWm<InventoryTablePage, InventoryTableModel> {
  final InventoryTableL10n _l10n;
  // ignore: unused_field
  final InventoryTableNavigator _navigator;

  InventoryTableWm(
    this._l10n,
    this._navigator,
    super.model,
  );

  String get editButtonTitle => _l10n.editButtonTitle;
  String get updateDataButtonTitle => _l10n.updateDataButtonTitle;

  void onSearchInput(String query) {
    final suggestions = loadedRows.where((row) {
      final input = query.toLowerCase();

      return row.name.toLowerCase().contains(input);
    }).toList();

    tableDataController.add(organizeTableData(suggestions));
  }

  void onEditTap() {
    // ignore: unused_local_variable
    final selectedRows = loadedRows.where((row) => row.isSelected).toList();

    // _navigator.openEditGoodsPage(EditInventoryGoodsInitialData(selectedRows));
  }

  @override
  TableWidgetData organizeTableData(List<BaseRowData> data) {
    final loadedData = data as List<InventoryTableData>;

    return TableWidgetData(
      columnNames: [
        _l10n.pictureColumnTitle,
        _l10n.wbArticle,
        _l10n.goodArticle,
        _l10n.goodName,
        _l10n.purchasePrice,
        _l10n.packagingCost,
        _l10n.costPrice,
        _l10n.feePercent,
        _l10n.wbLogistics,
        _l10n.taxRate,
        _l10n.discountedPrice,
        _l10n.profit,
        _l10n.marginality,
        _l10n.retailPrice,
        _l10n.webSiteDiscount,
        _l10n.editButtonTitle,
      ],
      rows: loadedData
          .map((e) => <BaseCellWidget>[
                NetworkImageCellWidget(
                  url: e.pictureUrl,
                  onTap: () => onPictureTap(e.pictureUrl!),
                ),
                TextCellWidget(title: e.supplierArticle),
                TextCellWidget(title: e.nmId.toString()),
                TextCellWidget(title: e.name),
                TextCellWidget(title: e.purchasePrice.toString()),
                TextCellWidget(title: e.packagingCost.toString()),
                TextCellWidget(title: e.costPrice.toString()),
                TextCellWidget(title: e.feePercent.toString()),
                TextCellWidget(title: e.wbLogistics.toString()),
                TextCellWidget(title: e.taxRate.toString()),
                TextCellWidget(title: e.discountedPrice.toString()),
                TextCellWidget(title: e.profit.toString()),
                TextCellWidget(title: e.marginality.toString()),
                TextCellWidget(title: e.retailPrice.toString()),
                TextCellWidget(title: e.webSiteDiscount.toString()),
                CheckBoxCellWidget(initialValue: e.isSelected, onChanged: (value) => onSelectItem(e, value)),
              ])
          .toList(),
    );
  }
}
