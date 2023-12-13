import 'package:auto_route/auto_route.dart';
import 'package:wb_warehouse/router/app_router.dart';

class UpdateRestOfGoodsPageRoute {
  static const name = 'UpdateRestOfGoodsPageRouter';

  static const path = '/update-rest-of-goods-page';

  static final route = AutoRoute(
    page: UpdateRestOfGoodsPageRouter.page,
    path: path,
  );
}
