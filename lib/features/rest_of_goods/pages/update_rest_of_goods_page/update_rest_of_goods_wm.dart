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

  UpdateRestOfGoodsWm(
    this._initialData,
    this._l10n,
    this._navigator,
    super.model,
  );

  Stream<bool> get loadingStream => _loadingController.stream;
  Stream<Iterable<RestGoodItemData>> get restOfGoodsItemsStream => _restOfGoodsItemsController.stream;

  String get pageTitle => _l10n.pageTitle;

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

  void _initialLoading() {
    _loadingController.add(true);
    _restOfGoodsItemsController.add(_initialData.itemsData);
    _loadingController.add(false);
  }
}
