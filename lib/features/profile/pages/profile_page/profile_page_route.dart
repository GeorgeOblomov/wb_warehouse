import 'package:auto_route/auto_route.dart';
import 'package:wb_warehouse/router/app_router.dart';

class ProfilePageRoute {
  static const name = 'ProfilePageRouter';

  static const path = 'profile-page-router';

  static final route = AutoRoute(
    page: ProfilePageRouter.page,
    path: path,
  );
}
