import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:rxdart/subjects.dart';
import 'package:surf_logger/surf_logger.dart';
import 'package:wb_warehouse/features/prices_and_discounts/dto/request/discounts_request_dto.dart';
import 'package:wb_warehouse/features/prices_and_discounts/dto/request/prices_request_dto.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/goods_to_update_model.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/goods_to_update_page.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/l10n/goods_to_update_l10n.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/models/good_to_update_item_data.dart.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/models/goods_to_update_initial_data.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/navigation/goods_to_update_navigator.dart';
import 'package:wb_warehouse/utils/common_dialogs.dart';
import 'package:wb_warehouse/utils/error_handling/wb_error_handler.dart';

class GoodsToUpdateWm extends WidgetModel<GoodsToUpdatePage, GoodsToUpdateModel> {
  final GoodsToUpdateInitialData _initialData;
  final GoodsToUpdateL10n _l10n;
  final GoodsToUpdateNavigator _navigator;

  final _goodsToUpdateData = <GoodToUpdateItemData>[];

  final _loadingController = StreamController<bool>.broadcast();
  final _goodsToUpdateController = BehaviorSubject<Iterable<GoodToUpdateItemData>>();
  final _canContinueController = StreamController<bool>();

  final _errorHandler = WBErrorHandler();

  GoodsToUpdateWm(
    this._initialData,
    this._l10n,
    this._navigator,
    super.model,
  );

  Stream<bool> get loadingStream => _loadingController.stream;
  Stream<Iterable<GoodToUpdateItemData>> get goodsToUpdateStream => _goodsToUpdateController.stream;
  Stream<bool> get canContinueStream => _canContinueController.stream;

  String get pageTitle => _l10n.goodsToUpdatePageTitle;
  String bottomButtonTitle({required bool isPrices}) =>
      isPrices ? _l10n.goodsToUpdatePricesConfirmDialogTitle : _l10n.goodsToUpdateDiscountsConfirmDialogTitle;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _initialLoading();
  }

  @override
  void dispose() {
    _loadingController.close();
    _goodsToUpdateController.close();
    _canContinueController.close();
    super.dispose();
  }

  void onDeleteItem(GoodToUpdateItemData itemToDelete) {
    _goodsToUpdateData.removeWhere((good) => good.barcode == itemToDelete.barcode);
    _goodsToUpdateController.add(_goodsToUpdateData);
    _canContinueController.add(_goodsToUpdateData.isNotEmpty);
  }

  Future<void> onContinue({required bool isPrices}) async {
    final update = (await showConfirmDialog(
          context: context,
          title:
              isPrices ? _l10n.goodsToUpdatePricesConfirmDialogTitle : _l10n.goodsToUpdateDiscountsConfirmDialogTitle,
          agreeText: _l10n.goodsToUpdateConfirmDialogAgreeText,
          disagreeText: _l10n.goodsToUpdateConfirmDialogDisagreeText,
        )) ??
        false;
    if (!update) return;

    _loadingController.add(true);
    try {
      if (isPrices) {
        final pricesToUpdate = _preparePricesToUpdate();
        await model.updatePrices(pricesToUpdate);
      } else {
        final discountsToUpdate = _prepareDiscountsToUpdate();
        await model.updateDiscounts(discountsToUpdate);
      }
      _navigator.goHome(needToUpdate: true);
    } catch (e, st) {
      Logger.d('Error on updating prices and discounts: $e.\n$st');
      // ignore: use_build_context_synchronously
      _errorHandler.handleError(context, e);
    } finally {
      _loadingController.add(false);
    }
  }

  void onPriceChange(GoodToUpdateItemData selectedGood, String newPrice) {
    final goodToUpdate = _goodsToUpdateData.firstWhere((good) => good.barcode == selectedGood.barcode);
    goodToUpdate.price = newPrice.isEmpty ? 0 : num.parse(newPrice);
  }

  void onDiscountChange(GoodToUpdateItemData selectedGood, String newDiscount) {
    final goodToUpdate = _goodsToUpdateData.firstWhere((good) => good.barcode == selectedGood.barcode);
    goodToUpdate.discount = newDiscount.isEmpty ? 0 : int.parse(newDiscount);
  }

  void _initialLoading() {
    _goodsToUpdateData.addAll(_initialData.goodsToUpdate);
    _goodsToUpdateController.add(_goodsToUpdateData);
  }

  List<PricesRequestDto> _preparePricesToUpdate() {
    return _goodsToUpdateData.map((e) {
      return PricesRequestDto(nmId: e.nmID, price: e.price);
    }).toList();
  }

  List<DiscountsRequestDto> _prepareDiscountsToUpdate() {
    return _goodsToUpdateData.map((e) {
      return DiscountsRequestDto(nm: e.nmID, discount: e.discount);
    }).toList();
  }
}
