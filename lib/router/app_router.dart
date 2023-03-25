import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wb_warehouse/app/home_page.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/choose_good_page/choose_goods_page.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/goods_to_update_page.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/goods_to_update_page/models/goods_to_update_initial_data.dart';
import 'package:wb_warehouse/features/profile/pages/profile_page/profile_page.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/rest_of_goods_page.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/models/update_rest_of_goods_initial_data.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/update_rest_of_goods_page/update_rest_of_goods_page.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: HomePage,
      initial: true,
      children: [
        AutoRoute(page: RestOfGoodsPage, path: 'first'),
        AutoRoute(page: ChooseGoodsPage, path: 'second'),
        AutoRoute(page: ProfilePage, path: 'third'),
        RedirectRoute(path: '', redirectTo: 'first'),
      ],
    ),
    AutoRoute(page: UpdateRestOfGoodsPage),
    AutoRoute(page: GoodsToUpdatePage),
  ],
)
class AppRouter extends _$AppRouter {}
