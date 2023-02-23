import 'package:elementary/elementary.dart';
import 'package:wb_warehouse/common/ui/table_widget/table_widget_data.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/l10n/rest_of_goods_l10n.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/navigation/rest_of_goods_navigator.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/rest_of_goods_model.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/rest_of_goods_page.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/table_data/rest_of_goods_row_data.dart';

// ignore_for_file: unused_field
class RestOfGoodsWm extends WidgetModel<RestOfGoodsPage, RestOfGoodsModel> {
  final RestOfGoodsL10n _l10n;
  final RestOfGoodsNavigator _navigator;

  RestOfGoodsWm(
    this._l10n,
    this._navigator,
    super.model,
  );

  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }

  @override
  void dispose() {
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
