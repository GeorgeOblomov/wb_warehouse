import 'package:auto_route/auto_route.dart';
import 'package:wb_warehouse/router/app_router.dart';

class RestOfGoodsPageRoute {
  static const name = 'RestOfGoodsPageRouter';

  static const path = 'rest-of-goods-page';

  static final route = AutoRoute(
    page: RestOfGoodsPageRouter.page,
    path: path,
  );
}
