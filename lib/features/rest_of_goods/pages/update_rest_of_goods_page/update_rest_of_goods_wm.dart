import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:rxdart/subjects.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/l10n/update_rest_of_goods_l10n.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/models/rest_good_item_data.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/models/update_rest_of_goods_initial_data.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/navigation/update_rest_of_goods_navigator.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/update_rest_of_goods_model.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/update_rest_of_goods_page.dart';

// ignore_for_file: unused_field
class UpdateRestOfGoodsWm extends WidgetModel<UpdateRestOfGoodsPage, UpdateRestOfGoodsModel> {
  final UpdateRestOfGoodsInitialData _initialData;
  final UpdateRestOfGoodsL10n _l10n;
  final UpdateRestOfGoodsNavigator _navigator;

  final _loadingController = StreamController<bool>.broadcast();
  final _restOfGoodsItemsController = BehaviorSubject<Iterable<RestGoodItemData>>();

  final _goodsToUpdateData = <RestGoodItemData>[];

  UpdateRestOfGoodsWm(
    this._initialData,
    this._l10n,
    this._navigator,
    super.model,
  );

  Stream<bool> get loadingStream => _loadingController.stream;
  Stream<Iterable<RestGoodItemData>> get restOfGoodsItemsStream => _restOfGoodsItemsController.stream;

  String get pageTitle => _l10n.pageTitle;
  String get bottomButtonTitle => _l10n.bottomButtonTitle;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _initialLoading();
  }

  @override
  void dispose() {
    _loadingController.close();
    _restOfGoodsItemsController.close();
    super.dispose();
  }

  void onDeleteItem(RestGoodItemData selectedItem) {
    _goodsToUpdateData.removeWhere((good) => good.barcode == selectedItem.barcode);
    _restOfGoodsItemsController.add(_goodsToUpdateData);
  }

  void onItemAmountChange(RestGoodItemData itemData, String amount) {}

  void onContinue() {}

  void _initialLoading() {
    _loadingController.add(true);
    _goodsToUpdateData.addAll(_initialData.itemsData);
    _restOfGoodsItemsController.add(_goodsToUpdateData);
    _loadingController.add(false);
  }
}
