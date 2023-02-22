import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wb_warehouse/app/home_page.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/rest_of_goods_page.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: HomePage,
      initial: true,
      children: [
        AutoRoute(page: RestOfGoodsPage, path: 'first'),
        AutoRoute(page: RestOfGoodsPage, path: 'first'),
        AutoRoute(page: RestOfGoodsPage, path: 'first'),
        RedirectRoute(path: '', redirectTo: 'first'),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}
