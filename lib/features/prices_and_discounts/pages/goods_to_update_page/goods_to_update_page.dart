import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/di/goods_to_update_wm_builder.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/goods_to_update_wm.dart';

class GoodsToUpdatePage extends ElementaryWidget<GoodsToUpdateWm> {
  const GoodsToUpdatePage({super.key}) : super(createGoodsToUpdateWm);

  @override
  Widget build(wm) {
    throw UnimplementedError();
  }
}
