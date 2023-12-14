import 'package:auto_route/auto_route.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/tabs/questions/questions_tab_route.dart';
import 'package:wb_warehouse/features/reviews/pages/reviews/tabs/reviews/reviews_tab_route.dart';
import 'package:wb_warehouse/router/app_router.dart';

class ReviewsPageRoute {
  static const name = 'ReviewsPageRouter';

  static const path = 'review-page';

  static final route = AutoRoute(page: ReviewsPageRouter.page, path: path, children: [
    ReviewsTabRoute.route,
    QuestionsTabRoute.route,
  ]);
}
