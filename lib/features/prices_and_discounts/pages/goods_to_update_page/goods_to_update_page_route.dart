import 'package:auto_route/auto_route.dart';
import 'package:wb_warehouse/router/app_router.dart';

class GoodsToUpdatePageRoute {
  static const name = 'GoodsToUpdatePageRouter';

  static const path = '/goods-to-update-page-route';

  static final route = AutoRoute(
    page: GoodsToUpdatePageRouter.page,
    path: path,
  );
}
