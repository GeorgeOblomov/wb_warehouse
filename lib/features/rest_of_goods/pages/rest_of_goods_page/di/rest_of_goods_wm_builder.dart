import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/l10n/rest_of_goods_l10n.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/navigation/rest_of_goods_navigator.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/rest_of_goods_model.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/rest_of_goods_wm.dart';
import 'package:wb_warehouse/utils/extensions/context_extension.dart';

RestOfGoodsWm createRestOfGoodsWm(BuildContext context) {
  return RestOfGoodsWm(
    RestOfGoodsL10n(context.localizations),
    RestOfGoodsNavigator(context.router),
    RestOfGoodsModel(),
  );
}
