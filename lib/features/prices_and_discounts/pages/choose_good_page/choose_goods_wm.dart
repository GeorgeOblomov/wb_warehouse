import 'package:wb_warehouse/common/base_row_data.dart';
import 'package:wb_warehouse/common/ui/table_widget/cell/base_cell_widget.dart';
import 'package:wb_warehouse/common/ui/table_widget/cell/check_box_cell_widget.dart';
import 'package:wb_warehouse/common/ui/table_widget/cell/network_image_cell_widget.dart';
import 'package:wb_warehouse/common/ui/table_widget/cell/text_cell_widget.dart';
import 'package:wb_warehouse/common/ui/table_widget/table_widget_data.dart';
import 'package:wb_warehouse/common/wm/base_goods_wm.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/choose_good_page/choose_goods_model.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/choose_good_page/choose_goods_page.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/choose_good_page/l10n/choose_goods_l10n.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/choose_good_page/navigation/choose_goods_navigator.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/choose_good_page/table_data/prices_and_discounts_goods_row_data.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/models/good_to_update_item_data.dart.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/models/goods_to_update_initial_data.dart';

class ChooseGoodsWm extends BaseGoodsWm<ChooseGoodsPage, ChooseGoodsModel> {
  final ChooseGoodsL10n _l10n;
  final ChooseGoodsNavigator _navigator;

  ChooseGoodsWm(
    this._l10n,
    this._navigator,
    super.model,
  );

  String get updatePricesAndDiscountsButtonTitle => _l10n.updatePricesAndDiscountsButtonTitle;

  String get updateDataButtonTitle => _l10n.updateDataButtonTitle;

  void onSearchInput(String query) {
    final suggestions = loadedRows.where((row) {
      final input = query.toLowerCase();

      return row.name.contains(input);
    }).toList();

    tableDataController.add(organizeTableData(suggestions));
  }

  @override
  TableWidgetData organizeTableData(List<BaseRowData> data) {
    final loadedData = data as List<PricesAndDiscountsGoodsRowData>;

    return TableWidgetData(
      columnNames: [
        _l10n.pictureColumnTitle,
        _l10n.nameColumnTitle,
        _l10n.barcodeColumnTitle,
        _l10n.priceColumnTitle,
        _l10n.discountColumnTitle,
        _l10n.updatePriceAndDiscountColumnTitle,
      ],
      rows: loadedData
          .map((e) => <BaseCellWidget>[
                NetworkImageCellWidget(
                  url: e.pictureUrl,
                  onTap: () => onPictureTap(e.pictureUrl!),
                ),
                TextCellWidget(title: e.name),
                TextCellWidget(title: e.barcode),
                TextCellWidget(title: e.price.toString()),
                TextCellWidget(title: e.discount.toString()),
                CheckBoxCellWidget(initialValue: e.isSelected, onChanged: (value) => onSelectItem(e, value)),
              ])
          .toList(),
    );
  }

  void onUpdatePricesAndDiscountsTap() {
    final rows = loadedRows as List<PricesAndDiscountsGoodsRowData>;
    final selectedRows = rows.where((row) => row.isSelected);
    final goodsToUpdate = selectedRows.map((row) {
      return GoodToUpdateItemData(
        nmID: row.nmID,
        pictureUrl: row.pictureUrl,
        name: row.name,
        barcode: row.barcode,
        price: row.price,
        discount: row.discount,
      );
    }).toList();
    final initialData = GoodsToUpdateInitialData(goodsToUpdate: goodsToUpdate);
    _navigator.goToGoodsToUpdatePage(initialData);
  }
}
