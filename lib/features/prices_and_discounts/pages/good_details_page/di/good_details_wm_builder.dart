import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/good_details_page/good_details_model.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/good_details_page/good_details_wm.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/good_details_page/l10n/good_details_l10n.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/good_details_page/navigation/good_details_navigator.dart';
import 'package:wb_warehouse/features/prices_and_discounts/repositories/prices_and_discounts_repository.dart';

GoodDetailsWm createGoodDetailsWm(BuildContext context) {
  return GoodDetailsWm(
    GoodDetailsL10n(context),
    GoodDetailsNavigator(context),
    GoodDetailsModel(context.read<PricesAndDiscountsRepository>()),
  );
}
