import 'package:elementary/elementary.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/choose_good_page/choose_goods_model.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/choose_good_page/choose_goods_page.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/choose_good_page/l10n/choose_goods_l10n.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/choose_good_page/navigation/choose_goods_navigator.dart';

// ignore_for_file: unused_field
class ChooseGoodsWm extends WidgetModel<ChooseGoodsPage, ChooseGoodsModel> {
  final ChooseGoodsL10n _l10n;
  final ChooseGoodsNavigator _navigator;

  ChooseGoodsWm(
    this._l10n,
    this._navigator,
    super.model,
  );
}
