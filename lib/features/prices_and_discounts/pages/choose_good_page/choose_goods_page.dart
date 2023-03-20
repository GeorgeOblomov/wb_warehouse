import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/choose_good_page/choose_goods_wm.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/choose_good_page/di/choose_goods_wm_builder.dart';

class ChooseGoodsPage extends ElementaryWidget<ChooseGoodsWm> {
  const ChooseGoodsPage({super.key}) : super(createChooseGoodsWm);

  @override
  Widget build(wm) {
    return Scaffold(body: Container());
  }
}
