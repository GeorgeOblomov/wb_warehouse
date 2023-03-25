import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/models/goods_to_update_initial_data.dart';
import 'package:wb_warehouse/router/app_router.dart';

class ChooseGoodsNavigator {
  final StackRouter _router;

  ChooseGoodsNavigator(BuildContext context) : _router = context.router;

  void goToGoodsToUpdatePage(GoodsToUpdateInitialData initialData) {
    _router.push(GoodsToUpdateRoute(initialData: initialData));
  }
}
