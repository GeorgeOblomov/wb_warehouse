import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/subjects.dart';
import 'package:wb_warehouse/common/ui/table_widget/table_widget_data.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/l10n/rest_of_goods_l10n.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/navigation/rest_of_goods_navigator.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/rest_of_goods_model.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/rest_of_goods_page.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/table_data/rest_of_goods_row_data.dart';
import 'package:wb_warehouse/utils/themes/theme_provider.dart';

// ignore_for_file: unused_field
class RestOfGoodsWm extends WidgetModel<RestOfGoodsPage, RestOfGoodsModel> {
  final RestOfGoodsL10n _l10n;
  final RestOfGoodsNavigator _navigator;

  final _loadingController = StreamController<bool>.broadcast();
  final _tableDataController = BehaviorSubject<TableWidgetData>();

  RestOfGoodsWm(
    this._l10n,
    this._navigator,
    super.model,
  );

  Stream<bool> get loadingStream => _loadingController.stream;
  Stream<TableWidgetData> get tableDataStream => _tableDataController.stream;

  Color get progressIndicatorColor => context.watch<ThemeProvider>().appTheme.progressIndicatorColor;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _initialLoading();
  }

  @override
  void dispose() {
    _loadingController.close();
    _tableDataController.close();
    super.dispose();
  }

  TableWidgetData getTableData() {
    return TableWidgetData(
      columnNames: ['Название', 'Артикул поставщика', 'Баркод', 'Количество', 'Себестоимость', 'Сумма'],
      rows: data
          .map((e) => <String>[e.name, e.supplierArticle, e.barcode, e.quantity.toString(), e.costPrice, e.sum])
          .toList(),
    );
  }

  Future<void> _initialLoading() async {
    _loadingController.add(true);

    return Future.delayed(const Duration(seconds: 2), () {
      _tableDataController.add(getTableData());
      _loadingController.add(false);
    });
  }
}

final data = [
  RestOfGoodsRowData(
    name: 'Grass',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Test',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Lolkek',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'OG KUSH',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Grass',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Grass',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Filter',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Furminator',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Layout',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Grass',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Some good',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Shampoo',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Soap',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Grass',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Grass',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Grass',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Grass',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Grass',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Grass',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Grass',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Grass',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Grass',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Grass',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Grass',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Grass',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Grass',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Grass',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Grass',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Grass',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Grass',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
  RestOfGoodsRowData(
    name: 'Grass',
    supplierArticle: '123456',
    barcode: '456123',
    quantity: 3,
    costPrice: '20₽',
    sum: '60₽',
  ),
];
