import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/subjects.dart';
import 'package:wb_warehouse/common/ui/table_widget/cell/base_cell_widget.dart';
import 'package:wb_warehouse/common/ui/table_widget/cell/network_image_cell_widget.dart';
import 'package:wb_warehouse/common/ui/table_widget/cell/text_cell_widget.dart';
import 'package:wb_warehouse/common/ui/table_widget/table_widget_data.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/l10n/rest_of_goods_l10n.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/navigation/rest_of_goods_navigator.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/rest_of_goods_model.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/rest_of_goods_page.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/table_data/rest_of_goods_row_data.dart';
import 'package:wb_warehouse/utils/themes/theme_provider.dart';

// ignore_for_file: unused_field
class RestOfGoodsWm extends WidgetModel<RestOfGoodsPage, RestOfGoodsModel> {
  final searchTextController = TextEditingController();

  final RestOfGoodsL10n _l10n;
  final RestOfGoodsNavigator _navigator;

  final _loadingController = StreamController<bool>.broadcast();
  final _tableDataController = BehaviorSubject<TableWidgetData>();
  final _filterController = BehaviorSubject<FilterType>.seeded(FilterType.name);

  var _loadedRows = const Iterable<RestOfGoodsRowData>.empty();

  RestOfGoodsWm(
    this._l10n,
    this._navigator,
    super.model,
  );

  Stream<bool> get loadingStream => _loadingController.stream;
  Stream<TableWidgetData> get tableDataStream => _tableDataController.stream;

  String get updateButtonTitle => _l10n.updateButtonTitle;

  Color get filtersIconColor => context.watch<ThemeProvider>().appTheme.filtersIconColor;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _initialLoading();
  }

  @override
  void dispose() {
    _loadingController.close();
    _tableDataController.close();
    _filterController.close();
    searchTextController.dispose();
    super.dispose();
  }

  Future<void> showFiltersDialog() async {
    final selectedFilter =
        (await _navigator.showFiltersDialog(initialType: _filterController.value)) ?? _filterController.value;

    _filterController.add(selectedFilter);
    _searchProccess(searchTextController.text);
  }

  void onSearchInput(String query) => _searchProccess(query);

  void _searchProccess(String query) {
    final suggestions = _loadedRows.where((row) {
      final filteredRowData = _getFilteredRowData(row).toLowerCase();
      final input = query.toLowerCase();

      return filteredRowData.contains(input);
    });

    final suggestedRows = _loadedRows.where((row) => suggestions.contains(row));
    _tableDataController.add(_getTableData(suggestedRows));
  }

  Future<void> _initialLoading() async {
    _loadingController.add(true);

    _loadedRows = await model.getWarehouseGoodsTableData();
    _tableDataController.add(_getTableData(_loadedRows));
    _loadingController.add(false);
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

  TableWidgetData _getTableData(Iterable<RestOfGoodsRowData> data) {
    return TableWidgetData(
      columnNames: [
        _l10n.pictureColumnTitle,
        _l10n.nameColumnTitle,
        _l10n.supplierArticleColumnTitle,
        _l10n.barcodeColumnTitle,
        _l10n.quantityColumnTitle,
      ],
      rows: data
          .map((e) => <BaseCellWidget>[
                NetworkImageCellWidget(
                  url: e.pictureUrl,
                  onTap: () => onPictureTap(e.pictureUrl!),
                ),
                TextCellWidget(title: e.name, onTap: _onRowTap),
                TextCellWidget(title: e.supplierArticle, onTap: _onRowTap),
                TextCellWidget(title: e.barcode, onTap: _onRowTap),
                TextCellWidget(title: e.quantity.toString(), onTap: _onRowTap),
              ])
          .toList(),
    );
  }

  void onPictureTap(String url) {
    _navigator.showPictureDialog(url);
  }

  // ignore: no-empty-block
  void _onRowTap() {}
}

enum FilterType { name, supplierArticle, barcode }
