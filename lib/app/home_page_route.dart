import 'package:auto_route/auto_route.dart';
import 'package:wb_warehouse/features/prices_and_discounts/pages/choose_good_page/choose_goods_page_route.dart';
import 'package:wb_warehouse/features/profile/pages/profile_page/profile_page_route.dart';
import 'package:wb_warehouse/features/rest_of_goods/pages/rest_of_goods_page/rest_of_goods_page_route.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/reviews_page_route.dart';
import 'package:wb_warehouse/router/app_router.dart';

class HomePageRoute {
  static const name = 'HomePageRouter';

  static const path = '/home-page';

  static final route = AutoRoute(
    page: HomePageRouter.page,
    path: path,
    initial: true,
    children: [
      RestOfGoodsPageRoute.route,
      ChooseGoodsPageRoute.route,
      ReviewsPageRoute.route,
      ProfilePageRoute.route,
    ],
  );
}
