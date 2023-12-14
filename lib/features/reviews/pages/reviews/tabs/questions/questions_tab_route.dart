import 'package:auto_route/auto_route.dart';
import 'package:wb_warehouse/router/app_router.dart';

class QuestionsTabRoute {
  static const name = 'QuestionsTabRouter';

  static const path = 'questions-tab';

  static final route = AutoRoute(
    page: QuestionsTabRouter.page,
    path: path,
  );
}
