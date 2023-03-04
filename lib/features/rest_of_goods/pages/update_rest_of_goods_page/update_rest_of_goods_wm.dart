import 'package:elementary/elementary.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/l10n/update_rest_of_goods_l10n.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/navigation/update_rest_of_goods_navigator.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/update_rest_of_goods_model.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/update_rest_of_goods_page.dart';

// ignore_for_file: unused_field
class UpdateRestOfGoodsWm extends WidgetModel<UpdateRestOfGoodsPage, UpdateRestOfGoodsModel> {
  final UpdateRestOfGoodsL10n _l10n;
  final UpdateRestOfGoodsNavigator _navigator;

  UpdateRestOfGoodsWm(
    this._l10n,
    this._navigator,
    super.model,
  );
}
