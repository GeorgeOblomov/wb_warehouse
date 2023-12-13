import 'package:auto_route/auto_route.dart';
import 'package:wb_warehouse/router/app_router.dart';

class ChooseGoodsPageRoute {
  static const name = 'ChooseGoodsPageRouter';

  static const path = 'choose-goods-page';

  static final route = AutoRoute(
    page: ChooseGoodsPageRouter.page,
    path: path,
  );
}
