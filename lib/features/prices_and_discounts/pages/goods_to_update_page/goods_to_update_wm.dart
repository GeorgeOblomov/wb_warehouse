import 'package:elementary/elementary.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/goods_to_update_model.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/goods_to_update_page.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/l10n/goods_to_update_l10n.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/navigation/goods_to_update_navigator.dart';

// ignore_for_file: unused_field
class GoodsToUpdateWm extends WidgetModel<GoodsToUpdatePage, GoodsToUpdateModel> {
  final GoodsToUpdateL10n _l10n;
  final GoodsToUpdateNavigator _navigator;

  GoodsToUpdateWm(
    this._l10n,
    this._navigator,
    super.model,
  );
}
