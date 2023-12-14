import 'package:auto_route/auto_route.dart';
import 'package:wb_warehouse/router/app_router.dart';

class ReviewsTabRoute {
  static const name = 'ReviewsTabRouter';

  static const path = 'reviews-tab';

  static final route = AutoRoute(
    page: ReviewsTabRouter.page,
    path: path,
  );
}
