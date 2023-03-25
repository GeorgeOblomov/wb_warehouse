import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/goods_to_update_model.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/goods_to_update_wm.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/l10n/goods_to_update_l10n.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/models/goods_to_update_initial_data.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/navigation/goods_to_update_navigator.dart';
import 'package:wb_warehouse/features/prices_and_discounts/repositories/prices_and_discounts_repository.dart';

GoodsToUpdateWm createGoodsToUpdateWm(BuildContext context, GoodsToUpdateInitialData initialData) {
  return GoodsToUpdateWm(
    initialData,
    GoodsToUpdateL10n(context),
    GoodsToUpdateNavigator(context),
    GoodsToUpdateModel(context.read<PricesAndDiscountsRepository>()),
  );
}
