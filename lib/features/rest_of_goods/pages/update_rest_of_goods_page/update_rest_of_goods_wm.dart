import 'dart:async';

import 'package:surf_logger/surf_logger.dart';
import 'package:elementary/elementary.dart';
import 'package:rxdart/subjects.dart';
import 'package:wb_warehouse/features/rest_of_goods/dto/rest_of_goods_stock_dto.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/l10n/update_rest_of_goods_l10n.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/models/rest_good_item_data.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/models/update_rest_of_goods_initial_data.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/navigation/update_rest_of_goods_navigator.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/update_rest_of_goods_model.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/update_rest_of_goods_page.dart';
import 'package:wb_warehouse/utils/error_handling/wb_error_handler.dart';

class UpdateRestOfGoodsWm extends WidgetModel<UpdateRestOfGoodsPage, UpdateRestOfGoodsModel> {
  final UpdateRestOfGoodsInitialData _initialData;
  final UpdateRestOfGoodsL10n _l10n;
  final UpdateRestOfGoodsNavigator _navigator;

  final _loadingController = StreamController<bool>.broadcast();
  final _restOfGoodsItemsController = BehaviorSubject<Iterable<RestGoodItemData>>();
  final _canContinueController = StreamController<bool>();

  final _goodsToUpdateData = <RestGoodItemData>[];

  final _errorHandler = WBErrorHandler();

  UpdateRestOfGoodsWm(
    this._initialData,
    this._l10n,
    this._navigator,
    super.model,
  );

  Stream<bool> get loadingStream => _loadingController.stream;
  Stream<Iterable<RestGoodItemData>> get restOfGoodsItemsStream => _restOfGoodsItemsController.stream;
  Stream<bool> get canContinueStream => _canContinueController.stream;

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
    _canContinueController.close();
    super.dispose();
  }

  void onDeleteItem(RestGoodItemData selectedItem) {
    _goodsToUpdateData.removeWhere((good) => good.barcode == selectedItem.barcode);
    _restOfGoodsItemsController.add(_goodsToUpdateData);
    _canContinueController.add(_goodsToUpdateData.isNotEmpty);
  }

  void onItemAmountChange(RestGoodItemData itemData, String amount) {
    final itemToUpdate = _goodsToUpdateData.firstWhere((good) => good.barcode == itemData.barcode);
    itemToUpdate.amount = amount.isEmpty ? 0 : int.parse(amount);
  }

  Future<void> onContinue() async {
    final update = (await _navigator.showConfirmDialog(
          _l10n.confirmDialogTitle,
          _l10n.confirmDialogAgree,
          _l10n.confirmDialogDisagree,
        )) ??
        false;
    if (!update) return;

    _loadingController.add(true);
    try {
      final itemsToUpdate = _prepareItemsToUpdate();
      model.updateRestOfGoods(itemsToUpdate);
      _navigator.goHome();
    } catch (e, st) {
      Logger.e('Error on updating rest of goods: $e.\n$st');
      // ignore: use_build_context_synchronously
      _errorHandler.handleError(context, e);
    } finally {
      _loadingController.add(false);
    }
  }

  List<RestOfGoodsStockDto> _prepareItemsToUpdate() {
    return _goodsToUpdateData.map((e) {
      return RestOfGoodsStockDto(barcode: e.barcode, amount: e.amount);
    }).toList();
  }

  void _initialLoading() {
    _goodsToUpdateData.addAll(_initialData.itemsData);
    _restOfGoodsItemsController.add(_goodsToUpdateData);
  }
}
