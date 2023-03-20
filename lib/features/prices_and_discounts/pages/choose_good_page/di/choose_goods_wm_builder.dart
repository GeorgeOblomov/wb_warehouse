import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/choose_good_page/choose_goods_model.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/choose_good_page/choose_goods_wm.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/choose_good_page/l10n/choose_goods_l10n.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/choose_good_page/navigation/choose_goods_navigator.dart';
import 'package:wb_warehouse/features/prices_and_discounts/repositories/prices_and_discounts_repository.dart';

ChooseGoodsWm createChooseGoodsWm(BuildContext context) {
  return ChooseGoodsWm(
    ChooseGoodsL10n(context),
    ChooseGoodsNavigator(context),
    ChooseGoodsModel(context.read<PricesAndDiscountsRepository>()),
  );
}
