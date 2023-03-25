import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/subjects.dart';
import 'package:wb_warehouse/common/base_row_data.dart';
import 'package:wb_warehouse/common/ui/table_widget/cell/base_cell_widget.dart';
import 'package:wb_warehouse/common/ui/table_widget/cell/check_box_cell_widget.dart';
import 'package:wb_warehouse/common/ui/table_widget/cell/network_image_cell_widget.dart';
import 'package:wb_warehouse/common/ui/table_widget/cell/text_cell_widget.dart';
import 'package:wb_warehouse/common/ui/table_widget/table_widget_data.dart';
import 'package:wb_warehouse/common/wm/base_goods_wm.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/l10n/rest_of_goods_l10n.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/navigation/rest_of_goods_navigator.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/rest_of_goods_model.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/rest_of_goods_page.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/table_data/rest_of_goods_row_data.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/models/rest_good_item_data.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/models/update_rest_of_goods_initial_data.dart';
import 'package:wb_warehouse/utils/extensions/context_extension.dart';
import 'package:wb_warehouse/utils/themes/theme_provider.dart';

class RestOfGoodsWm extends BaseGoodsWm<RestOfGoodsPage, RestOfGoodsModel> {
  final RestOfGoodsL10n _l10n;
  final RestOfGoodsNavigator _navigator;

  final _filterController = BehaviorSubject<FilterType>.seeded(FilterType.name);

  RestOfGoodsWm(
    this._l10n,
    this._navigator,
    super.model,
  );

  List<RestOfGoodsRowData> get rows => loadedRows as List<RestOfGoodsRowData>;

  String get updateDataButtonTitle => _l10n.updateDataButtonTitle;
  String get updateRestOfGoodsButtonTitle => _l10n.updateRestOfGoodsButtonTitle;

  Color get filtersIconColor => context.watch<ThemeProvider>().appTheme.filtersIconColor;

  @override
  void dispose() {
    _filterController.close();
    super.dispose();
  }

  Future<void> showFiltersDialog() async {
    final selectedFilter = (await _navigator.showFiltersDialog(
          initialType: _filterController.value,
          getFilterTitle: _getFilterTitle,
        )) ??
        _filterController.value;

    _filterController.add(selectedFilter);
    _searchProccess(searchTextController.text);
  }

  void onUpdateRestOfGoodsTap() {
    final selectedRows = rows.where((row) => row.isSelected);
    final initialData = UpdateRestOfGoodsInitialData(itemsData: selectedRows.map((row) {
      return RestGoodItemData(
        url: row.pictureUrl,
        name: row.name,
        barcode: row.barcode,
        amount: row.quantity,
      );
    }));
    _navigator.goToUpdateRestOfGoodsPage(initialData, _onFinishUpdating);
  }

  void onSearchInput(String query) => _searchProccess(query);

  void _searchProccess(String query) {
    final suggestions = rows.where((row) {
      final filteredRowData = _getFilteredRowData(row).toLowerCase();
      final input = query.toLowerCase();

      return filteredRowData.contains(input);
    }).toList();

    tableDataController.add(organizeTableData(suggestions));
  }

  String _getFilteredRowData(RestOfGoodsRowData rowData) {
    switch (_filterController.value) {
      case FilterType.name:
        return rowData.name;
      case FilterType.supplierArticle:
        return rowData.supplierArticle;
      case FilterType.barcode:
        return rowData.barcode;
    }
  }

  @override
  TableWidgetData organizeTableData(List<BaseRowData> data) {
    final loadedData = data as List<RestOfGoodsRowData>;

    return TableWidgetData(
      columnNames: [
        _l10n.pictureColumnTitle,
        _l10n.nameColumnTitle,
        _l10n.supplierArticleColumnTitle,
        _l10n.barcodeColumnTitle,
        _l10n.quantityColumnTitle,
        _l10n.updateRestOfGoods,
      ],
      rows: loadedData
          .map((e) => <BaseCellWidget>[
                NetworkImageCellWidget(
                  url: e.pictureUrl,
                  onTap: () => onPictureTap(e.pictureUrl!),
                ),
                TextCellWidget(title: e.name),
                TextCellWidget(title: e.supplierArticle),
                TextCellWidget(title: e.barcode),
                TextCellWidget(title: e.quantity.toString()),
                CheckBoxCellWidget(initialValue: e.isSelected, onChanged: (value) => onSelectItem(e, value)),
              ])
          .toList(),
    );
  }

  String _getFilterTitle(FilterType type) {
    switch (type) {
      case FilterType.name:
        return context.localizations.restOfGoodsFilterName;
      case FilterType.supplierArticle:
        return context.localizations.restOfGoodsFilterSupplierArticle;
      case FilterType.barcode:
        return context.localizations.restOfGoodsFilterBarcode;
    }
  }

  void _onFinishUpdating() {
    searchTextController.clear();
  }
}

enum FilterType { name, supplierArticle, barcode }
