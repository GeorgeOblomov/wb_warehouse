import 'package:auto_route/auto_route.dart';
import 'package:wb_warehouse/router/app_router.dart';

class ReviewsPageRoute {
  static const name = 'ReviewsPageRouter';

  static const path = 'review-page';

  static final route = AutoRoute(
    page: ReviewsPageRouter.page,
    path: path,
  );
}
