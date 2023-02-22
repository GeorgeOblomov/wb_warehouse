import 'package:elementary/elementary.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/l10n/rest_of_goods_l10n.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/navigation/rest_of_goods_navigator.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/rest_of_goods_model.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/rest_of_goods_page.dart';

class RestOfGoodsWm extends WidgetModel<RestOfGoodsPage, RestOfGoodsModel> {
  // ignore: unused_field
  final RestOfGoodsL10n _l10n;
  // ignore: unused_field
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
}
