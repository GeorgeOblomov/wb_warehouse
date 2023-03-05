import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/l10n/update_rest_of_goods_l10n.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/models/update_rest_of_goods_initial_data.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/navigation/update_rest_of_goods_navigator.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/update_rest_of_goods_model.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/update_rest_of_goods_wm.dart';
import 'package:wb_warehouse/features/rest_of_goods/repositories/rest_of_goods_repository.dart';
import 'package:wb_warehouse/utils/extensions/context_extension.dart';

UpdateRestOfGoodsWm createUpdateRestOfGoodsWm(
  BuildContext context,
  UpdateRestOfGoodsInitialData initialData,
) {
  return UpdateRestOfGoodsWm(
    initialData,
    UpdateRestOfGoodsL10n(context.localizations),
    UpdateRestOfGoodsNavigator(context),
    UpdateRestOfGoodsModel(
      context.read<RestOfGoodsRepository>(),
    ),
  );
}
